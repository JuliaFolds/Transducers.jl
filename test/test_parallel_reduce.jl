module TestParallelReduce
include("preamble.jl")

const records = []
const records_lock = Threads.SpinLock()

find(needle) = function(found, x)
    try
        lock(records_lock)
        push!(records, x)
    finally
        unlock(records_lock)
    end
    if x == needle
        Reduced(true)
    else
        found
    end
end

@testset "early termination (runtime)" begin
    @test reduce(find(1), Map(identity), 1:32; basesize=1, init=false)
    if VERSION >= v"1.3-alpha"
        if Threads.nthreads() == 1
            @test length(records) == 1
        else
            # Not sure if this safe, but let's check if _some_
            # tasks are canceled.
            @test length(records) < sum(2 .^ (0:5))
            # (though it seems `length(records)` is always 1?)
        end
    end
end

@testset "early termination (grid)" begin
    @testset for needle in 1:20, len in 1:20
        empty!(records)
        @test reduce(find(needle), Map(identity), 1:len;
                     basesize=1, init=false) == (needle <= len)
    end
end

end  # module
