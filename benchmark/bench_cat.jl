module BenchCat

using BenchmarkTools
using Transducers

itr = (y for x in 1:1000 for y in 1:x);

suite = BenchmarkGroup()

suite["xf"] = @benchmarkable foldl(+, eduction($itr))
suite["base"] = @benchmarkable sum($itr)

end  # module
BenchCat.suite
