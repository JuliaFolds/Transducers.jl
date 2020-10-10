"""
    foldx_base(op[, xf], xs; init)
    transduce_base(op[, xf], init, xs)

Extended fold backed up `Base.mapreduce` (to be used for, e.g, CUDA).
"""
(foldx_base, transduce_base)

foldx_base(op, xs; init = DefaultInit, kwargs...) =
    unreduced(transduce_base(Completing(op), init, xs; kwargs...))

foldx_base(op, xf, xs; init = DefaultInit, kwargs...) =
    unreduced(transduce_base(xf, Completing(op), init, xs; kwargs...))

foldx_base(op; kwargs...) = xs -> foldx_base(op, xs; kwargs...)

transduce_base(xf::Transducer, op, init, xs; kwargs...) =
    transduce_base(xf'(op), init, xs; kwargs...)

function transduce_base(rf, init, xs;)
    xf, coll = extract_transducer(xs)
    if coll isa Iterators.Zip
        iters = coll.is
        f = tuple
    else
        iters = (coll,)
        f = identity
    end
    op = _reducingfunction(xf, rf; init = init)
    acc = mapreduce(f, AugmentedReduction(op), iters...; init = start(op, init))
    result = complete(op, acc)
    if unreduced(result) isa DefaultInitOf
        throw(EmptyResultError(op))
    end
    return result
end

# TODO: Make this a default of `Reduction`.
# See also: https://github.com/JuliaFolds/Transducers.jl/pull/172
struct AugmentedReduction{RF}
    rf::RF
end

# Semantically correct but inefficient (eager) handling of `Reduced`.
(_::AugmentedReduction)(a::Reduced, b::Reduced) = a
(_::AugmentedReduction)(a::Reduced, b) = a
@inline (f::AugmentedReduction{RF})(a, b::Reduced) where {RF} =
    reduced(next(f.rf, a, unreduced(b)))
@inline (f::AugmentedReduction{RF})(a, b) where {RF} = next(f.rf, a, b)
