module TestProductRF

include("preamble.jl")

@testset "count_sum" begin
    @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
        foldl = nothing
        count_sum(xs, xf = Map(identity)) =
            fold(ProductRF(+, +), opcompose(xf, Map(x -> (1, x))), xs)

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
            fold(ProductRF(min, reducingfunction(Filter(isodd), max)), Map(x -> (x, x)), xs)
        @test f([5, 2, 6, 8, 3]) == (2, 5)
        @test_throws EmptyResultError f(2:2:8)
    end
end

@testset "init" begin
    @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
        foldl = nothing
        @test fold(ProductRF(+, +), Map(x -> (x, x)), 1:9) == (45, 45)
        @test fold(ProductRF(+, +), Map(x -> (x, x)), 1:9, init = (0, 0)) == (45, 45)
    end
    @test foldl(ProductRF(+, +), Map(x -> (x, x)), 1:9; init = (1, 2)) == (46, 47)
end

@testset "standard fold" begin
    @test mapfoldl(x -> (x, x), ProductRF(min, max), [5, 2, 6, 8, 3]) == (2, 8)
end

@testset "error handling" begin
    rf = ProductRF(min, max)
    err = @test_error rf(0, (1, 2))
    msg = sprint(showerror, err)
    @test occursin("incompatible accumulator", msg)
end

end  # module
