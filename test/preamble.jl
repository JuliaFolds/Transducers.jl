using Test
using Random
using Statistics: mean
using Transducers
using Transducers: simple_transduce, Reduced, isexpansive,
    TeeZip, GetIndex, SetIndex, Inject

inc(x) = x + oneunit(x)

isfiniteiter(iter) =
    Base.IteratorSize(iter) isa Union{Base.HasLength, Base.HasShape}

function iterator_variants(xs)
    iters = Any[xs]
    if !(xs isa Array) && isfiniteiter(xs)
        push!(iters, collect(xs))
    end
    push!(iters, Base.Generator(identity, xs))
    return iters
end
