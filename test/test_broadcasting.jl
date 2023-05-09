module TestBroadcasting

include("preamble.jl")

@testset "count_sum" begin
    @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
        foldl = nothing

        count_sum(xs, xf = Map(identity)) =
            fold(+, opcompose(xf, Map(x -> (1, x)), Broadcasting()), xs)
        @test count_sum([5, 2, 6, 8, 3]) == (5, 24)
        @test count_sum([5, 2, 6, 8, 3], Filter(isodd)) == (2, 8)
        @test_throws EmptyResultError count_sum(1:0)
        @test_throws EmptyResultError count_sum(1:10, Filter(_ -> false))
    end
end

@testset "partially started" begin
    @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
        foldl = nothing
        f(xs) =
            fold(max, opcompose(Map(x -> (x + 1, x)), Broadcasting(), Filter(isodd)), xs)
        @test f([5, 2, 6, 8, 3]) == (9, 5)
        @test_throws EmptyResultError f(2:2:8)
    end
end

@testset "init" begin
    @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
        foldl = nothing
        @test fold(+, Broadcasting(), 1:9) == 45
        @test fold(+, Broadcasting(), 1:9, init = [0]) == [45]
    end
end

sample_foldl_allocations(repeat::Integer, args...) =
    map(1:repeat) do _
        @allocated foldl(args...)
    end

@testset "allocation" begin
    args = (+, Broadcasting())
    n = 1000
    xs = [ones(n) for _ in 1:n]
    sample_foldl_allocations(2, args..., xs)
    baseline = minimum(sample_foldl_allocations(100, args..., xs))
    repeat10x = minimum(sample_foldl_allocations(100, args..., repeat(xs, 10)))
    @debug "estimated allocations" baseline repeat10x repeat10x / baseline

    # Always construct the messages to avoid introducing bugs.
    success_msg = """
    The test `repeat10x < 2 * baseline` works in Julia $(VERSION)!
    **Consider enabling this test again.**
    """
    skip_msg = """
    The test `repeat10x < 2 * baseline` does not work in Julia $(VERSION).
    Skipping this test.
    """
    # if VERSION >= v"1.6-"
    #     if repeat10x < 2 * baseline
    #         @info success_msg baseline repeat10x repeat10x / baseline
    #     else
    #         @info skip_msg baseline repeat10x repeat10x / baseline
    #     end
    #     @test_skip repeat10x < 2 * baseline
    # else
        @test repeat10x < 2 * baseline
    # end
end

end  # module
