module TestMapreduce
include("preamble.jl")
using Transducers: air

@testset "mapreduce" begin
    xf = opcompose(Filter(isodd), Map(inc))

    ans = @test_deprecated mapreduce(xf, +, 0:4, init = 0)
    DEPWARN_ERROR || @test ans == 6

    ans = @test_deprecated mapreduce(
        xf,
        +,
        air.([1:5;] .- 1);
        init = 0,
        basesize = typemax(Int),  # Broadcasted is not parallelizable yet
    )
    DEPWARN_ERROR || @test ans == 6

    ans = @test_deprecated mapreduce(xf, +, skipmissing(Any[0:4;]), init = 0)
    DEPWARN_ERROR || @test ans == 6

    ans = @test_deprecated mapreduce(xf, +, 1, init = 0)
    DEPWARN_ERROR || @test ans == 2

    @test_throws ErrorException air(1)
end

end  # module
