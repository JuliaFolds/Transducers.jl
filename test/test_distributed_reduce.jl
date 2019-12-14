module TestDistributedReduce

include("preamble.jl")
using BangBang
using Distributed
using StructArrays: StructVector

if get(ENV, "CI", "false") == "true"
    addprocs(3)
end
@info "Testing with:" nworkers()

@testset begin
    fname = gensym(:attach_pid)
    @everywhere $fname(x) = [(x, getpid())]
    fun = getproperty(Main, fname)

    pids = fetch.(map(id -> remotecall(getpid, id), workers()))
    xs = 1:10
    ys = dreduce(append!!, Map(fun), xs; init=Union{}[])
    @test first.(ys) == xs
    @test Set(last.(ys)) == Set(pids)

    ys = dreduce(append!!, Map(fun), withprogress(xs; interval=0); init=Union{}[])
    @test first.(ys) == xs
    @test Set(last.(ys)) == Set(pids)
end

@testset "dcollect & dcopy" begin
    @test dcollect(Filter(iseven), 1:10, basesize = 2) == 2:2:10

    fname = gensym(:makerow)
    @everywhere $fname(x) = (a = x,)
    makerow = getproperty(Main, fname)
    @everywhere import StructArrays
    @test dcopy(Map(makerow), StructVector, 1:3, basesize = 2) == StructVector(a = 1:3)
end

@testset "basesize > 0" begin
    @test dcollect(Map(identity), [1]) == [1]
end

@testset "empty input" begin
    @test isempty(dcollect(Map(identity), []))
end

end  # module
