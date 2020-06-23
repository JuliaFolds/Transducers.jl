module BenchOverhead

using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

# https://github.com/JuliaFolds/Transducers.jl/issues/307
SUITE["foldl"] = @benchmarkable foldl(+, Map(identity), $([1, 2, 3, 4]))
SUITE["reduce_basecase"] =
    @benchmarkable reduce(+, Map(identity), $([1, 2, 3, 4]), basesize = 1000)

end  # module
BenchOverhead.SUITE
