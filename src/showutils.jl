_getfields(obj) = map(n -> getfield(obj, n), fieldnames(typeof(obj))) :: Tuple

prefixof(f) = join(fullname(parentmodule(f)), '.')

function print_apply(io, f, args)
    if !get(io, :limit, false)
        # Don't show full name in REPL etc.:
        print(io, prefixof(f), '.')
    end
    print(io, nameof(f))
    if length(args) == 1
        print(io, '(')
        show(io, args[1])
        print(io, ')')
    else
        show(io, args)
    end
    return
end

_default_show(io, obj) = print_apply(io, typeof(obj), _getfields(obj))
