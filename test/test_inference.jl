module TestInference

include("preamble.jl")

collections = [
    1:1,
    1:0,
    Base.Generator(identity, 1:1),
    Base.Generator(identity, 1:0),
]

constant(x) = (_...) -> x

@testset "foldl" begin
    @testset for xs in collections
        @test_inferred foldl(+, Map(exp), xs; init=0.0)
        @test_inferred foldl(+, Map(exp) |> Filter(x -> x > 0), xs; init=0.0)
    end
end

@testset "collect" begin
    @testset for xs in collections
        @test_inferred collect(Map(exp), xs)
        @test_inferred collect(Map(exp) |> Filter(x -> x > 0), xs)
    end
end

@testset "foreach" begin
    @testset for xs in collections
        @test_inferred foreach(constant(nothing), Map(exp), xs)
        @test_inferred foreach(constant(nothing), Map(exp) |> Filter(x -> x > 0),
                               xs)
    end
end

@testset "eduction" begin
    @testset for xs in collections
        @test_inferred eduction(Map(exp), xs)
        @test_inferred eduction(Map(exp) |> Filter(x -> x > 0), xs)
    end
end

end  # module
