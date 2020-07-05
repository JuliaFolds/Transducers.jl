module TestDoctest

using Documenter
using Test
using Transducers

@testset "/docs" begin
    doctest(Transducers; manual=true)
end

@testset "/test/doctests" begin
    doctest(joinpath((@__DIR__), "doctests"), Module[])
end

end  # module
