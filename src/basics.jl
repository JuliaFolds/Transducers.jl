# --- Utilities

valueof(::Val{x}) where x = x

ieltype(T) =
    if Base.IteratorEltype(T) isa Base.HasEltype
        eltype(T)
    else
        Any
    end

ieltype(bc::Broadcasted) = Base.promote_op(bc.f, eltype.(bc.args)...)

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
