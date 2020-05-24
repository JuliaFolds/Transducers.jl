module TestCustomFoldl

""" A package that is not "aware" of Transducers.jl """
module CustomFoldl
using InitialValues
function custom_foldl(op, itr; init = Init)
    op = adjoininit(op)
    acc = acc0 = initialize(init, op)
    for x in itr
        acc = op(acc, x)
    end
    acc isa InitialValues.InitialValue && acc === acc0 &&
        throw(ArgumentError("reducing over an empty collection is not allowed"))
    return acc
end
end  # module CustomFoldl

using .CustomFoldl: custom_foldl

include("preamble.jl")
using InitialValues: adjoininit
using Transducers: complete, start

add(a, b) = a + b

@testset "custom_foldl" begin
    @test custom_foldl(+, 1:4) == 10
    @test custom_foldl(add, 1:4) == 10
    @test_throws ArgumentError custom_foldl((a, b) -> a + b, Int[])
end

@testset "Filter" begin
    rf = adjoininit(reducingfunction(Filter(isodd), add))
    @test custom_foldl(rf, 1:8; init = start(rf, Init)) == 16
    @test custom_foldl(rf, 2:9; init = start(rf, Init)) == 24
end

@testset "MapCat" begin
    rf = adjoininit(reducingfunction(MapCat(x -> 1:x), add))
    @test custom_foldl(rf, 1:9; init = start(rf, Init)) == 165
end

@testset "Filter MapCat" begin
    rf = adjoininit(reducingfunction(Filter(isodd) |> MapCat(x -> 1:x), add))
    @test custom_foldl(rf, 1:9; init = start(rf, Init)) == 95
end

@testset "MapCat Filter" begin
    rf = adjoininit(reducingfunction(MapCat(x -> 1:x) |> Filter(isodd), add))
    @test custom_foldl(rf, 1:9; init = start(rf, Init)) == 85
end

@testset "Scan" begin
    rf = adjoininit(reducingfunction(Scan(*), Completing(add)))
    @test complete(rf, custom_foldl(rf, 1:4; init = start(rf, Init))) == 33
end

end  # module
