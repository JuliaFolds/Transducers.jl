module TestInference

include("preamble.jl")
using Transducers: _nonidtype, DefaultId, OptId

collections = [
    1:1,
    1:0,
    Base.Generator(identity, 1:1),
    Base.Generator(identity, 1:0),
]

constant(x) = (_...) -> x

@testset "_nonidtype" begin
    # This is required for "foldl without init" tests below work:
    @test _nonidtype(Float64) === Float64
    @test _nonidtype(Union{DefaultId{typeof(+)}, Float64}) === Float64
end

@testset "foldl" begin
    @testset for xs in collections
        @test_inferred foldl(+, Map(exp), xs; init=0.0)
        @test_inferred foldl(+, Map(exp), xs; init=OptId)
        @test_inferred foldl(+, Map(exp) |> Filter(x -> x > 0), xs; init=0.0)
        @test_inferred foldl(+, Map(exp) |> Filter(x -> x > 0), xs; init=OptId)
    end
    @testset for xs in [
        1:1,
        Base.Generator(identity, 1:1),
    ]
        @test_inferred foldl(+, Map(exp), xs)
        @test_inferred foldl(+, Map(exp) |> Filter(x -> x > 0), xs)
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
