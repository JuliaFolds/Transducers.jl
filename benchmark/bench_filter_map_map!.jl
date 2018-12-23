using BenchmarkTools
using Transducers

function manual_filter_map_map!(ys, xs)
    for i in eachindex(xs, ys)
        x = xs[i]
        if -0.5 < x < 0.5
            ys[i] = 2x
        end
    end
    return ys
end

let suite = BenchmarkGroup()

    xf = Filter(x -> -0.5 < x < 0.5) |> Map(x -> 2x)
    n = 10^5

    let xs = randn(10),
        ys = zero(xs)
        @assert manual_filter_map_map!(ys, xs) == map!(xf, ys, xs)
    end

    suite["xf"] = @benchmarkable(
        map!($xf, ys, xs),
        setup=(xs = randn($n); ys = zero(xs)))
    suite["man"] = @benchmarkable(
        manual_filter_map_map!(ys, xs),
        setup=(xs = randn($n); ys = zero(xs)))

    suite
end
