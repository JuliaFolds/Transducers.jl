using Transducers

struct Vacant
    l::String
    r::String
end

maybewordt(s) = isempty(s) ? () : (s,)

extract(x::Chunk, y::Chunk) = (), Chunk(x.s * y.s)
extract(x::Chunk, y::Vacant) = (), Vacant(x.s * y.l, y.r)
extract(x::Vacant, y::Chunk) = (), Vacant(x.l, x.r * y.s)
extract(x::Vacant, y::Vacant) = maybewordt(x.r * y.l), Vacant(x.l, y.r)

lastword(x::Chunk) = maybewordt(x.s)
lastword(x::Vacant) = (maybewordt(x.r)..., maybewordt(x.l)...)

processchart(c::Char) = c == ' ' ? Vacant("", "") : Chunk(string(c))

wordsxf = Map(processchart) |> ScanEmit(extract, Chunk(""), lastword) |> Cat()

collectwords2(s::String) = collect(wordsxf, s)
