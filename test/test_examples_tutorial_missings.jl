module TestExamplesTutorialMissings
include("../examples/tutorial_missings.jl")

using Test

@testset "outtype of xf_sum_columns" begin
    @test_broken eltype(eduction(xf_sum_columns(Float64[]), Any[])) ===
        Vector{Float64}
    @test eltype(eduction(xf_sum_columns(Float64[]), Any[])) <: Vector
end

end  # module
