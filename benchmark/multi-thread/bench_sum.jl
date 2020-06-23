module BenchSum

using BenchmarkTools
using Transducers

suite = BenchmarkGroup()

function slow_computation(n)
    x = 0.4
    for _ in 1:n
        x = 3 / π * sin(x * π)
    end
    return x
end

xf = Map(slow_computation)

n = 2^14
maxworkload = 100
inputtable = [
    ("uniform", fill(maxworkload ÷ 2, n)),
    ("random", rand(1:maxworkload, n)),
    #=
    ("increasing", ceil.(Int, range(1, maxworkload, length = n))),
    ("decreasing", ceil.(Int, range(maxworkload, 1, length = n))),
    (
        "mountain",
        vcat(
            ceil.(Int, range(1, maxworkload, length = n ÷ 2)),
            ceil.(Int, range(maxworkload, 1, length = n ÷ 2)),
        ),
    ),
    =#
    (
        "valley",
        vcat(
            ceil.(Int, range(maxworkload, 1, length = n ÷ 2)),
            ceil.(Int, range(1, maxworkload, length = n ÷ 2)),
        ),
    ),
]

for (label, xs) in inputtable
    s1 = suite[label] = BenchmarkGroup()
    s1["foldl"] = @benchmarkable foldl(+, $xf, $xs; simd = true)
    s2 = s1["reduce"] = BenchmarkGroup()
    for basesize in 2 .^ (7:9)
        s2["basesize=$basesize"] = @benchmarkable reduce(
            +,
            $xf,
            $xs;
            basesize = $basesize,
            simd = true,
        )
    end
end

end  # module
BenchSum.suite
