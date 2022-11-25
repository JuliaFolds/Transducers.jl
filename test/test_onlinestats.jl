module TestOnlineStats

include("preamble.jl")
using OnlineStats: Mean, EqualWeight
using Transducers: InitialValue, combine, InitialValue, reducingfunction

@testset "reducingfunction" begin
    @test reducingfunction(Mean()) isa Function
    @test reducingfunction(Map(identity), Mean()) isa Function
end
@testset "basics" begin
    @test Transducer(Mean()) isa Transducer
    @test combine(reducingfunction(Mean()), InitialValue(Mean()), Mean()) == Mean()
    @test foldxl(Mean(), 1:10) == Mean(5.5, EqualWeight(), 10)
end


end
