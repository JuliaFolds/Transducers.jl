@nospecialize
# TODO: make show code a bit more DRY

struct TransducerFolder
    xform::Transducer
end

function __foldl__(rf, val, xff::TransducerFolder)
    @nospecialize
    xf = _normalize(xff.xform)
    while xf isa Composition
        val = @next(rf, val, xf.outer)
        xf = xf.inner
    end
    val = @next(rf, val, xf)
    return complete(rf, val)
end

function print_arrow(io, pre, post)
    arrow = get(io, :arrow, "⨟")
    print(io, pre)
    printstyled(io, arrow; color=:light_black, bold=true)
    print(io, post)
end

print_spaced_arrow(io) = print_arrow(io, ' ', ' ')

function Base.summary(io::IO, xform::Transducer)
    xff = TransducerFolder(xform)
    n = foldl(right, Count(), xff)
    f = foldl(right, Take(1), xff)
    s = foldl(right, Take(2), xff; init = nothing)
    l = foldl(right, TakeLast(1), xff)
    @assert n > 0
    if n == 1
        print(io, "::", nameof(typeof(xform)))
    else
        print(io, "::", nameof(typeof(f)))
        print_spaced_arrow(io)
        if n == 3
            print(io, "::", nameof(typeof(f)))
            print_spaced_arrow(io)
        elseif n > 3
            print(io, "(", n - 2, " transducers...)")
            print_spaced_arrow(io)
        end
        print(io, "::", nameof(typeof(l)))
    end
    return
end

is_anonymous(n) = n == :anonymous || startswith(string(n), '#')

_is_default_arg(xf, name::Symbol, value) = is_default_arg(xf, Val(name), value)
is_default_arg(xf, name, value) = false
is_default_arg(xf::Scan, ::Val{:init}, value) = value === Init
is_default_arg(xf::GroupBy, ::Val{:init}, value) = value isa DefaultInitOf

_name_of_transducer_type(xf) = nameof(typeof(xf))

function show_transducer(io, mime, xf)
    @nospecialize io, xf
    printstyled(io, _name_of_transducer_type(xf); color=:cyan)
    printstyled(io, '('; color=:yellow)
    show_args(io, mime, xf)
    printstyled(io, ')'; color=:yellow)
end

function show_args(io, mime, xf)
    @nospecialize io, xf
    indent = get(io, :indent, "") * ' ' ^ 4
    multiline = mime !== nothing && any(propertynames(xf)) do n
        getproperty(xf, n) isa Composition
    end
    isfirst = true
    for n in propertynames(xf)
        v = getproperty(xf, n)
        _is_default_arg(xf, n, v) && continue
        if isfirst
            isfirst = false
            if multiline
                println(io)
                print(io, indent)
            end
        else
            if multiline
                println(io, ",")
                print(io, indent)
            else
                print(io, ", ")
            end
        end
        if v isa Function
            n = nameof(v)
            if is_anonymous(n)
                print(io, parentmodule(v), ".λ❓")
            else
                print(io, n)
            end
        else
            if multiline
                io′ = io
            else
                io′ = IOContext(io, :compact => true)
            end
            io′ = IOContext(io′, :indent => indent, :first_indent => "")
            _show_field(io′, mime, v)
        end
    end
    if multiline
        println(io)
        print(io, get(io, :indent, ""))
    end
end

_show_field(io, ::Nothing, v) = show(io, v)
_show_field(io, mime, v) = show(io, mime, v)
_show_field(io, ::MIME"text/plain", v::Array) = show(io, v)

show_args(io, mime, xf::Union{OfType{T}, NotA{T}}) where T = show(io, T)

function _show_impl(io, mime, xform::Transducer)
    @nospecialize io, xform
    indent = get(io, :indent, "")
    first_indent = get(io, :first_indent, indent)
    next_indent = indent * ' ' ^ 4
    foreach(FlagFirst(), TransducerFolder(xform)) do (isfirst, xf)
        if mime === nothing
            inner_indent = ""
            if !isfirst
                print_spaced_arrow(io)
            end
        else
            if isfirst
                print(io, first_indent)
                inner_indent = indent
            else
                print_arrow(io, ' ', '\n')
                print(io, next_indent)
                print(io)
                inner_indent = next_indent
            end
        end
        show_transducer(IOContext(io,
                                  :indent => inner_indent,
                                  :first_indent => inner_indent),
                        mime,
                        xf)
    end
    return
end

Base.show(io::IO, m::MIME"text/plain", xf::Transducer) = _show_impl(io, m, xf)

function Base.show(io::IO, xf::Transducer)
    if get(io, :limit, false)
        summary(io, xf)
    else
        _show_impl(io, nothing, xf)
    end
    return
end

Base.show(io::IO, m::MIME"text/plain", rf::AbstractReduction) =
    _show_impl(io, m, rf)

function _show_impl(io, mime, x)
    indent = get(io, :indent, "")
    first_indent = get(io, :first_indent, indent)
    print(io, first_indent)
    _show_noindent(io, mime, x)
end

_show_noindent(io, mime, x) = show(io, mime, x)

function _show_noindent(io, mime, x::Function)
    m = parentmodule(x)
    if m !== Base
        show(io, mime, m)
        print(io, '.')
    end
    print(io, nameof(x))
end

function _show_impl(io, mime, rf::AbstractReduction)
    indent = get(io, :indent, "")
    first_indent = get(io, :first_indent, indent)
    next_indent = indent * ' ' ^ 4
    next_io = IOContext(io,
                        :indent => next_indent,
                        :first_indent => next_indent)

    print(io, first_indent)
    print(io, Base.typename(typeof(rf)).name)
    println(io, '(')
    _show_multiline_args(next_io, mime, rf)
    print(io, ")")
    return
end

function _show_multiline_args(io, mime, rf::Reduction)
    _show_impl(io, mime, xform(rf))
    println(io, ",")
    _show_impl(io, mime, inner(rf))
end

function _show_multiline_args(io, mime, rf::BottomRF)
    _show_impl(io, mime, inner(rf))
end

function _show_multiline_args(io, mime, rf::Splitter)
    _show_impl(io, mime, inner(rf))
end

function _show_multiline_args(io, mime, rf::Joiner)
    _show_impl(io, mime, inner(rf))
end

function Base.show(io::IO, ed::Eduction)
    io = IOContext(io, :arrow => "|>")
    show(io, ed.coll)
    print_spaced_arrow(io)
    _show_impl(io, nothing, Transducer(ed))
end

function Base.show(io::IO, mime::MIME"text/plain", ed::Eduction)
    io = IOContext(io, :arrow => "|>")
    summary(IOContext(io, :compat => true), ed.coll)
    print_arrow(io, ' ', '\n')
    _show_impl(IOContext(io, :first_indent => ' '^4), mime, Transducer(ed))
end

@specialize
