module TestAdHocRF

using Test
using Transducers
using Transducers: wheninit, whencomplete, whencombine, complete, whenstart
using MicroCollections: EmptyVector

@testset "setters" begin
    rf = nothing |> wheninit(1) |> whenstart(2) |> whencomplete(3) |> whencombine(4)
    @test rf.next === nothing
    @test rf.oninit === 1
    @test rf.start === 2
    @test rf.complete === 3
    @test rf.combine === 4
    @test wheninit(10, rf).oninit === 10
    @test wheninit(10, rf).start === 2
end

@testset "collector!!" begin
    collector!! = push!! |> whencombine(append!!) |> wheninit(EmptyVector)
    @test collector!!.next === push!!
    @test collector!!.combine === append!!
    @test collector!!.oninit === EmptyVector
    @test complete(collector!!, Val(1)) === Val(1)
    @test foldl(collector!!, Filter(isodd), 1:5) == 1:2:5
    @test reduce(collector!!, Filter(isodd), 1:5; basesize = 1) == 1:2:5
end

getoninit(rf) = rf.oninit

@testset "inference" begin
    rf = wheninit(EmptyVector, append!!)
    @test @inferred(getoninit(rf)) === EmptyVector
end

end  # module
