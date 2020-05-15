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
        @test_inferred foldl(+, PartitionBy(identity) |> Map(first), xs)
        @test_inferred foldl(+, Unique(), xs)
        @test_inferred foldl(right, ZipSource(Filter(isodd) |> Map(inc)), xs)

        # Nested stateful transducers.  (The ones with `right` and
        # `Map(x -> x::Int)` actually succeeded in some REPL
        # sessions...  Maybe some caching problem?)
        @test_broken_inferred foldl(right, Scan(+) |> Scan(+), xs)
        @test_broken_inferred foldl(*, Scan(+) |> Scan(+), xs)
        @test_broken_inferred foldl(*, Scan(+) |> Scan(+), xs; init=1)
        @test_broken_inferred foldl(*, Scan(+) |> Map(x -> x::Int) |> Scan(+), xs)
    end
    @test_inferred foldl(+, Cat(), [[1]])

    @testset "type constructor" begin
        xf = Map(Float64)
        @test_inferred foldl(+, xf, Int[1])

        xf = MapSplat(ComplexF64)
        @test_inferred foldl(+, xf, Tuple{Int, Int}[(1, 1)])
    end
end

@testset "collect" begin
    @testset for xs in collections
        @test_inferred collect(Map(exp), xs)
        @test_inferred collect(Map(exp) |> Filter(x -> x > 0), xs)
        @test_inferred collect(
            Enumerate() |> Map(last) |> Map(exp) |> Filter(x -> x > 0),
            xs,
        )
    end
end

hasnothing(xs) = foreach(Map(identity), xs) do x
    if x === nothing
        return reduced(Val(true))
    end
end |> ifunreduced() do _
    Val(false)
end

@testset "foreach" begin
    @testset for xs in collections
        @test_inferred foreach(constant(nothing), Map(exp), xs)
        @test_inferred foreach(constant(nothing), Map(exp) |> Filter(x -> x > 0),
                               xs)
    end
    @test (@inferred hasnothing((1, 2, 3))) === Val(false)
    @test (@inferred hasnothing((1, nothing, 3))) === Val(true)
end

@testset "eduction" begin
    @testset for xs in collections
        @test_inferred eduction(Map(exp), xs)
        @test_inferred eduction(Map(exp) |> Filter(x -> x > 0), xs)
    end
end

end  # module
