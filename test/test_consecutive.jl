module TestConsecutive
include("preamble.jl")
using BangBang.NoBang: SingletonVector

@testset "step = 1" begin
    @testset "$fold" for fold in all_folds()
        foldl = nothing  # don't touch this function here

        @testset "1:$n |> Consecutive($k, 1)" for k in 1:9, n in 1:9+k
            @test fold(
                append!!,
                opcompose(Consecutive(k, 1), Map(SingletonVector)),
                1:n;
                init = Union{}[],
            ) == [ntuple(j -> i + j - 1, k) for i in 1:n-k+1]
        end
    end
end

@testset "step > 1" begin
    @testset "1:$n |> Consecutive($k, $s)" for k in 1:9, n in 1:3, s in 2:4
        @test foldxl(
            append!!,
            opcompose(Consecutive(k, s), Map(SingletonVector)),
            1:n;
            init = Union{}[],
        ) == [ntuple(j -> i + j - 1, k) for i in 1:s:n-k+1]
    end
end

@testset "constructors" begin
    @test Consecutive(5) === Consecutive(5, 5)
    @test Consecutive(5; step = 3) === Consecutive(5, 3)
    @test Consecutive(Val(5)) === Consecutive(5, 5)
    @test Consecutive(Val(5); step = Val(3)) === Consecutive(5, 3)
end

end
