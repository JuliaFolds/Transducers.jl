# --- Utilities

valueof(::Val{x}) where x = x

ieltype(T) =
    if Base.IteratorEltype(T) isa Base.HasEltype
        eltype(T)
    else
        Any
    end

avaltype(x) = avaltype(typeof(x))
avaltype(T::Type) = valtype(T)
avaltype(T::Type{<:Union{AbstractArray,AbstractString}}) = eltype(T)

prefixed_type_name(@nospecialize x) =
    sprint(show, typeof(x), context = :module => Base)
# `:module => Base` to enforce that the type is prefixed even when
# `typeof(x)` is imported in `Main`.  See:
# https://github.com/JuliaLang/julia/pull/29466

const DenseSubVector{T} =
    SubArray{T, 1, Vector{T}, Tuple{UnitRange{Int64}}, true}


const _non_executable_transducer_msg = """
Output type of the transducer is inferred to be a `Union{}`.  This
probably means one or more of the composed transducers throw.
"""

function identityof(op, e)
    e === Union{} && error("""
$_non_executable_transducer_msg
You can pass `init` argument to run the transducer forcefully and find
out which one causes the problem.
""")
    e === Any && error("""
Input type to the reducing function `$op` cannot be inferred (it is
inferred to be `$e`).
Use the argument `init` to specify the initial value (if this error
is caused via `mapfoldl` and alike).
""")
    e <: Array && error("""
Input type to the reducing function `$op` is inferred to be `$e`.
However, there is no sensible initial value of an `Array` w.r.t. `$op`.
Use the argument `init` to specify the initial value (if this error
is caused via `mapfoldl` and alike).
""")
    return Base.reduce_empty(op, e)
end

identityof(::typeof(min), e) = typemax(e)
identityof(::typeof(max), e) = typemin(e)
identityof(::typeof(append!), e) = empty(e)
ridentityof(::typeof(append!), e) = ()

@inline _poptail(xs) = _poptail_impl(xs...)
@inline _poptail_impl(a) = (), a
@inline function _poptail_impl(a, xs...)
    head, tail = _poptail_impl(xs...)
    return (a, head...), tail
end

Base.@pure nthtype(::Val{1}, ::Type{T}) where {T <: Tuple} =
    Base.tuple_type_head(T)

Base.@pure nthtype(::Val{n}, ::Type{T}) where {n, T <: Tuple} =
    nthtype(Val(n - 1), Base.tuple_type_tail(T))

_cljapiurl(name) =
    "https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/$name"
_cljref(name) =
    "[`$name` in Clojure]($(_cljapiurl(name)))"
_thx_clj(name) =
    "This API is modeled after $(_cljref(name))."


# https://github.com/JuliaLang/julia/pull/30575
const _true_str = sprint(show, true; context=:typeinfo => Bool)
const _false_str = sprint(show, false; context=:typeinfo => Bool)
