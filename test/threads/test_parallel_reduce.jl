module TestParallelReduce
include("../preamble.jl")
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
    @test reduce(right, 1:32 |> Map(recorder) |> ReduceIf(==(1));
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
    @testset for needle in 1:20, len in 1:20, stoppable in [true, false]
        @test reduce(
            right,
            ReduceIf(x -> x >= needle),
            1:len;
            basesize = 1,
            stoppable = stoppable,
        ) == min(needle, len)
    end
end

@testset "early termination (shuffle)" begin
    @testset for seed in rand(UInt32, 10), p in Any[50, 95, 99, Inf]
        rng = MersenneTwister(seed)
        basesize = 16
        xs = collect(enumerate(rand(rng, 1:100, 100 * basesize)))
        xf = ReduceIf(x -> x[2] >= p)
        @test reduce(right, xf, xs; basesize=basesize) == foldl(right, xf, xs)
        @test reduce(right, xf, xs; basesize = basesize, stoppable = false) ==
            foldl(right, xf, xs)
    end
end

@testset "empty case" begin
    err = @test_error reduce(+, Map(identity), 1:0)
    msg = sprint(showerror, err)
    @test occursin("The input collection is empty or", msg)
end

@testset "`complete` should not be called on `Reduced`" begin
    rf(_, x) = x
    rf(x::Reduced) = error("rf(", x, ") is called")
    rf(x) = x

    xf = ReduceIf(!ismissing)
    coll = [missing, missing, 1, missing, 2, 3, missing]

    @test transduce(xf, rf, nothing, coll) == reduced(1)
    @testset for basesize in 1:(length(coll)+1)
        @test transduce_assoc(xf, rf, nothing, coll; basesize = basesize) ==
              reduced(1)
    end
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

@testset "tcopy(xf, Set, ...)" begin
    @testset "1:$n" for n in 1:5
        @test tcopy(Map(_ -> 'a'), Set, 1:n) == Set(['a'])
        @testset for basesize in 1:3
            @test tcopy(Map(_ -> 'a'), Set, 1:n, basesize = basesize) == Set(['a'])
        end
    end
    @testset "empty" begin
        @test isempty(tcopy(Filter(_ -> false), Set, [1, 2, 3]))
        @testset for basesize in 1:3
            @test isempty(tcopy(Filter(_ -> false), Set, [1, 2, 3], basesize = basesize))
        end
    end
end

@testset "tcopy(Set, ...)" begin
    @testset for xs in [[1], [1, 1], [1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1, 1]]
        @test tcopy(Set, xs::Transducers.PartitionableArray) == Set([1])
        @testset for basesize in 1:3
            @test tcopy(Set, xs::Transducers.PartitionableArray, basesize = basesize) ==
                Set([1])
        end
    end
    @testset "empty" begin
        @test tcopy(Set, Int[]::Transducers.PartitionableArray) === Empty(Set)
        @testset for basesize in 1:3
            @test tcopy(Set, Int[]::Transducers.PartitionableArray, basesize = basesize) ==
                Empty(Set)
        end
    end
end

@testset "product" begin
    @testset for basesize in 1:6
        @test tcollect(Map(identity), Iterators.product(1:3, 4:5); basesize = basesize) ==
              vec(collect(Iterators.product(1:3, 4:5)))
    end
    @test reduce(+, MapSplat(*), Iterators.product(1:3, 1:3); basesize = 1) == 36
    @test reduce(+, eduction(x * y for x in 1:3, y in 1:3); basesize = 1) == 36
end

@testset "zip" begin
    @test reduce(+, MapSplat(*), zip(1:5, 1:5); basesize = 1) == 55
end

@testset "partition" begin
    @testset for n in 1:10, basesize in 1:cld(10, n)
        @test tcollect(Cat(), Iterators.partition(1:10, n); basesize = basesize) == 1:10
    end
end

@testset "TCat" begin
    oneto(x) = 1:x
    @testset "Map(oneto) ⨟ TCat(1)" begin
        xf = opcompose(Map(oneto), TCat(1))
        desired = [1, 1, 2, 1, 2, 3]
        @test collect(xf, 1:3) ==ₜ desired
        @test collect(xf, 0:3) ==ₜ desired
        @test tcollect(xf, 1:3) ==ₜ desired
        @test tcollect(xf, 0:3) ==ₜ desired
    end
    @testset "Map(oneto) ⨟ TCat(1) ⨟ Map(oneto) ⨟ TCat(1)" begin
        noop(u, x) = x, u
        xf = opcompose(Map(oneto), TCat(1), Map(oneto), TCat(1))
        desired = [1, 1, 1, 2, 1, 1, 2, 1, 2, 3]
        @test collect(xf, 1:3) ==ₜ desired
        @test collect(xf, 0:3) ==ₜ desired
        @test tcollect(xf, 1:3) ==ₜ desired
        @test tcollect(xf, 0:3) ==ₜ desired
    end
    @testset "Scan(+) ⨟ Map(oneto) ⨟ TCat(1)" begin
        xf = opcompose(Scan(+), Map(oneto), TCat(1))
        desired = [1, 1, 2, 3, 1, 2, 3, 4, 5, 6]
        @test foldl(vcat, xf, 1:3; init=Union{}[]) == desired
        @test foldl(vcat, xf, 0:3; init=Union{}[]) == desired
        @test collect(xf, 1:3) == desired
        @test collect(xf, 0:3) == desired
    end
end

@testset "TakeWhile" begin
    coll = 1:10
    @testset for basesize in 1:(length(coll)+1)
        @test tcollect(TakeWhile(x -> x < 5), coll; basesize = basesize) == 1:4
    end
end

@testset "`reduced(...)` in reducing function" begin
    # Not sure if using `reduced` inside a reducing function is the
    # right style, but it was in the tutorial in v0.4.x series so
    # let's keep testing it.

    @test reduce(
        Map(x -> x % 3 == 0 ? x : nothing),
        1:10;
        init = nothing,
        basesize = 1,
    ) do a, b
        c = something(a, b, Some(nothing))
        c === nothing ? nothing : reduced(c)
    end == 3

    @test reduce(
        Map(x -> x % 3 == 0 ? x : nothing),
        1:10;
        init = nothing,
        basesize = 1,
    ) do a, b
        c = something(a, b, Some(nothing))
        c == 3 && sleep(0.1)  # give other tasks a chance to finish first
        c === nothing ? nothing : reduced(c)
    end == 3
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

    xf3 = ReduceIf(x -> x == 100)
    @test reduce(right, xf3, withprogress(1:1000; interval=0); basesize=1) == 100
    @test reduce(right, xf3, withprogress(1:1000; interval=0); basesize=1, simd=true) == 100
end

end  # module
