module TestExecutors

include("preamble.jl")
import Distributed
using BangBang: SingletonVector, append!!, collector, finish!
using Transducers: wheninit

fcollect(itr, ex = PreferParallel()) =
    finish!(unreduced(transduce(
        Map(SingletonVector),
        wheninit(collector, append!!),
        collector(),
        itr,
        ex,
    )))

@testset "fcollect" begin
    @test fcollect(x for x in 1:10) == 1:10
    @test fcollect(x for x in Iterators.Stateful(1:10)) == 1:10
    ch = Channel(ch -> foreach(x -> put!(ch, x), 1:10))
    @test fcollect(x for x in ch) == 1:10
    #=
    @sync let ch = Distributed.RemoteChannel()
        try
            @async foreach(x -> put!(ch, x), 1:10)
            @test fcollect(x for x in ch) == 1:10
        finally
            close(ch)
        end
    end
    =#
end

end  # module
