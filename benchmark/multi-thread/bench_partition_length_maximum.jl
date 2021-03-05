module BenchPartitionLengthMaximum

using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

f(xs, ex) = Transducers.fold(
    max,
    xs |> ReducePartitionBy(identity, Map(_ -> 1)'(+), 0),
    ex;
    init = typemin(Int),
)

let s = SUITE["rand"] = BenchmarkGroup()
    xs = rand(Bool, 2^25)
    s["foldl"] = @benchmarkable f($xs, SequentialEx())
    s["reduce"] = @benchmarkable f($xs, ThreadedEx())
end

end  # module
BenchPartitionLengthMaximum.SUITE
