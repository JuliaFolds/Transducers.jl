# # Splitting a string into words and counting them in parallel
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

segmentorchunk(c::Char) = c == ' ' ? Segment("", [], "") : Chunk(string(c))
nothing  # hide

# Putting them together, we get:

function collectwords(s::String)
    g = mapfoldl(segmentorchunk, ⊕, s; init=Segment("", [], ""))
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
# Let's try to make it re-usable by packaging it into transducers.

using Transducers

# Rather than accumulating words into a vector, we are going to write
# a transducer that "emits" a word as soon as it is ready.  The
# downstream transducer may choose to record everything or only
# aggregate, e.g., reduced statistics.  To this end, we replace
# `Segment` in the original algorithm to

struct Vacant
    l::String
    r::String
end

# and output the words in the "middle" without accumulating it.  We
# use [`ScanEmit`](@ref) which requires an operator/function like `⊕`
# above but returning a pair of output and next state.  This function
# (`extract` below) must have the signature `(S, S) -> (O, S)` where
# `S` is the type for accumulated state and input and `O` is the
# output type.

extract(x::Chunk, y::Chunk) = (), Chunk(x.s * y.s)
extract(x::Chunk, y::Vacant) = (), Vacant(x.s * y.l, y.r)
extract(x::Vacant, y::Chunk) = (), Vacant(x.l, x.r * y.s)
extract(x::Vacant, y::Vacant) = maybewordt(x.r * y.l), Vacant(x.l, y.r)

maybewordt(s) = isempty(s) ? () : (s,)
nothing  # hide

# `maybewordt(x.r * y.l)` in `extract(x::Vacant, y::Vacant)` is the
# "emission".
#
# The words at the beginning and/or the end are not handled by
# `extract`.  This must be handled separately:

lastword(x::Chunk) = maybewordt(x.s)
lastword(x::Vacant) = (maybewordt(x.r)..., maybewordt(x.l)...)

vacantorchunk(c::Char) = c == ' ' ? Vacant("", "") : Chunk(string(c))

wordsxf = Map(vacantorchunk) |> ScanEmit(extract, Chunk(""), lastword) |> Cat()

# Test:

@testset begin
    @test collect(wordsxf, "This is a sample") == ["is", "a", "sample", "This"]
    @test collect(wordsxf, " Here is another sample ") == ["Here", "is", "another", "sample"]
    @test collect(wordsxf, "JustOneWord") == ["JustOneWord"]
    @test collect(wordsxf, " ") == []
    @test collect(wordsxf, "") == []
end
nothing  # hide

# Side note: In the first example, the first word `This` comes last.
# This is actually expected since both `.l` and `.r` are flushed in
# `lastword` which is called at the very end.  Here, `This` is stored
# in `.l` field.  If the order of the words is important, there are
# many possible fixes.  For example, `extract` and `lastword` can
# bundle information about the origin of the word (left vs
# middle-or-right).  Alternatively, perhaps the easiest solution is to
# insert a space in the beginning of input data.
#
# ## Word-counting transducer
#
# We can pipe the resulting words into various transducers.

processcount(word) = Base.ImmutableDict(word => 1)
countxf = wordsxf |> Map(processcount)

# Transducer `countxf` constructs a "singleton solution" as a
# dictionary which then accumulated with the associative reducing step
# function `mergecont!`:

mergecont!(a, b) = merge!(+, a, b)
nothing  # hide

# Putting the transducer and reducing function together, we get:

countwords(s; kwargs...) =
    reduce(mergecont!,
           Map(Char) |> countxf,
           transcode(UInt8, s);
           init = CopyInit(Dict{String,Int}()),
           kwargs...)
nothing  # hide

# Side note: Since [`reduce`](@ref) does not support string, the input
# string is converted to a `Vector{UInt8}` first by `transcode`.
# That's why there is `Map(Char) |>` before `countxf`.  Of course,
# this is not valid for UTF-8 in general.
#
# Side note 2: We use [`CopyInit`](@ref) to create a fresh initial
# state for each sub-reduce to avoid overwriting mutable data between
# threads.
#
# Side note 3: [`reduce`](@ref) wraps `mergecont!` automatically with
# [`Completing`](@ref).  This is why `mergecont!` does not have to
# have the unary method.

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
end
nothing  # hide
