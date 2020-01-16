module TestParallelReduce
include("preamble.jl")
using Transducers: transduce_assoc
using StructArrays: StructVector

struct Recorder
    records
    lock
end

Recorder() = Recorder([], Threads.SpinLock())

function (recorder::Recorder)(x)
    try
        lock(recorder.lock)
        push!(recorder.records, x)
        return x
    finally
        unlock(recorder.lock)
    end
end

@testset "early termination (runtime)" begin
    recorder = Recorder()
    records = recorder.records
    @test reduce(right, Map(recorder) |> ReduceIf(==(1)), 1:32;
                 basesize=1) === 1
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
        @test reduce(right, ReduceIf(x -> x >= needle), 1:len; basesize=1) ==
            min(needle, len)
    end
end

@testset "early termination (shuffle)" begin
    @testset for seed in rand(UInt32, 10), p in Any[50, 95, 99, Inf]
        rng = MersenneTwister(seed)
        basesize = 16
        xs = collect(enumerate(rand(rng, 1:100, 100 * basesize)))
        xf = ReduceIf(x -> x[2] >= p)
        @test reduce(right, xf, xs; basesize=basesize) == foldl(right, xf, xs)
    end
end

@testset "`complete` should not be called on `Reduced`" begin
    rf!(x, y) = append!!(x, y)
    rf!(x::Reduced) = error("rf!(", typeof(xf), ") is called")
    rf!(x) = x

    xf = TakeWhile(x -> x > 0)
    coll = [1, 2, 3, -1, 1, 2, 0]

    @test transduce(xf, rf!, Union{}[], coll) == reduced([1, 2, 3])
    @test transduce_assoc(xf, rf!, Union{}[], coll) == reduced([1, 2, 3])
end

@testset "tcollect & tcopy" begin
    @test tcollect(Filter(iseven), 1:10, basesize = 2) == 2:2:10
    @test tcopy(
        Map(x -> (a = x,)),
        StructVector,
        1:3,
        basesize = 2,
    ) == StructVector(a = 1:3)
end

@testset "withprogress" begin
    xf = Map() do x
        x
    end
    @test reduce(+, xf, withprogress(1:100; interval=0); basesize=1) == 5050
    @test reduce(+, xf, withprogress(1:100; interval=0); basesize=1, simd=true) == 5050

    xf2 = ScanEmit(0) do u, x
        y = u + x
        y, y
    end
    @test reduce(right, xf2, withprogress(1:100; interval=0); basesize=1) == 5050
    @test reduce(right, xf2, withprogress(1:100; interval=0); basesize=1, simd=true) == 5050
end

end  # module
