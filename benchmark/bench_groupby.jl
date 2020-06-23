module BenchGroupBy

using BenchmarkTools
using SplitApplyCombine: groupreduce
using Transducers

suite = BenchmarkGroup()

n = 10_000
table = map(rand(0:9, n), rand(n)) do key, value
    (key = key, value = value)
end

suite["sum"] = BenchmarkGroup()
suite["sum"]["sac"] = @benchmarkable(groupreduce(x -> x.key, x -> x.value, +, $table))
suite["sum"]["xf-without-init"] = @benchmarkable(foldl(
    right,
    GroupBy(x -> x.key, Map(x -> last(x).value), +),  # no init
    $table,
))
suite["sum"]["xf-with-init"] = @benchmarkable(foldl(
    right,
    GroupBy(x -> x.key, Map(x -> last(x).value), +, 0.0),  # with init
    $table,
))

end  # module
BenchGroupBy.suite
