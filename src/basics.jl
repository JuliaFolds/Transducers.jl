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

_valof(::Val{x}) where {x} = x
_valof(x) = x

_typeof(::Type{T}) where {T} = Type{T}
_typeof(::T) where {T} = T

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

# https://github.com/JuliaLang/julia/pull/33533
if VERSION < v"1.4"
    const PartitionableArray = Vector
else
    const PartitionableArray = AbstractArray
end


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


# Just like `Function` but for defining some common methods.
abstract type _Function <: Function end

# Avoid `Function` fallbacks:
@nospecialize
Base.show(io::IO, ::MIME"text/plain", f::_Function) = show(io, f)
Base.print(io::IO, f::_Function) = show(io, f)
@specialize


# A macro for "manual Union splitting".  It is sometimes useful to let
# the compiler know that it is beneficial to type-specialize `body`.
# * https://github.com/JuliaFolds/Transducers.jl/pull/188
# * https://github.com/JuliaLang/julia/pull/34293#discussion_r363550608
macro manual_union_split(cond, body)
    quote
        if $cond
            $body
        else
            $body
        end
    end |> esc
end

@inline _firstindex(arr) = firstindex(arr)
@inline _lastindex(arr) = lastindex(arr)

# Define `firstindex` and `lastindex` for `Broadcasted` with linear
# index style:
@inline _firstindex(bc::Broadcasted) = first((axes(bc)::Tuple{Any})[1])
@inline _lastindex(bc::Broadcasted) = last((axes(bc)::Tuple{Any})[1])

# Define `CartesianIndices` for `Broadcasted`
@inline _CartesianIndices(arr) = CartesianIndices(arr)
@inline _CartesianIndices(bc::Broadcasted) = CartesianIndices(axes(bc)::Tuple)

# Define `IndexStyle` for `Broadcasted`
_IndexStyle(arr) = IndexStyle(arr)
_IndexStyle(bc::Broadcasted) = _IndexStyle(typeof(bc))
_IndexStyle(::Type{<:Broadcasted{<:Any,<:Tuple{Any}}}) = IndexLinear()
_IndexStyle(::Type{<:Broadcasted{<:Any}}) = IndexCartesian()
