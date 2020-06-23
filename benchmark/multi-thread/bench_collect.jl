module BenchCollect

using BenchmarkTools
using Transducers

suite = BenchmarkGroup()

function collect_unordered(xf, xs; basesize = 1, kwargs...)
    T = eltype(xs)
    return collect(
        T,
        channel_unordered(
            xf,
            xs;
            eltype = T,
            size = basesize,
            basesize = basesize,
            kwargs...,
        ),
    )
end

xf = Map() do x
    for _ in 1:1000
        x = sin(x)
    end
    return x
end

xs = randn(2^15)

let
    ys = collect(xf, xs) |> sort!
    ys_unordered_1 = collect_unordered(xf, xs; basesize = 1) |> sort!
    ys_unordered_32 = collect_unordered(xf, xs; basesize = 32) |> sort!
    ys_unordered_1024 = collect_unordered(xf, xs; basesize = 1024) |> sort!
    @assert ys == ys_unordered_1
    @assert ys == ys_unordered_32
    @assert ys == ys_unordered_1024
end

suite["seq"] = @benchmarkable collect($xf, $xs)
suite_assoc = suite["assoc"] = BenchmarkGroup()
for basesize in [1, 2^5, 2^10]
    suite_assoc["basesize=$basesize"] = @benchmarkable tcollect(
        $xf,
        $xs;
        basesize = $basesize,
    )
end
suite_unordered = suite["unordered"] = BenchmarkGroup()
for basesize in [1, 2^5, 2^10]
    suite_unordered["basesize=$basesize"] =
        @benchmarkable collect_unordered($xf, $xs; basesize = $basesize)
end

end  # module
BenchCollect.suite
