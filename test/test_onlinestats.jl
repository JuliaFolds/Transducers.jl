module TestOnlineStats

include("preamble.jl")
using OnlineStats: Mean

@testset "reducingfunction" begin
    @test reducingfunction(Mean()) isa Function
    @test reducingfunction(Map(identity), Mean()) isa Function
end

end
