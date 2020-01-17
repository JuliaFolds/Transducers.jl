module BenchCollect

using BenchmarkTools
using Transducers

suite = BenchmarkGroup()

suite["identity-float"] =
    @benchmarkable(collect(Map(identity), xs), setup = (xs = randn(10_000)))

suite["identity-union"] = @benchmarkable(
    collect(Map(identity), xs),
    setup = (xs = [abs(x) < 1 ? x : missing for x in randn(10_000)]),
)
suite["filter-missing"] = @benchmarkable(
    collect(Map(!ismissing), xs),
    setup = (xs = [abs(x) < 1 ? x : missing for x in randn(10_000)]),
)

end  # module
BenchCollect.suite
