module BenchAppend

using BangBang: append!!
using Transducers
using BenchmarkTools: @benchmarkable, BenchmarkGroup

const SUITE = BenchmarkGroup()

SUITE["append!!(::Transducer, Union{}[], _)"] = @benchmarkable(
    append!!(Transducer(y for x in nothing if isodd(x) for y in 1:x), dest, 1:100),
    setup = (dest = Union{}[]),
)
SUITE["append!!(Union{}[], ::Eduction)"] = @benchmarkable(
    append!!(dest, eduction(y for x in 1:100 if isodd(x) for y in 1:x)),
    setup = (dest = Union{}[]),
)

end  # module
BenchAppend.SUITE
