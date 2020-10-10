module TestFold

include("../preamble.jl")
using Distributed: @everywhere
using InitialValues: INIT
using Transducers: foldx_base

const add = let fname = gensym(:add)
    @everywhere $fname(a, b) = a + b
    getproperty(Main, fname)
end
const parseint = Base.Fix1(parse, Int)

@testset "$fold" for fold in [
    foldl,
    simple_reduce,
    random_reduce,
    foldxt_bs1,
    foldxd_bs1,
    foldxl,
    foldxt,
    foldxd,
    foldx_base,
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
    if fold ∉ (simple_reduce, random_reduce, foldxd_bs1, foldxd)
        @testset "NoAdjoint" begin
            @test fold(
                +,
                Map(identity),
                Transducers.NoAdjoint(x for x in 1:10 if isodd(x)),
            ) == sum(1:2:10)
        end
    end
end

@testset "$fold" for fold in [
    foldl,
    simple_reduce,
    random_reduce,
    foldxt_bs1,
    foldxl,
    foldxt,
    foldx_base,
]
    # TODO: test them with `foldxd` (don't use local functions)
    @testset "AdHocRF" begin
        averaging =
            function add_average((sum, count), x)
                (sum + x, count + 1)
            end |>
            wheninit() do
                (Init(+), 0)
            end |>
            whencombine() do (sum1, count1), (sum2, count2)
                (sum1 + sum2), (count1 + count2)
            end |>
            whencomplete() do (sum, count)
                sum / count
            end
        @test fold(averaging, Filter(isodd), 1:5) === 3.0
        @test fold(averaging, Filter(isodd), 1:50) === 25.0

        averaging2 =
            function merge_average((sum1, count1), (sum2, count2))
                (sum1 + sum2, count1 + count2)
            end |>
            whencomplete() do (sum, count)
                sum / count
            end |>
            Map() do x
                (x, 1)
            end'
        @test fold(averaging2, Filter(isodd), 1:5) === 3.0
        @test fold(averaging2, Filter(isodd), 1:50) === 25.0
    end

    # TODO: make them work with `foldxd`
    @testset "dict" begin
        dict = Dict(zip("1234", 1:4))
        @test fold(+, Map(last), dict) == 10
        @test fold(add, Map(last), dict) == 10
        @test fold(+, Map(parseint ∘ first), dict) == 10
        @test fold(add, Map(parseint ∘ first), dict) == 10
    end
end

# TODO: make them work with `foldxd`
@testset "$fold" for fold in [foldxt_bs1, foldxt, foldx_base]
    @testset "eduction" begin
        @test fold(+, eduction(x for x in 1:10 if isodd(x))) == 25
        @test fold(+, Map(identity), eduction(x for x in 1:10 if isodd(x))) == 25
        @test fold(right, eduction(x for x in 1:10 if isodd(x))) == 9
        @test fold(right, Map(identity), eduction(x for x in 1:10 if isodd(x))) == 9
    end
end

@testset "$fold" for fold in [foldxl, foldxt, foldxd, foldx_base]
    foldxl = foldl = nothing  # don't use
    @test fold(TeeRF(min, max), [5, 2, 6, 8, 3]) === (2, 8)
    @test [5, 2, 6, 8, 3] |> fold(TeeRF(min, max)) === (2, 8)
    @test 1:5 |> Filter(isodd) |> fold(+) == 9
end

end  # module
