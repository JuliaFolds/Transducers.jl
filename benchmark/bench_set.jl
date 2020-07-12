module BenchSet

using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

itr = (y for x in 1:1000 for y in 1:x);
SUITE["xf"] = @benchmarkable Set(eduction($itr))
SUITE["base"] = @benchmarkable Set($itr)

end  # module
BenchSet.SUITE
