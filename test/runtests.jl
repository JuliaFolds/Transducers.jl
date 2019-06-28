module TestTransducers
using Test

@testset "$file" for file in sort([file for file in readdir(@__DIR__) if
                                   match(r"^test_.*\.jl$", file) !== nothing])
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
