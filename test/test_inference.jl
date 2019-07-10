module TestInference

include("preamble.jl")
using Transducers: _nonidtype, DefaultInit, OptInit

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
    @test _nonidtype(Union{DefaultInit{typeof(+)}, Float64}) === Float64
end

@testset "foldl" begin
    @testset for xs in collections
        @test_inferred foldl(+, Map(exp), xs; init=0.0)
        @test_inferred foldl(+, Map(exp), xs; init=OptInit)
        @test_inferred foldl(+, Map(exp) |> Filter(x -> x > 0), xs; init=0.0)
        @test_inferred foldl(+, Map(exp) |> Filter(x -> x > 0), xs; init=OptInit)
    end
    @testset for xs in [
        1:1,
        Base.Generator(identity, 1:1),
    ]
        @test_inferred foldl(+, Map(exp), xs)
        @test_inferred foldl(+, Map(exp) |> Filter(x -> x > 0), xs)
        @test_inferred foldl(+, Map(exp) |> Scan(+), xs)
        @test_inferred foldl(+, TakeLast(1), xs)
        @test_broken_inferred foldl(+, PartitionBy(identity) |> Map(first), xs)
        @test_inferred foldl(+, Unique(), xs)
        @test_broken_inferred foldl(right, TeeZip(Filter(isodd) |> Map(inc)), xs)

        # Nested stateful transducers.  (The ones with `right` and
        # `Map(x -> x::Int)` actually succeeded in some REPL
        # sessions...  Maybe some caching problem?)
        @test_broken_inferred foldl(right, Scan(+) |> Scan(+), xs)
        @test_broken_inferred foldl(*, Scan(+) |> Scan(+), xs)
        @test_broken_inferred foldl(*, Scan(+) |> Scan(+), xs; init=1)
        @test_broken_inferred foldl(*, Scan(+) |> Map(x -> x::Int) |> Scan(+), xs)
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
