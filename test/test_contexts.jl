module TestContexts
include("preamble.jl")

@testset "mapfoldl" begin
    # https://clojure.org/reference/transducers#_transduce
    xf = Filter(isodd) |> Map(inc)
    @test mapfoldl(xf, +, 0, 0:4) == 6
    @test mapfoldl(xf, +, 100, 0:4) == 106

    # https://clojuredocs.org/clojure.core/transduce
    xf = Filter(isodd) |> Take(10)
    @test mapfoldl(xf, push!, Int[], 0:1000) == 1:2:19
    @test mapfoldl(xf, +, 0, 0:1000) == 100
    @test mapfoldl(xf, +, 17, 0:1000) == 117
    @test mapfoldl(xf, string, "", 0:1000) == "135791113151719"
end

@testset "eduction" begin
    # https://clojuredocs.org/clojure.core/eduction
    xf = Filter(isodd) |> Take(5)
    @test collect(xf, 1:1000) == 1:2:9
    @test collect(eduction(xf, 1:1000)) == 1:2:9

    @test collect(xf, 1:5) == 1:2:5
    @test collect(eduction(xf, 1:5)) == 1:2:5

    ed = eduction(xf, 1:5)
    @test finaltype(ed.rf) === Int
end

@testset "append!" begin
    # https://clojuredocs.org/clojure.core/into#example-57294b20e4b050526f331420
    xf = Map(x -> x + 2) |> Filter(isodd)
    @test append!(xf, [-1, -2], 0:9) == [-1, -2, 3, 5, 7, 9, 11]
end

@testset "map!" begin
    src = 1:10
    dest = similar(src)
    @test map!(Scan(+), dest, src) === dest
    @test dest == cumsum(src)

    src = 1:5
    dest = zero(src)
    @test map!(Filter(isodd) |> Scan(+), dest, src) == [1, 0, 4, 0, 9]

    @test collect(Scan(max), [0, -1, 3, -2, 1]) == [0, 0, 3, 3, 3]
    @test collect(Scan(min), [0, -1, 3, -2, 1]) == [0, -1, -1, -2, -2]
end

@testset "copy!" begin
    src = 1:10
    dest = similar(src)
    @test copy!(Scan(+), dest, src) === dest
    @test dest == cumsum(src)

    src = 1:5
    dest = zero(src)
    @test copy!(Filter(isodd) |> Scan(+), dest, src) == [1, 4, 9]
end

end  # module
