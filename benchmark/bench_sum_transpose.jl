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
    s1 = SUITE[:n=>n] = BenchmarkGroup()

    xs = randn(n, n)'

    s2 = s1[:withinit=>false] = BenchmarkGroup()
    s2[:impl=>:iter] = @benchmarkable iter_sum($xs)
    s2[:impl=>:man] = @benchmarkable man_sum($xs)
    s2[:impl=>:xf] = @benchmarkable foldxl(+, $xs)

    s2 = s1[:withinit=>true] = BenchmarkGroup()
    s2[:impl=>:iter] = @benchmarkable iter_sum($xs, 0.0)
    s2[:impl=>:man] = @benchmarkable man_sum($xs, 0.0)
    s2[:impl=>:xf] = @benchmarkable foldxl(+, $xs; init = 0.0)
end

end  # module
BenchSumTranspose.SUITE
