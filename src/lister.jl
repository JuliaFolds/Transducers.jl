import Markdown

const _unexported_public_api = Any[
    ## ../docs/src/manual.md
    # Experimental
    channel_unordered,
    append_unordered!,
    ZipSource,
    GetIndex,
    SetIndex,
    Inject,
    ## ../docs/src/interface.md
    # Core interface for transducers
    Transducer,
    AbstractFilter,
    R_,
    inner,
    xform,
    start,
    next,
    complete,
    # Helpers for stateful transducers
    wrap,
    unwrap,
    wrapping,
    # Interface for reducibles
    __foldl__,
    getproperty(@__MODULE__, Symbol("@return_if_reduced")),
    getproperty(@__MODULE__, Symbol("@next")),
]

const _explicit_internal_list = Any[
    # Manually list some internal objects to avoid Documenter.jl's
    # "docstring potentially missing" warning:
    DefaultInit,
]

is_internal(@nospecialize(t)) =
    t ∈ _explicit_internal_list ||
    (parentmodule(t) === @__MODULE__) && t ∉ _unexported_public_api

is_transducer_type(t) = t isa Type && t <: Transducer && t !== Transducer
is_transducer_type(::typeof(Zip)) = true

struct TransducerLister
    m::Module
end

TransducerLister() = TransducerLister(@__MODULE__)

Transducer(tl::TransducerLister) = opcompose(
    Filter() do x
        t = getproperty(tl.m, x)
        is_transducer_type(t)
    end,
    Map(x -> Docs.Binding(tl.m, x)),
)

(tl::TransducerLister)() = eduction(Transducer(tl), names(tl.m))

header_code(m::Markdown.MD) =
    if !isempty(m.content)
        header_code(m.content[1])
    end
header_code(c::Markdown.Code) = c
header_code(::Any) = nothing

first_paragraph(m::Markdown.MD) =
    if length(m.content) == 1
        first_paragraph(m.content[1])
    elseif length(m.content) > 1
        first_paragraph(m.content[2])
    end
first_paragraph(p::Markdown.Paragraph) = p
first_paragraph(::Any) = nothing

hasdoc(m::Module, b::Docs.Binding) = haskey(Docs.meta(m), b)

function Base.show(io::IO, ::MIME"text/markdown", tl::TransducerLister)
    println(io, "| **Transducer** | **Summary** |")
    println(io, "|:-- |:-- |")
    foreach(tl()) do binding
        hasdoc(tl.m, binding) || return
        d = Docs.doc(binding)
        h = header_code(d)
        if h === nothing
            shown = binding.var
        else
            shown, = split(h.code, "\n", limit=2)
        end

        p = first_paragraph(d)
        if p === nothing
            gist = ""
        else
            gist, = split(sprint(show, "text/markdown", Markdown.MD(p)),
                          "\n", limit=2)
        end

        println(io,
                "| [`", shown, "`](@ref ", binding, ")",
                " | ", gist,
                " |")
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
