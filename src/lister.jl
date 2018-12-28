import Markdown

struct TransducerLister
    m::Module
end

TransducerLister() = TransducerLister(@__MODULE__)

is_transducer_type(t) = t isa Type && t <: Transducer

Transducer(tl::TransducerLister) =
    Filter(x -> is_transducer_type(getproperty(tl.m, x))) |>
    Map(x -> Docs.Binding(tl.m, x))

(tl::TransducerLister)() = eduction(Transducer(tl), names(tl.m))

header_code(m::Markdown.MD) =
    if !isempty(m.content)
        header_code(m.content[1])
    end
header_code(c::Markdown.Code) = c
header_code(::Any) = nothing

hasdoc(m::Module, b::Docs.Binding) = haskey(Docs.meta(m), b)

function Base.show(io::IO, ::MIME"text/markdown", tl::TransducerLister)
    println(io, "| **Transducer** |")
    println(io, "|:-- |")
    for binding in tl()
        hasdoc(tl.m, binding) || continue
        d = Docs.doc(binding)
        h = header_code(d)
        if h === nothing
            shown = binding.var
        else
            shown, = split(h.code, "\n", limit=2)
        end
        println(io, "| [`", shown, "`](@ref ", binding, ") |")
    end
end

function Markdown.MD(tl::TransducerLister)
    io = IOBuffer()
    show(io, "text/markdown", tl)
    seek(io, 0)
    return Markdown.parse(io)
end

Base.show(io::IO, mime::MIME"text/plain", tl::TransducerLister) =
    _show(io, mime, tl)
Base.show(io::IO, mime::MIME"text/html", tl::TransducerLister) =
    _show(io, mime, tl)

_show(io, mime, tl) = show(io, mime, Markdown.MD(tl))
