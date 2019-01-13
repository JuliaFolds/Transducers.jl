module TestCore
include("preamble.jl")
using Transducers: has

@testset "has" begin
    @test has(Count(), Count)
    @test has(Map(identity) |> Count(), Count)
    @test has(Count() |> Map(identity), Count)
end

end  # module
