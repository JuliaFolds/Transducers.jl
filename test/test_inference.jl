module TestInference

include("preamble.jl")

@testset "collect" begin
    @testset for xs in [
        1:1,
        1:0,
        Base.Generator(identity, 1:1),
        Base.Generator(identity, 1:0),
    ]
        @test_inferred collect(Map(exp), xs)
        @test_inferred collect(Map(exp) |> Filter(x -> x > 0), xs)
    end
end

end  # module
