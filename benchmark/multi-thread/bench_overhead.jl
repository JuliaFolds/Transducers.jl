module BenchOverhead

using BenchmarkTools
using Transducers

suite = BenchmarkGroup()

let n = 64
    suite["n=$n"] = @benchmarkable reduce(right, Map(_ -> nothing), 1:$n; basesize = 1)
end

end  # module
BenchOverhead.suite
