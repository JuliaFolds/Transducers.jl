module BenchParallelHistogram

using BangBang.NoBang: SingletonDict
using BenchmarkTools
using Transducers
using Transducers: reduce_commutative

suite = BenchmarkGroup()

mergehist!(args...) = merge!(+, args...)
initializer = OnInit(() -> Dict{Float64, Int}())

hist_seq(xf, xs; kwargs...) =
    foldl(mergehist!, xf, xs; init=initializer, kwargs...)

hist_assoc(xf, xs; kwargs...) =
    reduce(mergehist!, xf, xs; init=initializer, kwargs...)

hist_comm(xf, xs; kwargs...) =
    reduce_commutative(mergehist!, xf, xs; init=initializer, kwargs...)

xf = Map() do x
    for _ in 1:10
        x = sin(x)
    end
    return SingletonDict(round(x, digits=4), 1)
end

xs = randn(2^15)

let
    ys_seq = hist_seq(xf, xs)
    ys_assoc = hist_assoc(xf, xs)
    ys_comm = hist_comm(xf, xs)
    @assert ys_seq == ys_assoc
    @assert ys_seq == ys_comm
end

suite["seq"] = @benchmarkable hist_seq($xf, $xs)

suite_assoc = suite["assoc"] = BenchmarkGroup()
for basesize in length(xs) .÷ (2 .^ (0:2) .* Threads.nthreads())
    suite_assoc["basesize=$basesize"] =
        @benchmarkable hist_assoc($xf, $xs; basesize = $basesize)
end

suite_comm = suite["comm"] = BenchmarkGroup()
for basesize in length(xs) .÷ (2 .^ (0:2) .* Threads.nthreads())
    suite_comm["basesize=$basesize"] =
        @benchmarkable hist_comm($xf, $xs; basesize = $basesize)
end

end  # module
BenchParallelHistogram.suite
