module TestTransducers
using Test

testfiles = [
    "test_library.jl",
    "test_processes.jl",
    "test_show.jl",
    "test_simd.jl",
    "test_examples_transducers.jl",
    "test_examples_words.jl",
    "test_examples_primes.jl",
]
if VERSION >= v"1.1-"
    push!(testfiles, "test_examples_tutorial_missings.jl")
end
push!(testfiles, "test_ir.jl")

@testset "$file" for file in testfiles
    include(file)
end

end  # module

using Test
@testset "doctest" begin
    include("../docs/utils.jl")
    transducers_makedocs(examples=[])
    @test true
end
