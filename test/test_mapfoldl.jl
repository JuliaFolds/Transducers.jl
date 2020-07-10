module TestMapfoldl
include("preamble.jl")

const DEPWARN_ERROR = !(Base.JLOptions().depwarn in (0, 1))

@testset "mapfoldl" begin
    xf = opcompose(Filter(isodd), Map(inc))

    ans = @test_deprecated mapfoldl(xf, +, 0:4, init = 0)
    DEPWARN_ERROR || @test ans == 6

    ans = @test_deprecated mapfoldl(xf, +, eduction(x - 1 for x in 1:5), init = 0)
    DEPWARN_ERROR || @test ans == 6
end

@testset "identityof error" begin
    if !DEPWARN_ERROR
        err = @test_deprecated @test_error mapfoldl(Map(identity), +, Any[])
        @test_broken err isa EmptyResultError

        err = @test_deprecated @test_error mapfoldl(Map(identity), +, Vector{Int}[])
        @test_broken err isa EmptyResultError
    end
end

end  # module
