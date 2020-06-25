module TestDoctest

using Documenter
using Test
using Transducers

@testset "/docs" begin
    include("../docs/utils.jl")
    transducers_rm_examples()
    doctest(Transducers; manual=true)
end

@testset "/test/doctests" begin
    doctest(joinpath((@__DIR__), "doctests"), Module[])
end

end  # module
