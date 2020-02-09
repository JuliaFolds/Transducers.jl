module TestTransducers
using Distributed: addprocs, nworkers
using Test

if get(ENV, "CI", "false") == "true"
    addprocs(3)
end
@info "Testing with:" nworkers()

@testset "$file" for file in sort([file for file in readdir(@__DIR__) if
                                   match(r"^test_.*\.jl$", file) !== nothing])

    # BlockArrays.jl 0.11 only support Julia 1.1 and above.
    VERSION < v"1.1" && file == "test_blockarrays.jl" && continue

    include(file)
end

include("threads/runtests.jl")

end  # module
