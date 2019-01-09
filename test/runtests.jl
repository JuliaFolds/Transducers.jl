module TestTransducers
using Test

@testset "$file" for file in [
        "test_library.jl",
        "test_processes.jl",
        "test_show.jl",
        "test_examples_transducers.jl",
        "test_examples_words.jl",
        "test_examples_primes.jl",
        "test_examples_tutorial_missings.jl",
        "test_ir.jl",
        ]
    include(file)
end

end  # module

using Test
@testset "doctest" begin
    include("../docs/utils.jl")
    transducers_makedocs(examples=[])
    @test true
end
