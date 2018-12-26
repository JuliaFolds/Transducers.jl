module TestContexts
include("preamble.jl")

@testset "mapfoldl" begin
    # https://clojure.org/reference/transducers#_transduce
    xf = Filter(isodd) |> Map(inc)
    @testset for xs in iterator_variants(0:4)
        @test mapfoldl(xf, +, 0, xs) == 6
        @test mapfoldl(xf, +, 100, xs) == 106
    end

    # https://clojuredocs.org/clojure.core/transduce
    xf = Filter(isodd) |> Take(10)
    @testset "$(typeof(xs))" for xs in iterator_variants(0:1000)
        @test mapfoldl(xf, push!, Int[], xs) == 1:2:19
        @test mapfoldl(xf, +, 0, xs) == 100
        @test mapfoldl(xf, +, 17, xs) == 117
        @test mapfoldl(xf, string, "", xs) == "135791113151719"

        @test transduce(push!, xf, Int[], xs) == Reduced(1:2:19)
        @test transduce(+, xf, 0, xs) == Reduced(100)
        @test transduce(+, xf, 17, xs) == Reduced(117)
        @test transduce(string, xf, "", xs) == Reduced("135791113151719")
    end
end

@testset "eduction" begin
    # https://clojuredocs.org/clojure.core/eduction
    xf = Filter(isodd) |> Take(5)
    @testset "$(typeof(xs))" for xs in iterator_variants(0:1000)
        @test collect(xf, xs) == 1:2:9
        @test collect(eduction(xf, xs)) == 1:2:9
    end

    @testset for xs in iterator_variants(1:5)
        @test collect(xf, xs) == 1:2:5
        @test collect(eduction(xf, xs)) == 1:2:5
    end

    ed = eduction(xf, 1:5)
    @test finaltype(ed.rf) === Int
end

@testset "append!" begin
    # https://clojuredocs.org/clojure.core/into#example-57294b20e4b050526f331420
    xf = Map(x -> x + 2) |> Filter(isodd)
    @testset for xs in iterator_variants(0:9)
        @test append!(xf, [-1, -2], xs) == [-1, -2, 3, 5, 7, 9, 11]
    end
end

@testset "map!" begin
    xs0 = 1:10
    @testset for src in [xs0, collect(xs0)]
        dest = similar(xs0)
        @test map!(Scan(+), dest, src) === dest
        @test dest == cumsum(xs0)
    end

    xs0 = 1:5
    @testset for src in [xs0, collect(xs0)]
        dest = zero(src)
        @test map!(Filter(isodd) |> Scan(+), dest, src) == [1, 0, 4, 0, 9]
    end
end

@testset "copy!" begin
    xs0 = 1:10
    @testset for src in [xs0, collect(xs0)]
    # @testset for src in iterator_variants(xs0)  # TODO: fix
        dest = similar(xs0)
        @test copy!(Scan(+), dest, src) === dest
        @test dest == cumsum(src)
    end

    xs0 = 1:5
    @testset for src in [xs0, collect(xs0)]
    # @testset for src in iterator_variants(xs0)  # TODO: fix
        dest = zero(xs0)
        @test copy!(Filter(isodd) |> Scan(+), dest, src) == [1, 4, 9]
    end
end

@testset "simple_transduce" begin
    xf = PartitionBy(x -> x > 0) |>
        Filter(xs -> mean(abs, xs) < 1.0) |>
        Map(prod)

    for _ in 1:100
        xs = randn(100)
        @test transduce(+, xf, 0.0, xs) == simple_transduce(+, xf, 0.0, xs)
    end
end

end  # module
