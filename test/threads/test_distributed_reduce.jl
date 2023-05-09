module TestDistributedReduce

include("../preamble.jl")
using BangBang
using Distributed
using Logging: LogLevel
using StructArrays: StructVector
using Test: collect_test_logs

const ProgressLevel = LogLevel(-1)

@testset "foldxd" begin
    fname = gensym(:attach_pid)
    @everywhere $fname(x) = [(x, getpid())]
    fun = getproperty(Main, fname)

    pids = fetch.(map(id -> remotecall(getpid, id), workers()))
    xs0 = 1:10
    @testset "foldxd(..., $xslabel; $kwargs...)" for (xslabel, xs) in Any[
            # Input containers:
            ("$xs0", xs0),
            ("withprogress(xs; interval=0)", withprogress(xs0; interval = 0)),
        ],
        kwargs in Any[
            # Keyword arguments to `foldxd`:
            (),
            (basesize = 1,),
            (basesize = 1, threads_basesize = 1),
            (basesize = 4, threads_basesize = 2),
            (basesize = 4, threads_basesize = 2, simd = true),
        ]

        ys = foldxd(append!!, Map(fun), xs; init = Union{}[], kwargs...)
        @test first.(ys) == xs0
        @test Set(last.(ys)) == Set(pids)
    end
    # https://github.com/JuliaFolds/Transducers.jl/issues/552
    @test foldxd(+, Transducers.Map(sum), Iterators.product(1:10, 1:10)) == 1100
end

@testset "retransform" begin
    square = Base.Fix2(^, 2)
    @test foldxd(+, Map(identity), 1:9 |> Map(square)) == 285
    @test dtransduce(Map(identity), +, 0, 1:9 |> Map(square)) == 285
    @test foldxd(+, Map(square), Iterators.filter(isodd, 1:9)) == 165
    @test foldxd(+, Map(identity), Iterators.filter(isodd, 1:9) |> Map(square)) == 165
    @test dtransduce(Map(square), +, 0, Iterators.filter(isodd, 1:9)) == 165
    @test dtransduce(Map(identity), +, 0, Iterators.filter(isodd, 1:9) |> Map(square)) ==
          165
end

@testset "dcollect & dcopy" begin
    @test dcollect(Filter(iseven), 1:10, basesize = 2) == 2:2:10

    fname = gensym(:makerow)
    @everywhere $fname(x) = (a = x,)
    makerow = getproperty(Main, fname)
    @everywhere import StructArrays
    @test dcopy(Map(makerow), StructVector, 1:3, basesize = 2) == StructVector(a = 1:3)
end

@testset "TakeWhile" begin
    fname = gensym(:lessthan5)
    @everywhere $fname(x) = x < 5
    lessthan5 = getproperty(Main, fname)

    coll = 1:10
    @testset for basesize in 1:(length(coll)+1)
        @test dcollect(TakeWhile(lessthan5), coll; basesize = basesize) == 1:4
    end
end

@testset "basesize > 0" begin
    @test dcollect(Map(identity), [1]) == [1]
end

@testset "empty input" begin
    @test isempty(dcollect(Map(identity), []))
end

@testset "withprogress" begin
    xs = 1:10
    @testset "foldxd(..., withprogress(xs; interval=0); $kwargs...)" for kwargs in Any[
        # Keyword arguments to `foldxd`:
        (),
        (basesize = 4, threads_basesize = typemax(Int)),
        (basesize = 4, threads_basesize = 2),
        (basesize = 4, threads_basesize = 2, simd = true),
    ]
        logs, ans = collect_test_logs(min_level = ProgressLevel) do
            foldxd(+, Map(identity), withprogress(xs; interval = 0.0); kwargs...)
        end
        logs = [l for l in logs if l.level == ProgressLevel]
        @test ans == sum(xs)
        @test length(logs) > 2
        @test logs[1].kwargs[:progress] === 0.0
        @test all(l.kwargs[:progress] isa Float64 for l in logs[2:end-1])
        @test logs[end].kwargs[:progress] === "done"
    end
end

end  # module
