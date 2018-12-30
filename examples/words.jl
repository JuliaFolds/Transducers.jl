# # Splitting a string into words and counting them in parallel
#
# We start from the parallel algorithm presented in Guy Steele's 2009
# ICFP talk [(video)](https://vimeo.com/6624203).  It splits a
# space-separated string into list of strings (words).  The repeating
# theme in the talk was to build "singleton solutions" and then merge
# them together using an associative function.  We will follow this
# guideline and slightly extend the algorithm.
#
# Here is the original algorithm, re-written in Julia:

struct Chunk
    s::String
end

struct Segment
    l::String
    A::Vector{String}
    r::String
end

Segment() = Segment("", [], "")

maybewordv(s::String) = isempty(s) ? String[] : [s]

⊕(x::Chunk, y::Chunk) = Chunk(x.s * y.s)
⊕(x::Chunk, y::Segment) = Segment(x.s * y.l, y.A, y.r)
⊕(x::Segment, y::Chunk) = Segment(x.l, x.A, x.r * y.s)
⊕(x::Segment, y::Segment) =
    Segment(x.l,
            append!(append!(x.A, maybewordv(x.r * y.l)), y.A),
            y.r)

segmentorchunk(c::Char) = c == ' ' ? Segment() : Chunk(string(c))

function collectwords(s::String)
    g = mapfoldl(segmentorchunk, ⊕, s; init=Segment())
    if g isa Char
        return maybewordv(g.s)
    else
        return append!(append!(maybewordv(g.l), g.A), maybewordv(g.r))
    end
end
nothing  # hide

# Here is how it works:

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

# `maybewordt(x.r * y.l)` in the last line is the "emission".
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
# function `mergecont`:

mergecont(a, b) = merge(+, a, b)
mergecont(a) = a
nothing  # hide

# Note that the unary form is required for the completion.
# Alternatively, we can use [`Completing((a, b) -> merge(+, a,
# b))`](@ref Completing) instead of `mergecont`.  Putting the
# transducer and reducing function together, we get:

countwords(s; kwargs...) =
    mapreduce(Map(Char) |> countxf,
              mergecont,
              transcode(UInt8, s);
              init = Base.ImmutableDict{String,Int}(),
              kwargs...)
nothing  # hide

# Side note: Since [`mapreduce`](@ref) does not support string, the
# input string is converted to a `Vector{UInt8}` first by `transcode`.
# That's why there is `Map(Char) |>` before `countxf`.  Of course,
# this is not valid for UTF-8 in general.
#
# Side note 2: we are (ab)using the fact that merging `ImmutableDict`s
# yields a `Dict`:

@assert merge(Base.ImmutableDict{String,Int}(),
              Base.ImmutableDict{String,Int}()) isa Dict{String,Int}

# Let's run some tests with different number of threads:

@testset for nthreads in [1, 2, 4]
    @test countwords("This is a sample", nthreads=nthreads) ==
        Dict("This" => 1, "is" => 1, "a" => 1, "sample" => 1)
    @test countwords(" Here is another sample ", nthreads=nthreads) ==
        Dict("Here" => 1, "is" => 1, "another" => 1, "sample" => 1)
    @test countwords("JustOneWord", nthreads=nthreads) ==
        Dict("JustOneWord" => 1)
    @test countwords(" ", nthreads=nthreads) == Dict()
    @test countwords("", nthreads=nthreads) == Dict()
    @test countwords("aaa bb aaa aaa bb bb aaa", nthreads=nthreads) ==
        Dict("aaa" => 4, "bb" => 3)
end
nothing  # hide
