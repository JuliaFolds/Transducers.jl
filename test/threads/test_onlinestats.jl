module TestOnlineStats

include("../preamble.jl")

using Distributed: @everywhere
@everywhere import OnlineStats

using OnlineStats: Mean, fit!, value
using Transducers: OSNonZeroNObsError

const parseint = Base.Fix1(parse, Int)
const square = Base.Fix2(^, 2)
const lessthan5 = Base.Fix2(<, 5)

@testset "$_fold" for _fold in [foldl, foldxt, foldxd]
    if _fold === foldl
        fold = _fold
    else
        fold(args...; kw...) = _fold(args...; basesize = 1, kw...)
    end
    @testset begin
        @test value(fold(Mean(), Map(identity), 1:9)) == 5
        @test value(fold(Mean(), Map(parseint), "123456789")) == 5
        @test value(fold(Mean(), Map(square), 1:11)) ≈ 46
        @test value(fold(Mean(), Filter(lessthan5), 1:9)) == 2.5
    end
end

@testset "non-zero `nobs`" begin
    m = Mean()
    fit!(m, 1)
    @testset "$fold" for fold in [foldxt, foldxd]
        @test_throws OSNonZeroNObsError fold(m, Map(identity), 2:9)
    end
    @testset "foldl" begin
        @test value(foldl(m, Map(identity), 2:9)) == 5
    end
end

end  # module
