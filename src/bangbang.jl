# A small subset of BangBang.jl

# A helper type for implementing `push`
struct SingletonVector{T} <: AbstractVector{T}
    value::T
end

Base.size(::SingletonVector) = (1,)

function Base.getindex(v::SingletonVector, i::Integer)
    @boundscheck i == 1 || throw(BoundsError(v, i))
    return v.value
end

# Maybe use `Base.push_widen` if it's there?
push(xs::AbstractVector, x) = vcat(xs, SingletonVector(x))

push!!(xs::AbstractVector{T}, x::S) where {T, S} =
    if promote_type(T, S) <: T
        push!(xs, x)
    else
        push(xs, x)
    end
