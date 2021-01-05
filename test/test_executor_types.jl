module TestExecutorTypes

using Test
using Transducers
using Transducers: maybe_set_simd

@testset "show" begin
    @test occursin("ThreadedEx()", sprint(show, ThreadedEx()))
    @test occursin("ThreadedEx(simd = true)", sprint(show, ThreadedEx(simd = true)))
    @test occursin(
        "ThreadedEx(simd = true, basesize = 2)",
        sprint(show, ThreadedEx(simd = true, basesize = 2)),
    )
end

@testset "repr" begin
    @testset for x in [
        ThreadedEx(),
        ThreadedEx(simd = true),
        ThreadedEx(simd = true, basesize = 2),
        ThreadedEx{Any}(),
        ThreadedEx{Any}(simd = true),
        ThreadedEx{Any}(simd = true, basesize = 2),
    ]
        str = repr(x)
        reconstructed = include_string(@__MODULE__, str)
        @test reconstructed == x
    end
end

@testset "maybe_set_simd" begin
    @test maybe_set_simd(SequentialEx(), true).kwargs.simd === true
    @test maybe_set_simd(SequentialEx(), false).kwargs.simd === false
    @test maybe_set_simd(SequentialEx(simd = false), true).kwargs.simd === false
    @test maybe_set_simd(SequentialEx(simd = true), false).kwargs.simd === true
end

end  # module
