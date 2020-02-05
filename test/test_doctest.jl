module TestDoctest

using Documenter
using Test
using Transducers

@testset "doctest" begin
    if VERSION >= v"1.5-"
        @info "Skipping doctests on Julia $VERSION."
        return
    end
    include("../docs/utils.jl")
    transducers_rm_examples()
    doctest(Transducers; manual=true)
end

end  # module
