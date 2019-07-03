using Test

@testset "doctest" begin
    include("../docs/utils.jl")
    transducers_rm_examples()
    transducers_makedocs(examples=[])
    @test true
end
