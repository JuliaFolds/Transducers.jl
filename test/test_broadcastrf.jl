module TestBroadcastRF

include("preamble.jl")

@testset "count_sum" begin
    @testset "$fold" for fold in [foldl, simple_reduce, reduce_bs1, reduce]
        foldl = nothing

        count_sum(xs, xf = Map(identity)) = fold(BroadcastRF(+), xf |> Map(x -> (1, x)), xs)
        @test count_sum([5, 2, 6, 8, 3]) == (5, 24)
        @test count_sum([5, 2, 6, 8, 3], Filter(isodd)) == (2, 8)
        @test_throws EmptyResultError count_sum(1:0)
        @test_throws EmptyResultError count_sum(1:10, Filter(_ -> false))
    end
end

@testset "partially started" begin
    @testset "$fold" for fold in [foldl, simple_reduce, reduce_bs1, reduce]
        foldl = nothing
        f(xs) = fold(
            BroadcastRF(reducingfunction(Filter(isodd), max)),
            Map(x -> (x + 1, x)),
            xs,
        )
        @test f([5, 2, 6, 8, 3]) == (9, 5)
        @test_throws EmptyResultError f(2:2:8)
    end
end

@testset "init" begin
    @testset "$fold" for fold in [foldl, simple_reduce, reduce_bs1, reduce]
        foldl = nothing
        @test fold(BroadcastRF(+), Map(identity), 1:9) == 45
        @test fold(BroadcastRF(+), Map(identity), 1:9, init = [0]) == [45]
    end
end

sample_foldl_allocations(repeat::Integer, args...) =
    map(1:repeat) do _
        @allocated foldl(args...)
    end

@testset "allocation" begin
    args = (BroadcastRF(+), Map(identity))
    n = 1000
    xs = [ones(n) for _ in 1:n]
    sample_foldl_allocations(2, args..., xs)
    baseline = minimum(sample_foldl_allocations(100, args..., xs))
    repeat10x = minimum(sample_foldl_allocations(100, args..., repeat(xs, 10)))
    @debug "estimated allocations" baseline repeat10x repeat10x / baseline
    @test repeat10x < 2 * baseline
end

end  # module
