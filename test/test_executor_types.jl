module TestExecutorTypes

using Test
using Transducers

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

end  # module
