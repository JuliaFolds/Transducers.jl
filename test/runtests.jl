module TestTransducers
using Test

testfiles = [
    "test_core.jl",
    "test_library.jl",
    "test_processes.jl",
    "test_show.jl",
    "test_simd.jl",
    "test_examples_transducers.jl",
    "test_examples_words.jl",
    "test_examples_primes.jl",
    "test_examples_tutorial_missings.jl",
]

@testset "$file" for file in testfiles
    include(file)
end

end  # module

using Test
@testset "doctest" begin
    include("../docs/utils.jl")
    transducers_rm_examples()
    transducers_makedocs(examples=[])
    @test true
end
