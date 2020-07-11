module TestFold

include("../preamble.jl")
using Distributed: @everywhere
using InitialValues: INIT

const add = let fname = gensym(:add)
    @everywhere $fname(a, b) = a + b
    getproperty(Main, fname)
end
const parseint = Base.Fix1(parse, Int)

@testset "$fold" for fold in [
    foldl,
    simple_reduce,
    random_reduce,
    reduce_bs1,
    reduce,
    dreduce_bs1,
    dreduce,
]
    @testset "no init" begin
        @test fold(+, Map(identity), 1:4) == 10
        @test fold(add, Map(identity), 1:4) == 10
        @test fold(+, Map(parseint), "1234") == 10
        @test fold(add, Map(parseint), "1234") == 10
    end
    @testset "INIT" begin
        @test fold(add, Map(identity), 1:4; init = INIT) == 10
        @test fold(add, Map(parseint), "1234"; init = INIT) == 10
    end
    @testset "IdentityTransducer" begin
        @test fold(+, IdentityTransducer(), 1:10) == sum(1:10)
    end
    @testset "GroupBy" begin
        @test fold(right, GroupBy(isodd, Map(last), +), 1:10) ==
              Dict(true => 25, false => 30)
    end
    if fold ∉ (simple_reduce, random_reduce, dreduce_bs1, dreduce)
        @testset "NoAdjoint" begin
            @test fold(
                +,
                Map(identity),
                Transducers.NoAdjoint(x for x in 1:10 if isodd(x)),
            ) == sum(1:2:10)
        end
    end
end

# TODO: make them work with `dreduce`
@testset "$fold" for fold in [foldl, simple_reduce, random_reduce, reduce_bs1, reduce]
    @testset "dict" begin
        dict = Dict(zip("1234", 1:4))
        @test fold(+, Map(last), dict) == 10
        @test fold(add, Map(last), dict) == 10
        @test fold(+, Map(parseint ∘ first), dict) == 10
        @test fold(add, Map(parseint ∘ first), dict) == 10
    end
end

# TODO: make them work with `dreduce`
@testset "$fold" for fold in [reduce_bs1, reduce]
    @testset "eduction" begin
        @test fold(+, eduction(x for x in 1:10 if isodd(x))) == 25
        @test fold(+, Map(identity), eduction(x for x in 1:10 if isodd(x))) == 25
        # These require `right` to be a proper monoid:
        @test_skip fold(right, eduction(x for x in 1:10 if isodd(x))) == 9
        @test_skip fold(right, Map(identity), eduction(x for x in 1:10 if isodd(x))) == 9
    end
end

end  # module
