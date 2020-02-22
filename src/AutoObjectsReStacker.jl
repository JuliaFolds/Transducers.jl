module AutoObjectsReStacker

"""
    restack(x) -> x

An identity function in the sense `restack(x) === x`.  However, it
(recursively) re-construct `x` to beg the compiler to move everything
in the stack.
"""
restack

_inline(x) = Expr(:block, Expr(:meta, :inline), x)

@generated restack(x::NTuple{N,Any}) where {N} =
    _inline(:(($(map(i -> :(restack(x[$i])), 1:N)...),)))

@generated restack(x::NamedTuple{names}) where {names} =
    _inline(:((; $(map(n -> Expr(:kw, n, :(restack(x.$n))), names)...))))

@generated restack(x) =
    if parentmodule(x) === Core
        # Workaround the issue with `isstructtype(String)` and
        #  `isstructtype(Symbol)`.
        # https://github.com/JuliaLang/julia/issues/30210
        :x
    elseif isstructtype(x)
        Expr(:new, x, map(n -> :(restack(x.$n)), fieldnames(x))...)
    else
        :x
    end |> _inline

end  # module
