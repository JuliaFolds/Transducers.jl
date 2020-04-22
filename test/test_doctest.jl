module TestDoctest

using Documenter
using Test
using Transducers

@testset "doctest" begin
    if lowercase(get(ENV, "JULIA_PKGEVAL", "false")) == "true"
        @info "Skipping doctests on PkgEval."
    elseif VERSION >= v"1.5-"
        @info "Skipping doctests on Julia $VERSION."
    else
        include("../docs/utils.jl")
        transducers_rm_examples()
        doctest(Transducers; manual=true)
    end
end

end  # module
