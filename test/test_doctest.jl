module TestDoctest

using Documenter
using Test
using Transducers

# Workaround: Failed to evaluate `CurrentModule = Transducers` in `@meta` block.
@eval Main import Transducers

@testset "/docs" begin
    doctest(Transducers; manual=true)
end

@testset "/test/doctests" begin
    doctest(joinpath((@__DIR__), "doctests"), Module[])
end

end  # module
