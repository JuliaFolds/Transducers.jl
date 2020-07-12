module BenchFilterMapReduce

using BenchmarkTools
using Transducers

function manual_filter_map_reduce(xs)
    acc = zero(eltype(xs))
    for x in xs
        if -0.5 < x < 0.5
            acc += 2x
        end
    end
    return acc
end

suite = BenchmarkGroup()

xf = Filter(x -> -0.5 < x < 0.5) |> Map(x -> 2x)
n = 10^5

let xs = randn(10)
    @assert manual_filter_map_reduce(xs) == foldl(+, xf, xs, init=0.0)
end

suite["xf"] = @benchmarkable(
    foldl(+, $xf, xs, init=0.0),
    setup=(xs = randn($n)))
suite["man"] = @benchmarkable(
    manual_filter_map_reduce(xs),
    setup=(xs = randn($n)))

end  # module
BenchFilterMapReduce.suite
