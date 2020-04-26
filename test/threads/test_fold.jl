module TestFold

include("../preamble.jl")
using Distributed: @everywhere

const add = let fname = gensym(:add)
    @everywhere $fname(a, b) = a + b
    getproperty(Main, fname)
end
const parseint = Base.Fix1(parse, Int)

@testset "$fold" for fold in [foldl, reduce, dreduce]
    @testset "no init" begin
        @test fold(+, Map(identity), 1:4) == 10
        @test fold(add, Map(identity), 1:4) == 10
        @test fold(+, Map(parseint), "1234") == 10
        @test fold(add, Map(parseint), "1234") == 10
    end
    @testset "IdentityTransducer" begin
        @test fold(+, IdentityTransducer(), 1:10) == sum(1:10)
    end
end

end  # module
