module BenchFilterSum

import Random
using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

function naive_sum(xs, acc = false)
    for x in xs
        acc += x
    end
    return acc
end

Random.seed!(12345)
for n in [1000, 10000]
    s0 = SUITE[string(n)] = BenchmarkGroup()

    for (xslabel, xs, init) in [
        ("UnitRange", (x for x in 1:n if isodd(x)), 0),
        ("RandomFloats", (x for x in randn(n) if x > 0), 0.0),
    ]
        s1 = s0[xslabel] = BenchmarkGroup()

        s2 = s1["noinit"] = BenchmarkGroup()
        s2["naive"] = @benchmarkable naive_sum($xs)
        s2["base"] = @benchmarkable sum($xs)
        s2["xf"] = @benchmarkable sum($(eduction(xs)))

        s2 = s1["withinit"] = BenchmarkGroup()
        s2["naive"] = @benchmarkable naive_sum($xs, $init)
        s2["base"] = @benchmarkable foldl(+, $xs; init = $init)
        s2["xf"] = @benchmarkable foldl(+, $(eduction(xs)); init = $init)
    end
end

end  # module
BenchFilterSum.SUITE
