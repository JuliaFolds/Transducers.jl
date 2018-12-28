module TestTransducers
using Test

@testset "$file" for file in [
        "test_library.jl",
        "test_processes.jl",
        "test_ir.jl",
        ]
    include(file)
end

end  # module

using Test
@testset "doctest" begin
    include("../docs/utils.jl")
    transducers_makedocs()
    @test true
end
