# # Splitting a string into words and counting them in parallel
#
# We start from the parallel algorithm presented in Guy Steele's 2009
# ICFP talk [(video)](https://vimeo.com/6624203).  It splits a
# space-separated string into list of strings (words).

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

processcharl(c::Char) = c == ' ' ? Segment() : Chunk(string(c))

function collectwords(s::String)
    g = mapfoldl(processcharl, ⊕, s; init=Segment())
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

# Let's try to make it re-usable by packaging it into transducers.

using Transducers

# Rather than accumulating words into a vector, we want to "emit" a
# word as soon as it is ready.  To this end, we replace `Segment` in
# the original algorithm to

struct Vacant
    l::String
    r::String
end

# and output words in the middle without accumulating it.  We use
# [`ScanEmit`](@ref) which requires an operator/function like `⊕`
# above but returning a pair of output and next state.

maybewordt(s) = isempty(s) ? () : (s,)

extract(x::Chunk, y::Chunk) = (), Chunk(x.s * y.s)
extract(x::Chunk, y::Vacant) = (), Vacant(x.s * y.l, y.r)
extract(x::Vacant, y::Chunk) = (), Vacant(x.l, x.r * y.s)
extract(x::Vacant, y::Vacant) = maybewordt(x.r * y.l), Vacant(x.l, y.r)

# `maybewordt(x.r * y.l)` in the last line is the "emission".

lastword(x::Chunk) = maybewordt(x.s)
lastword(x::Vacant) = (maybewordt(x.r)..., maybewordt(x.l)...)

processchart(c::Char) = c == ' ' ? Vacant("", "") : Chunk(string(c))

wordsxf = Map(processchart) |> ScanEmit(extract, Chunk(""), lastword) |> Cat()

# Test:

@testset begin
    @test collect(wordsxf, "This is a sample") == ["is", "a", "sample", "This"]
    @test collect(wordsxf, " Here is another sample ") == ["Here", "is", "another", "sample"]
    @test collect(wordsxf, "JustOneWord") == ["JustOneWord"]
    @test collect(wordsxf, " ") == []
    @test collect(wordsxf, "") == []
end

# We can pipe the resulting words into various transducers.

processcount(x) = Base.ImmutableDict(x => 1)

countxf = wordsxf |> Map(processcount)

countwords(s; kwargs...) =
    mapreduce(Map(Char) |> countxf,
              (xs...) -> merge(+, xs...),
              transcode(UInt8, s);
              init = Base.ImmutableDict{String,Int}(),
              kwargs...)

# Side note: we are (ab)using the fact that merging `ImmutableDict`s
# yields a `Dict`:

@assert merge(Base.ImmutableDict{String,Int}(),
              Base.ImmutableDict{String,Int}()) isa Dict{String,Int}

# Test:

@testset begin
    @test countwords("This is a sample") ==
        Dict("This" => 1, "is" => 1, "a" => 1, "sample" => 1)
    @test countwords(" Here is another sample ") ==
        Dict("Here" => 1, "is" => 1, "another" => 1, "sample" => 1)
    @test countwords("JustOneWord") == Dict("JustOneWord" => 1)
    @test countwords(" ") == Dict()
    @test countwords("") == Dict()
end
