struct TransducerFolder
    xform::Transducer
end

function __foldl__(rf, val, xff::TransducerFolder, complete)
    @nospecialize rf, val, xf, complete
    xf = _normalize(xff.xform)
    while xf isa Composition
        val = next(rf, val, xf.outer)
        @return_if_reduced complete(rf, val)
        xf = xf.inner
    end
    val = next(rf, val, xf)
    @return_if_reduced complete(rf, val)
    return complete(rf, val)
end

right(l, r) = r
right(r) = r

function print_arrow(io, pre, post)
    print(io, pre)
    printstyled(io, "|>"; color=:light_black, bold=true)
    print(io, post)
end

print_spaced_arrow(io) = print_arrow(io, ' ', ' ')

function Base.summary(io::IO, xform::Transducer)
    xff = TransducerFolder(xform)
    n = mapfoldl(Count(), right, xff, init=nothing)
    f = mapfoldl(Take(1), right, xff, init=nothing)
    l = mapfoldl(TakeLast(1), right, xff, init=nothing)
    @assert n > 0
    if n == 1
        print(io, nameof(typeof(xform)))
    else
        print(io, nameof(typeof(f)))
        print_spaced_arrow(io)
        if n > 2
            print(io, "(", n - 2, " transducers...)")
            print_spaced_arrow(io)
        end
        print(io, nameof(typeof(l)))
    end
    return
end

is_anonymous(n) = n == :anonymous || startswith(string(n), '#')

function show_transducer(io, mime, xf)
    @nospecialize io, xf
    printstyled(io, nameof(typeof(xf)); color=:cyan)
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
