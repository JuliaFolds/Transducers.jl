# # How to make your data type reducible
#
# Let's see how to make a vector-of-vector a [reducible
# collection](@ref Glossary); i.e., a type that can be fed to
# [`foldl`](@ref).

struct VecOfVec{T}
    vectors::Vector{Vector{T}}
end

# We need [`@next`](@ref Transducers.@next) and [`complete`](@ref
# Transducers.complete) to invoke the reducing function `rf`.

using Transducers
using Transducers: @next, complete

# Supporting [`foldl`](@ref) and similar only requires
# [`Transducers.__foldl__`](@ref):

function Transducers.__foldl__(rf, val, vov::VecOfVec)
    for vector in vov.vectors
        for x in vector
            val = @next(rf, val, x)
        end
    end
    return complete(rf, val)
end

# Note that it's often a good idea to implement `Base.eltype`:

Base.eltype(::VecOfVec{T}) where {T} = T

# It can be then used as the input to the transducers:

vov = VecOfVec(collect.([1:n for n in 1:3]))
collect(Map(identity), vov)

# Macro `@next` is used instead of function [`next`](@ref
# Transducers.next) to avoid the boilerplate for supporting early
# termination (see the details in in [`@next`](@ref Transducers.@next)
# documentation).  In practice, using `@next` means that your
# `__foldl__` supports early termination:

collect(Take(3), vov)

# More complex example:

collect(PartitionBy(isequal(1)) |> Zip(Map(copy), Map(sum)), vov)

# Notice that writing [`Transducers.__foldl__`](@ref) is very
# straightforward comparing to how to define an iterator:

function Base.iterate(vov::VecOfVec, state=(1, 1))
#+
# Iterator `state` is a tuple of an index `i` to `vov.vectors` and an
# index `j` to `vov.vectors[i]`:
    i, j = state
#+
# If `i` is larger than the number of items, we are done:
    i > length(vov.vectors) && return nothing
#+
# If `j` is in bound, we are iterating the same sub-vector:
    vi = vov.vectors[i]
    if j <= length(vi)
        return vi[j], (i, j + 1)
    end
#+
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

collect(vov)
