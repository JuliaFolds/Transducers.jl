module AutoObjectsReStacker

"""
    restack(x) -> x

An identity function in the sense `restack(x) === x`.  However, it
(recursively) re-construct `x` to beg the compiler to move everything
in the stack.
"""
restack

_getlength(::Type{<:NTuple{N,Any}}) where N = N
_getnames(::Type{<:NamedTuple{names}}) where names = names

# Not using dispatch, to check `issingletontype` first.
@generated function restack(x)
    if Base.issingletontype(x)
        ex = x.instance :: x
    elseif x <: Tuple
        N = _getlength(x)
        ex = :(($(map(i -> :(restack(x[$i])), 1:N)...),))
    elseif x <: NamedTuple
        names = _getnames(x)
        ex = :((; $(map(n -> Expr(:kw, n, :(restack(x.$n))), names)...)))
    elseif parentmodule(x) === Core
        # Workaround the issue with `isstructtype(String)` and
        #  `isstructtype(Symbol)`.
        # https://github.com/JuliaLang/julia/issues/30210
        ex = :x
    elseif isstructtype(x)
        fn = fieldnames(x)
        lastfield = QuoteNode(fn[end])
        new = Expr(:new, x, map(n -> :(restack(getfield(x, $(QuoteNode(n))))), fn)...)

        ex = quote
            if isimmutable(x) && isdefined(x, $lastfield)
                $new
            else
                x
            end
        end
    else
        ex = :x
    end
    return Expr(:block, Expr(:meta, :inline), ex)
end

end  # module
