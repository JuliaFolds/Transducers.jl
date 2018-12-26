module TestTransducers
using Test

@testset "$file" for file in [
        "test_library.jl",
        "test_contexts.jl",
        "test_ir.jl",
        ]
    include(file)
end

end  # module
