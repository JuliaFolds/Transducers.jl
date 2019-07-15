module TestTransducers
using Test

@testset "$file" for file in ["test_examples_primes.jl"]
    include(file)
end

end  # module
