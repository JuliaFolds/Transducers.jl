module TestFold

include("../preamble.jl")
using Distributed: @everywhere

const add = let fname = gensym(:add)
    @everywhere $fname(a, b) = a + b
    getproperty(Main, fname)
end
const parseint = Base.Fix1(parse, Int)

@testset "$_fold" for _fold in [foldl, reduce, dreduce]
    if _fold === foldl
        fold = _fold
    else
        fold(args...; kw...) = _fold(args...; basesize = 1, kw...)
    end
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

# TODO: make them work with `dreduce`
@testset "$_fold" for _fold in [foldl, reduce]
    if _fold === foldl
        fold = _fold
    else
        fold(args...; kw...) = _fold(args...; basesize = 1, kw...)
    end
    @testset "dict" begin
        dict = Dict(zip("1234", 1:4))
        @test fold(+, Map(last), dict) == 10
        @test fold(add, Map(last), dict) == 10
        @test fold(+, Map(parseint ∘ first), dict) == 10
        @test fold(add, Map(parseint ∘ first), dict) == 10
    end
end

end  # module
