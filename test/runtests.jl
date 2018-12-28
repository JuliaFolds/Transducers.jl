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
