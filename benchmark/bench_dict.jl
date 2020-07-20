module BenchSet

using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

itr = (x => y for x in 1:1000 for y in 1:x);
SUITE["xf"] = @benchmarkable Dict(eduction($itr))
SUITE["base"] = @benchmarkable Dict($itr)

end  # module
BenchSet.SUITE
