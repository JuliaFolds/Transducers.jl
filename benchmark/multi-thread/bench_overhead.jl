module BenchOverhead

using BenchmarkTools
using Transducers

suite = BenchmarkGroup()

let n = 64
    # s = suite["n=$n"] = BenchmarkGroup()
    s = suite  # there is only one `n` for now
    s["default"] = @benchmarkable reduce(
        right,
        Map(_ -> nothing),
        1:$n;
        basesize = 1,
        # terminatable = nothing,
    )
    s["terminatable=true"] = @benchmarkable reduce(
        right,
        Map(_ -> nothing),
        1:$n;
        basesize = 1,
        terminatable = true,
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
