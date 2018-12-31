# # How to make your data type a transducible process
#
# Let's see how to make a vector-of-vector a transducible process;
# i.e., a type that can be fed to [`mapfoldl`](@ref) instead of the
# iterator.  Transducible process knows how to "drive" transducers.
# Another way to express it is that transducible process knows how to
# reduce itself using the reducing step function.

struct VecOfVec{T}
    vectors::Vector{Vector{T}}
end

# We need [`Transducers.next`](@ref) to invoke the reducing function
# `rf` and [`Transducers.@return_if_reduced`](@ref) to support early
# termination.

using Transducers
using Transducers: next, @return_if_reduced

# Supporting [`mapfoldl`](@ref) and similar only requires
# [`Transducers.__foldl__`](@ref):

function Transducers.__foldl__(rf, val, vov::VecOfVec, complete)
    for vector in vov.vectors
        for x in vector
            val = next(rf, val, x)
            @return_if_reduced complete(rf, val)
        end
    end
    return complete(rf, val)
end

# Note that it's often a good idea to implement `Base.eltype`:

Base.eltype(::VecOfVec{T}) where {T} = T

# It can be then used as the input to the transducers:

vov = VecOfVec(collect.([1:n for n in 1:3]))
collect(Map(identity), vov)

# [`Transducers.@return_if_reduced`](@ref) above is used to support
# terminating transducer like [`Take`](@ref).

collect(Take(3), vov)

# More complex example:

collect(PartitionBy(isequal(1)) |> Map(copy) |> TeeZip(Map(sum)), vov)

# Notice that writing [`Transducers.__foldl__`](@ref) is very
# straightforward comparing to how to define an iterator:

function Base.iterate(vov::VecOfVec, state=nothing)
    if state === nothing
        i, j = 1, 1
    else
        i, j = state
    end
    i > length(vov.vectors) && return nothing

# If `j` is in bound, we are iterating the same sub-vector:
    vi = vov.vectors[i]
    if j <= length(vi)
        return vi[j], (i, j + 1)
    end

# Otherwise, find the next non-empty sub-vector and start iterating it:
    for k in i + 1:length(vov.vectors)
        vk = vov.vectors[k]
        if !isempty(vk)
            return vk[1], (k, 2)  # i=k, j=2
        end
    end
    return nothing
end

Base.length(vov::VecOfVec) = sum(length, vov.vectors)

@show collect(vov)

xf = PartitionBy(isequal(1)) |> Cat()
@assert mapfoldl(xf, +, vov, init=1) == 11

using Test

let err
    try
        @inferred mapfoldl(xf, +, vov, init=1)
    catch err
    end

    print("Got: ")
    showerror(stdout, err)
    println()
end

#-

@inline function Transducers.__foldl__(rf, val, vov::VecOfVec, complete)
    if isempty(vov.vectors) || all(isempty, vov.vectors)
        return complete(rf, val)
    end

    n = findfirst(!isempty, vov.vectors)
    v1 = @inbounds vov.vectors[n]
    x = @inbounds v1[1]
    val = next(rf, val, x)
    @return_if_reduced complete(rf, val)

    for i in 2:length(v1)
        val = next(rf, val, @inbounds v1[i])
        @return_if_reduced complete(rf, val)
    end

    for vector in @inbounds @view vov.vectors[n + 1:end]
        for x in vector
            val = next(rf, val, x)
            @return_if_reduced complete(rf, val)
        end
    end
    return complete(rf, val)
end

@assert (@inferred mapfoldl(xf, +, vov, init=1)) == 11
