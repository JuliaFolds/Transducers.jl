module BenchSumTranspose

import Random
using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

function iter_sum(xs, acc = false)
    for x in xs
        acc += x
    end
    return acc
end

function man_sum(xs::AbstractMatrix, acc = false)
    for i in axes(xs, 2), j in axes(xs, 1)
        acc += @inbounds xs[j, i]
    end
    return acc
end

Random.seed!(12345)
# for n in [30, 100]
let n = 30
    s1 = SUITE[string(n)] = BenchmarkGroup()

    xs = randn(n, n)'

    s2 = s1["noinit"] = BenchmarkGroup()
    s2["iter"] = @benchmarkable iter_sum($xs)
    s2["man"] = @benchmarkable man_sum($xs)
    s2["xf"] = @benchmarkable foldxl(+, $xs)

    s2 = s1["withinit"] = BenchmarkGroup()
    s2["iter"] = @benchmarkable iter_sum($xs, 0.0)
    s2["man"] = @benchmarkable man_sum($xs, 0.0)
    s2["xf"] = @benchmarkable foldxl(+, $xs; init = 0.0)
end

end  # module
BenchSumTranspose.SUITE
