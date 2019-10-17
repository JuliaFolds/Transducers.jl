module TestDistributedReduce

include("preamble.jl")
using BangBang
using Distributed

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

end  # module
