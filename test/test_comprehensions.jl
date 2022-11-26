module TestComprehensions

include("preamble.jl")
using Transducers: amount, NoAdjoint

@testset "eduction(comprehension)" begin
    iter = (x for x in 1:10 if x % 2 == 0)
    ed = eduction(iter)
    @test collect(iter) == collect(ed)

    iter = (y for x in 1:10 if x % 2 == 0 for y in (x, x + 1))
    ed = eduction(iter)
    @test collect(iter) == collect(ed)

    iter = ((x, y) for x in 1:3, y in 1:2)
    ed = eduction(iter)
    @test vec(collect(iter)) == collect(ed)
end

@testset "Transducer(comprehension)" begin
    xf1 = Transducer(2x for x in nothing if x % 2 == 0)
    xf2 = opcompose(Filter(x -> x % 2 == 0), Map(x -> 2x))
    xs = 1:10
    @test collect(xf1, xs) == collect(xf2, xs)
    @test_throws ArgumentError Transducer((x+y for x in 1:5, y in 1:5))
    @test_throws ArgumentError Transducer((x for x in (x for x in 1:10)))
end

@testset "Split" begin
    @test amount(NoAdjoint(1:10)) == amount(1:10)
end

end  # module
