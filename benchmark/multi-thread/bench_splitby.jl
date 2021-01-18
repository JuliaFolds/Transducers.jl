module BenchSplitBy
using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

chunks_longer_than(xs, n) =
    xs |> SplitBy(iszero; keepend = Val(true)) |> Map(length) |> Filter(>=(n))

count_chunks_longer_than(xs, n, ex) =
    Transducers.fold(+, chunks_longer_than(xs, n) |> Map(_ -> 1), ex; init = 0)

function man_count_chunks_longer_than(xs, n)
    c = 0
    ilast = firstindex(xs) - 1
    for i in eachindex(xs)
        x = @inbounds xs[i]
        if iszero(x)
            if i - ilast >= n
                c += 1
            end
            ilast = i
        end
    end
    if lastindex(xs) - ilast >= n
        c += 1
    end
    return c
end

# TODO: find a better way to test benchmark code
if lowercase(get(ENV, "TRANSDUCERS_JL_TEST_BENCHMARKS", "false")) == "true"
    using Test
    using Random: MersenneTwister
else
    macro testset(_) end
end

@testset for seed in 1:20
    rng = MersenneTwister(seed)
    xs = rand(rng, 0:9, 2^20)
    @test man_count_chunks_longer_than(xs, 5) ==
            count_chunks_longer_than(xs, 5, SequentialEx()) ==
            count_chunks_longer_than(xs, 5, ThreadedEx())
end

let s = SUITE["count"] = BenchmarkGroup()
    xs = rand(0:9, 2^20)
    s["man"] = @benchmarkable man_count_chunks_longer_than($xs, 5)
    s["foldl"] = @benchmarkable count_chunks_longer_than($xs, 5, SequentialEx())
    s["reduce"] = @benchmarkable count_chunks_longer_than($xs, 5, ThreadedEx())
end

end  # module
BenchSplitBy.SUITE
