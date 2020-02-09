module TestTransducersThreads

using Test
import PerformanceTestTools

@testset "$file" for file in sort([file for file in readdir(@__DIR__) if
                                   match(r"^test_.*\.jl$", file) !== nothing])

    PerformanceTestTools.@include_foreach(
        file,
        [nothing, ["JULIA_NUM_THREADS" => Threads.nthreads() > 1 ? "1" : "2"]],
    )
end

end  # module
