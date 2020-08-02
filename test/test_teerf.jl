module TestTeeRF

include("preamble.jl")

TeeRF_by_ProductRF(fs...) = TeeRF_by_ProductRF(fs)
TeeRF_by_ProductRF(fs::Tuple) =
    reducingfunction(Map(x -> ntuple(_ -> x, length(fs))), ProductRF(fs))

@testset "extrema" begin
    @testset "$TeeRF" for TeeRF in [TeeRF, TeeRF_by_ProductRF]
        @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
            foldl = nothing
            custom_extrema(xs, xf = Map(identity)) = fold(TeeRF(min, max), xf, xs)
            @test custom_extrema([5, 2, 6, 8, 3]) == (2, 8)
            @test custom_extrema([5, 2, 6, 8, 3], Filter(isodd)) == (3, 5)
            @test_throws EmptyResultError custom_extrema(1:0)
            @test_throws EmptyResultError custom_extrema(1:10, Filter(_ -> false))
        end
    end
end

@testset "partially started" begin
    @testset "$TeeRF" for TeeRF in [TeeRF, TeeRF_by_ProductRF]
        @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
            foldl = nothing
            f(xs) =
                fold(TeeRF(min, reducingfunction(Filter(isodd), max)), Map(identity), xs)
            @test f([5, 2, 6, 8, 3]) == (2, 5)
            @test_throws EmptyResultError f(2:2:8)
        end
    end
end

@testset "nested" begin
    @testset "$TeeRF" for TeeRF in [TeeRF, TeeRF_by_ProductRF]
        @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
            foldl = nothing
            @test fold(
                TeeRF(TeeRF(min, max), +, TeeRF(reducingfunction(Map(isodd), |), *)),
                Map(identity),
                [5, 2, 6, 8, 3],
            ) === ((2, 8), 24, (true, 1440))
            @test fold(TeeRF(TeeRF(TeeRF(min))), Map(identity), [5, 2, 6, 8, 3]) ===
                  (((2,),),)
        end
    end
end

@testset "trivial" begin
    @testset "$TeeRF" for TeeRF in [TeeRF, TeeRF_by_ProductRF]
        @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
            @test fold(TeeRF(()), Map(identity), [5, 2, 6, 8, 3]) === ()
        end
    end
end

@testset "init" begin
    @testset "$TeeRF" for TeeRF in [TeeRF, TeeRF_by_ProductRF]
        @testset "$fold" for fold in [foldl, simple_reduce, foldxt_bs1, foldxt]
            foldl = nothing
            @test fold(TeeRF(+, +), Map(identity), 1:9) === (45, 45)
            @test fold(TeeRF(+, +), Map(identity), 1:9, init = 0.0) === (45.0, 45.0)
        end
        @test foldl(TeeRF(+, +), Map(identity), 1:2; init = 1) === (4, 4)
        @test foldl(TeeRF(+, +), Map(identity), 1:2; init = (0, 1)) === (3, 4)
    end
end

@testset "error handling" begin
    err = @test_error foldl(TeeRF(min, max), [5, 2, 6, 8, 3])
    msg = sprint(showerror, err)
    @test occursin("incompatible accumulator", msg)
end

end  # module
