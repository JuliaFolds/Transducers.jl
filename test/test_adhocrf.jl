module TestAdHocRF

using Test
using Transducers
using Transducers:
    complete,
    foldl_basecase,
    start,
    whencombine,
    whencomplete,
    whencompletebasecase,
    wheninit,
    whenstart
using MicroCollections: EmptyVector
using StaticArrays: MVector, SVector

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
    @test foldxl(collector!!, Filter(isodd), 1:5) == 1:2:5
    @test foldxt(collector!!, Filter(isodd), 1:5; basesize = 1) == 1:2:5
end

counter(n::Integer) = counter(Val(Int(n)))
function counter(::Val{n}) where {n}
    init() = zero(MVector{n,Int})
    function inc!(b, i)
        @inbounds b[max(1, min(i, n))] += 1
        b
    end
    completebasecase(b) = SVector(b)
    combine(h, b) = h .+ b
    return inc! |>
           wheninit(init) |>
           whencompletebasecase(completebasecase) |>
           whencombine(combine)
end

@testset "counter" begin
    @test foldxl(counter(10), 1:10)::MVector == ones(10)
    rf = counter(10)
    @test foldl_basecase(rf, start(rf, Init)::MVector, 1:10)::SVector == ones(10)
    @test foldxl(rf, 1:10)::MVector == ones(10)
    @test foldxt(rf, 1:10)::SVector == ones(10)
    @test foldxt(rf, 1:10; basesize = 1)::SVector == ones(10)
    # @test foldxd(rf, 1:10)::SVector == ones(10)  # TODO: test this

    @test foldxt(TeeRF(rf, rf), 1:10)::NTuple{2,SVector} == (ones(10), ones(10))
    @test foldxt(TeeRF(rf, rf), 1:10; basesize = 1)::NTuple{2,SVector} ==
          (ones(10), ones(10))
end

getoninit(rf) = rf.oninit

@testset "inference" begin
    rf = wheninit(EmptyVector, append!!)
    @test @inferred(getoninit(rf)) === EmptyVector
end

end  # module
