module TestMightReturnReduced

using Test
using Transducers
using Transducers: _might_return_reduced

@testset "_might_return_reduced" begin
    @test !_might_return_reduced(reducingfunction(Map(identity), +), 0, 1:1)
    @test !_might_return_reduced(reducingfunction(Filter(isodd), +), 0, 1:1)
    @test _might_return_reduced(reducingfunction(ReduceIf(isodd), +), 0, 1:1)
    @test _might_return_reduced(reducingfunction(ReduceIf(ismissing), +), 0, [0, missing])
    @test _might_return_reduced(reducingfunction(ReduceIf(ismissing), +), 0, Any[])
    @test !_might_return_reduced(reducingfunction(ReduceIf(ismissing), +), 0, 1:1)
    @test !_might_return_reduced(
        reducingfunction(ReduceIf(ismissing), +),
        0,
        ntuple(identity, 20),
    )
    # These tests are very version dependant. We need to find a smarter way of dealing with them
    # Removed for now.
    @test Transducers.__reduce_dummy(+, 0, Transducers.SizedReducible([1,2,3,4,5], 2)) == 15
    @test_skip _might_return_reduced(reducingfunction(ReduceIf(ismissing), +), 0, (0, missing))
    @test_skip _might_return_reduced(reducingfunction(ReduceIf(ismissing), +), 0, (missing, 0))
    @test_skip _might_return_reduced(
        reducingfunction(ReduceIf(ismissing), +),
        0,
        (ntuple(identity, 20)..., missing),
    )
    # It doesn't matter if it's going to throw:
    @test _might_return_reduced(reducingfunction(Map(throw), +), 0, 1:1) isa Bool
    @test _might_return_reduced(reducingfunction(Map(_ -> _uninferable_), +), 0, 1:1)
end

end  # module
