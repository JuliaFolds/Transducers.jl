module BenchDot

using BenchmarkTools
using LinearAlgebra
using Transducers

function manual_dot(xs, ys)
    acc = zero(promote_type(eltype(xs), eltype(ys)))
    @inbounds @simd for i in eachindex(xs, ys)
        acc += xs[i] * ys[i]
    end
    return acc
end

multiplied(iters...) = eduction(MapSplat(*), zip(iters...))

suite = BenchmarkGroup()

let xs = randn(10),
    ys = zero(xs)
    @assert manual_dot(xs, ys) == foldl(+, multiplied(xs, ys); simd=true)
end

n = 10^4

suite["xf"] = @benchmarkable(
    foldl(+, ed; simd=true),
    setup=(ed = multiplied(randn($n), randn($n))))

# This is a bit "cheating" since it's using non-public API.  It is
# just to show the lower-bound of Transducers.jl runtime:
rf = reducingfunction(
    MapSplat(*), +;
    simd = true)
suite["rf"] = @benchmarkable(
    transduce($rf, 0.0, zs),
    setup=(zs = zip(randn($n), randn($n))))

suite["blas"] = @benchmarkable(
    dot(xs, ys),
    setup=(xs = randn($n); ys = randn($n)))
suite["man"] = @benchmarkable(
    manual_dot(xs, ys),
    setup=(xs = randn($n); ys = randn($n)))

end  # module
BenchDot.suite
