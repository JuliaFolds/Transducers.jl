module TestDoctest

using Documenter
using Test
using Transducers

@testset "doctest" begin
    include("../docs/utils.jl")
    transducers_rm_examples()
    doctest(Transducers; manual=true)
end

end  # module
