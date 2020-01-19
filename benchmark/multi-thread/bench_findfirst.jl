module BenchFindfirst

using BenchmarkTools
using Transducers

suite = BenchmarkGroup()

function slow_computation(x, n)
    for _ in 1:n
        x = 3 / π * sin(x * π)
    end
    return x
end
# `n` controls when the first match is found "randomly" and also
# workload per item.

function searching(n)
    # P(0.35 < x < 0.3501) ≈ 3.1e-5
    # expected first hit = 1 / 3.1e-5 ≈ 32000
    return Map(x -> slow_computation(x, n)) |> ReduceIf(x -> 0.35 < x < 0.3501)
end

xs = range(0, 1, length = 2^18)

# for m in 1:10
for m in [4, 5, 10]
    n = 100m
    xf = searching(n)
    @assert foldl(right, xf, xs) == reduce(right, xf, xs; basesize = 2^9)
    # @show n, foldl(right, xf |> Enumerate(), xs)

    s1 = suite["n=$n"] = BenchmarkGroup()
    s1["foldl"] = @benchmarkable foldl(right, $xf, $xs)
    s2 = s1["reduce"] = BenchmarkGroup()
    for basesize in 2 .^ (7:9)
        s2["basesize=$basesize"] =
            @benchmarkable reduce(right, $xf, $xs; basesize = $basesize)
    end
end

end  # module
BenchFindfirst.suite
