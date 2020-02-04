# --- Utilities

"""
    _unzip(xs::Tuple)

# Examples
```jldoctest; setup = :(using Transducers: _unzip)
julia> _unzip(((1, 2, 3), (4, 5, 6)))
((1, 4), (2, 5), (3, 6))
```
"""
_unzip(xs::Tuple{Vararg{NTuple{N,Any}}}) where {N} = ntuple(i -> map(x -> x[i], xs), N)

if isdefined(Iterators, :Zip1)  # VERSION < v"1.1-"
    arguments(xs::Iterators.Zip1) = (xs.a,)
    arguments(xs::Iterators.Zip2) = (xs.a, xs.b)
    arguments(xs::Iterators.Zip) = (xs.a, arguments(xs.z)...)
else
    arguments(xs::Iterators.Zip) = xs.is
end

if VERSION < v"1.3"
    _Channel(f, ::Type{T}, size; kwargs...) where {T} =
        Channel(f; ctype = T, csize = size, kwargs...)
else
    _Channel(f, ::Type{T}, size; kwargs...) where {T} = Channel{T}(f, size; kwargs...)
end

function _materializer(xs)
    T = Tables.materializer(xs)
    return T isa Type ? T : _materializer(typeof(xs))
end

function _materializer(::Type{T}) where T
    S = ConstructionBase.constructorof(T)
    return S isa Type ? S : T
end

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
