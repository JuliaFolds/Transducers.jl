module TestTransducers
using Distributed: addprocs, nworkers
using Test

if get(ENV, "CI", "false") == "true"
    addprocs(3)
end
@info "Testing with:" nworkers()

@testset "$file" for file in sort([file for file in readdir(@__DIR__) if
                                   match(r"^test_.*\.jl$", file) !== nothing])
    include(file)
end

end  # module
