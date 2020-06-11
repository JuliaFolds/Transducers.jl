module TestTransducers

import PerformanceTestTools
using Distributed: addprocs, nworkers
using Test

if get(ENV, "CI", "false") == "true"
    # Tests in `PerformanceTestTools.@include_foreach` might cause
    # pre-compilation errors as two processes try to compile packages
    # at the same time.  This can happen when the tests are run via
    # `Pkg.test`.
    include("LoadAllPackages.jl")
    LoadAllPackages.loadall()

    addprocs(3)
end
@info "Testing with:" nworkers()

@testset "$file" for file in sort([file for file in readdir(@__DIR__) if
                                   match(r"^test_.*\.jl$", file) !== nothing])

    if file == "test_doctest.jl"
        if lowercase(get(ENV, "JULIA_PKGEVAL", "false")) == "true"
            @info "Skipping doctests on PkgEval."
            continue
        elseif VERSION >= v"1.5-"
            @info "Skipping doctests on Julia $VERSION."
            continue
        elseif VERSION < v"1.1"
            # `Broadcasting` tests fail in in Julia 1.0
            @info "Skipping doctests on Julia $VERSION."
            continue
        end
    end

    # Do not support `Broadcasting` in Julia 1.0
    VERSION < v"1.1" && file == "test_broadcasting.jl" && continue

    # BlockArrays.jl 0.11 only support Julia 1.1 and above.
    VERSION < v"1.1" && file == "test_blockarrays.jl" && continue

    include(file)
end

PerformanceTestTools.@include_foreach(
    "threads/runtests.jl",
    [nothing, ["JULIA_NUM_THREADS" => Threads.nthreads() > 1 ? "1" : "2"]],
    parallel = true,
)

end  # module
