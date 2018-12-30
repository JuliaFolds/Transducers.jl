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
