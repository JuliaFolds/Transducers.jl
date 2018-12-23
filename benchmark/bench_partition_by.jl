using Statistics
using BenchmarkTools
using Transducers

function manual_partition_by(xs)
    acc = zero(eltype(xs))
    buffer = similar(xs, 0)
    pval = xs[1] > 0
    push!(buffer, xs[1])
    for x in @view xs[2:end]
        val = x > 0
        if val == pval
            push!(buffer, x)
        else
            if mean(abs, buffer) < 1.0
                acc += prod(buffer)
            end
            empty!(buffer)
            push!(buffer, x)
            pval = val
        end
    end
    if mean(abs, buffer) < 1.0
        acc += prod(buffer)
    end
    return acc
end

let suite = BenchmarkGroup()

    xf = PartitionBy(x -> x > 0) |>
        Filter(xs -> mean(abs, xs) < 1.0) |>
        Map(prod)

    n = 10^5

    let xs = randn(100)
        @assert manual_partition_by(xs) == transduce(xf, +, 0.0, xs)
    end

    suite["xf"] = @benchmarkable(
        transduce($xf, +, 0.0, xs),
        setup=(xs = randn($n)))
    suite["man"] = @benchmarkable(
        manual_partition_by(xs),
        setup=(xs = randn($n)))

    suite
end
