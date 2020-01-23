module BenchFindall

using BenchmarkTools
using Transducers

needle = 123.0
xs = rand(100_000)
xs[xs.>0.001] .= needle

suite = BenchmarkGroup()
suite["base"] = @benchmarkable findall(isequal($needle), $xs)
suite["xf-array"] = @benchmarkable collect(
    Enumerate() |> Filter(!isequal($needle) ∘ last) |> Map(first),
    $xs,
)
suite["xf-iter"] = @benchmarkable collect(
    Enumerate() |> Filter(isequal($needle) ∘ last) |> Map(first),
    (x for x in $xs),
)

end  # module
BenchFindall.suite
