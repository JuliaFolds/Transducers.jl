module BenchAppendBB

using BangBang: append!!
using Transducers
using BenchmarkTools: @benchmarkable, BenchmarkGroup

const SUITE = BenchmarkGroup()

SUITE["xf"] = @benchmarkable(
    append!!(Transducer(y for x in nothing if isodd(x) for y in 1:x), dest, 1:100),
    setup = (dest = Union{}[]),
)
SUITE["eduction"] = @benchmarkable(
    append!!(dest, eduction(y for x in 1:100 if isodd(x) for y in 1:x)),
    setup = (dest = Union{}[]),
)

end  # module
BenchAppendBB.SUITE
