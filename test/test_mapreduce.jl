module TestMapreduce
include("preamble.jl")
using Transducers: air

const DEPWARN_ERROR = !(Base.JLOptions().depwarn in (0, 1))

@testset "mapreduce" begin
    xf = opcompose(Filter(isodd), Map(inc))

    ans = @test_deprecated mapreduce(xf, +, 0:4, init = 0)
    DEPWARN_ERROR || @test ans == 6

    ans = @test_deprecated mapreduce(xf, +, air.([1:5;] .- 1), init = 0)
    DEPWARN_ERROR || @test ans == 6

    ans = @test_deprecated mapreduce(xf, +, skipmissing(Any[0:4;]), init = 0)
    DEPWARN_ERROR || @test ans == 6

    ans = @test_deprecated mapreduce(xf, +, 1, init = 0)
    DEPWARN_ERROR || @test ans == 2
end

end  # module
