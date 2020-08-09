module BenchFilterSum

import Random
using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()
const N = 1000

function naive_sum(xs, acc = false)
    for x in xs
        acc += x
    end
    return acc
end

Random.seed!(12345)
for (xslabel, xs, init) in [
    (:UnitRange, (x for x in 1:N if isodd(x)), 0),
    (:RandomFloats, (x for x in randn(N) if x > 0), 0.0),
]
    s1 = SUITE[:xs=>xslabel] = BenchmarkGroup()

    s2 = s1[:withinit=>false] = BenchmarkGroup()
    s2[:impl=>:naive] = @benchmarkable naive_sum($xs)
    s2[:impl=>:base] = @benchmarkable sum($xs)
    s2[:impl=>:xf] = @benchmarkable sum($(eduction(xs)))

    s2 = s1[:withinit=>true] = BenchmarkGroup()
    s2[:impl=>:naive] = @benchmarkable naive_sum($xs, $init)
    s2[:impl=>:base] = @benchmarkable foldl(+, $xs; init = $init)
    s2[:impl=>:xf] = @benchmarkable foldl(+, $(eduction(xs)); init = $init)
end

end  # module
BenchFilterSum.SUITE
