module BenchOverhead

using BenchmarkTools
using Transducers

suite = BenchmarkGroup()

let n = 64
    s = suite["n=$n"] = BenchmarkGroup()
    s["terminatable=true"] = @benchmarkable reduce(
        right,
        Map(_ -> nothing),
        1:$n;
        basesize = 1,
    )
    s["terminatable=false"] = @benchmarkable reduce(
        right,
        Map(_ -> nothing),
        1:$n;
        basesize = 1,
        terminatable = false,
    )
end

end  # module
BenchOverhead.suite
