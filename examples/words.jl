# # [Splitting a string into words and counting them in parallel](@id parallel-word-count)
#
# We start from the parallel algorithm presented in Guy Steele's 2009
# ICFP talk [(video)](https://vimeo.com/6624203).  It splits a
# space-separated string into list of strings (words).  The repeating
# theme in the talk was to build "singleton solutions" and then merge
# them together using an associative function.  We will follow this
# guideline and slightly extend the algorithm.
#
# It is highly recommended to just watch the talk for understanding
# the algorithm.  However, we briefly describe how it works.
#
# When a certain contiguous region of a string is processed, we either
# already have seen at least one space or not.  These two states are
# tracked using following two types.  If there is no space so far, we
# only have a chunk of a possibly larger word (see example below):

struct Chunk
    s::String
end

# If there are one or more spaces, (possibly zero) words that are
# already determined and left/right "chunks" have to be tracked
# separately:

struct Segment
    l::String
    A::Vector{String}
    r::String
end

# Here is an example taken from the talk:
#
# ```
# Segment("Here", ["is", "a"], "")
#    |
#    |       Segment("lian", [], "string")
#  __|_____            _|______
# |        |          |        |
# Here is a sesquipedalian string of words
#           |________|          |________|
#    Chunk("sesquipeda")        Segment("g", ["of"], "words")
# ```

# We then need a way to merge two results which can independently in
# one of the above two states.

⊕(x::Chunk, y::Chunk) = Chunk(x.s * y.s)
⊕(x::Chunk, y::Segment) = Segment(x.s * y.l, y.A, y.r)
⊕(x::Segment, y::Chunk) = Segment(x.l, x.A, x.r * y.s)
⊕(x::Segment, y::Segment) =
    Segment(x.l,
            append!(append!(x.A, maybewordv(x.r * y.l)), y.A),
            y.r)

maybewordv(s::String) = isempty(s) ? String[] : [s]
nothing  # hide

# Input is a sequence of `Char`s.  Each of them has to be converted
# into a "singleton solution" which can be merged with already
# aggregated (or another singleton) solution with `⊕`:

segment_or_chunk(c::Char) = c == ' ' ? Segment("", [], "") : Chunk(string(c))
nothing  # hide

# Putting them together, we get:

function collectwords(s::String)
    g = mapfoldl(segment_or_chunk, ⊕, s; init=Segment("", [], ""))
    if g isa Char
        return maybewordv(g.s)
    else
        return append!(append!(maybewordv(g.l), g.A), maybewordv(g.r))
    end
end
nothing  # hide

# Let's run a few tests covering some edge cases:

using Test
@testset begin
    @test collectwords("This is a sample") == ["This", "is", "a", "sample"]
    @test collectwords(" Here is another sample ") == ["Here", "is", "another", "sample"]
    @test collectwords("JustOneWord") == ["JustOneWord"]
    @test collectwords(" ") == []
    @test collectwords("") == []
end
nothing  # hide

# ## String-splitting transducer
#
# Let's make it re-usable by packaging it into a transducer.

# Rather than accumulating words into a vector, we are going to write
# a transducer that "emits" a word as soon as it is ready.  The
# downstream transducer may choose to record everything or only
# aggregate, e.g., reduced statistics.  To this end, we replace
# `Segment` in the original algorithm with

struct Vacant
    l::String
    r::String
end

# and output the words in the "middle" without accumulating it.  So,
# instead of `segment_or_chunk`, we now have:

vacant_or_chunk(c::Char) = c == ' ' ? Vacant("", "") : Chunk(string(c))
nothing  # hide

# The idea is to create a custom transducer `WordsXF` that is used as
# in
#
# ```julia
# ... |> Map(vacant_or_chunk) |> WordsXF() |> Filter(!isnothing) |> ...
# ```
#
# so that the whole transducer streams non-empty words to the
# downstream.  That is to say, the input stream is first processed by
# `vacant_or_chunk` which returns either a `Vacant` or a `Chunk`.
# This is processed by `WordsXF()` which outputs either a word (a
# `String`) or `nothing`.  We are using `Filter(!isnothing)` in the
# downstream to simplify the definition of `WordsXF`.
#
# We define a function `extract(x::Union{Chunk,Vacant},
# y::Union{Chunk,Vacant}) -> (output, state)`.  It is something like
# `⊕` but works with `Chunk` and `Vacant`:

extract(x::Chunk, y::Chunk) = nothing, Chunk(x.s * y.s)
extract(x::Chunk, y::Vacant) = nothing, Vacant(x.s * y.l, y.r)
extract(x::Vacant, y::Chunk) = nothing, Vacant(x.l, x.r * y.s)
extract(x::Vacant, y::Vacant) = maybeword(x.r * y.l), Vacant(x.l, y.r)

maybeword(s) = isempty(s) ? nothing : s
nothing  # hide

# Let's wrap this in a [`Transducer`](@ref).

using Transducers
using Transducers:
    @next, R_, Transducer, combine, complete, inner, next, start, unwrap, wrap, wrapping

# First, we declare a transducer type:

struct WordsXF <: Transducer end
nothing  # hide

# Since this transducer has to keep "unfinished" words as its own
# private state, we use [`wrap`](@ref Transducers.wrap) inside
# [`start`](@ref Transducers.start) to prepare the state for it:

Transducers.start(rf::R_{WordsXF}, init) = wrap(rf, Chunk(""), start(inner(rf), init))
nothing  # hide

# Inside of [`next`](@ref Transducers.complete) (i.e., "loop body") we
# call `extract` defined above to combine the input
# `x::Union{Chunk,Vacant}` into `state::Union{Chunk,Vacant}`.  If
# `extract` returns a word, it is passed to the inner reducing
# function:

function Transducers.next(rf::R_{WordsXF}, acc, x)
    wrapping(rf, acc) do state, iacc
        word, state = extract(state, x)
        iacc = next(inner(rf), iacc, word)
        return state, iacc
    end
end
nothing  # hide

# At the end of a fold, [`complete`](@ref Transducers.complete) is
# called.  We can process unfinished words at this stage.  Note that
# we need to use [`combine`](@ref Transducers.combine) of the inner
# reducing function (assuming it is associative) to "prepend" a word
# to the accumulated state of the inner reducing function.

function Transducers.complete(rf::R_{WordsXF}, acc)
    state, iacc = unwrap(rf, acc)
    if state isa Vacant
        pre = @next(inner(rf), start(inner(rf), Init), maybeword(state.l))
        iacc = combine(inner(rf), pre, iacc)  # prepending `state.l`
        iacc = @next(inner(rf), iacc, maybeword(state.r))  # appending `state.r`
    else
        @assert state isa Chunk
        iacc = @next(inner(rf), iacc, maybeword(state.s))
    end
    return complete(inner(rf), iacc)
end
nothing  # hide

# That's all we need for using this transducer with sequential folds.
# For parallel reduce we need [`combine`](@ref Transducers.combine).
# It is more or less identical to `next`:

function Transducers.combine(rf::R_{WordsXF}, a, b)
    ua, ira = unwrap(rf, a)
    ub, irb = unwrap(rf, b)
    word, uc = extract(ua, ub)
    ira = @next(inner(rf), ira, word)
    irc = combine(inner(rf), ira, irb)
    return wrap(rf, uc, irc)
end
nothing  # hide

using Compat: isnothing  #src
wordsxf = opcompose(Map(vacant_or_chunk), WordsXF(), Filter(!isnothing))
nothing  # hide

# Test:

@testset begin
    @test collect(wordsxf, "This is a sample") == ["This", "is", "a", "sample"]
    @test collect(wordsxf, " Here is another sample ") == ["Here", "is", "another", "sample"]
    @test collect(wordsxf, "JustOneWord") == ["JustOneWord"]
    @test collect(wordsxf, " ") == []
    @test collect(wordsxf, "") == []
end
nothing  # hide

# ## Word-counting transducer
#
# We can pipe the resulting words into various transducers.

using MicroCollections: SingletonDict

processcount(word) = SingletonDict(word => 1)
countxf = opcompose(wordsxf, Map(processcount))

# Transducer `countxf` constructs a "singleton solution" as a
# dictionary which then accumulated with the associative reducing step
# function `mergewith!!(+)` from BangBang.jl:

using BangBang: mergewith!!
nothing  # hide

# Putting the transducer and reducing function together, we get:

countwords(s; kwargs...) =
    foldxt(mergewith!!(+), countxf, s; init = CopyInit(Dict{String,Int}()), kwargs...)
nothing  # hide

# Side note: We use [`CopyInit`](@ref) to create a fresh initial
# state for each sub-reduce to avoid overwriting mutable data between
# threads.

# Let's run some tests with different `basesize` (`length(s) /
# basesize` corresponds to number of tasks to be used):

@testset for basesize in [1, 2, 4]
    @test countwords("This is a sample", basesize=basesize) ==
        Dict("This" => 1, "is" => 1, "a" => 1, "sample" => 1)
    @test countwords(" Here is another sample ", basesize=basesize) ==
        Dict("Here" => 1, "is" => 1, "another" => 1, "sample" => 1)
    @test countwords("JustOneWord", basesize=basesize) ==
        Dict("JustOneWord" => 1)
    @test countwords(" ", basesize=basesize) == Dict()
    @test countwords("", basesize=basesize) == Dict()
    @test countwords("aaa bb aaa aaa bb bb aaa", basesize=basesize) ==
        Dict("aaa" => 4, "bb" => 3)
    @test countwords("あああ いい あああ あああ いい いい あああ", basesize=basesize) ==
        Dict("あああ" => 4, "いい" => 3)
end
nothing  # hide
