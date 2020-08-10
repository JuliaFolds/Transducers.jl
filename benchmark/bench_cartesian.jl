module BenchCartesian

using BenchmarkTools
using Transducers

function copyto_manual!(ys::AbstractMatrix, xs::AbstractMatrix)
    @assert axes(ys) == axes(xs)
    for j in 1:size(xs, 2), i in 1:size(xs, 1)
        @inbounds ys[i, j] = xs[i, j]
    end
    return ys
end

function copyto_iter!(ys, xs)
    @assert axes(ys) == axes(xs)
    for I in CartesianIndices(xs)
        @inbounds ys[I] = xs[I]
    end
    return ys
end

function copyto_xf!(ys, xs)
    foreach(Map(identity), CartesianIndices(xs)) do I
        @inbounds ys[I] = xs[I]
        nothing
    end
    return ys
end

const SUITE = BenchmarkGroup()

let xs = randn(3, 10^3)
    ys = zero(xs)
    s1 = SUITE["copyto!"] = BenchmarkGroup()
    s1["man"] = @benchmarkable(copyto_manual!($ys, $xs))
    s1["iter"] = @benchmarkable(copyto_iter!($ys, $xs))
    s1["xf"] = @benchmarkable(copyto_xf!($ys, $xs))
end

end  # module
BenchCartesian.SUITE
