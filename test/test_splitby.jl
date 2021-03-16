module TestSplitBy
include("preamble.jl")
using Transducers: ReduceSplitBy, Bulk, End

function just_bulk(x)
    if x isa Bulk
        Some(x[])
    else
        x::End
        nothing
    end
end

@testset "ReduceSplitBy" begin
    @test 1:5 |> ReduceSplitBy(iseven, Map(getindex)'(string), "_") |> collect ==
          ["_12", "_34", "_5"]
    @test 1:5 |> ReduceSplitBy(isodd, Map(getindex)'(string), "_") |> collect ==
          ["_1", "_23", "_45"]
    @test 1:5 |> ReduceSplitBy(iseven, KeepSomething(just_bulk)'(string), "_") |> collect ==
          ["_1", "_3", "_5"]
    @test 1:5 |> ReduceSplitBy(isodd, KeepSomething(just_bulk)'(string), "_") |> collect ==
          ["_", "_2", "_4"]
end

@testset for ex in [
    SequentialEx(),
    PreferParallel(basesize = 1),
    PreferParallel(basesize = 2),
    PreferParallel(basesize = 3),
    PreferParallel(),
]
    @test 1:5 |> ReduceSplitBy(iseven, Map(getindex)'(string), "") |> fcollect(ex) ==
          ["12", "34", "5"]
    @test 1:5 |> ReduceSplitBy(isodd, Map(getindex)'(string), "") |> fcollect(ex) ==
          ["1", "23", "45"]
    @test 1:5 |> ReduceSplitBy(iseven, KeepSomething(just_bulk)'(string), "") |> fcollect(ex) ==
          ["1", "3", "5"]
    @test 1:5 |> ReduceSplitBy(isodd, KeepSomething(just_bulk)'(string), "") |> fcollect(ex) ==
          ["", "2", "4"]

    @test 1:5 |> SplitBy(==(4)) |> fcollect(ex) == [1:3, 5:5]
    @test 1:5 |> SplitBy(==(5)) |> fcollect(ex) == [1:4]
    @test 1:5 |> SplitBy(==(4); keepend = true) |> fcollect(ex) == [1:4, 5:5]
    @test 1:5 |> SplitBy(==(5); keepend = true) |> fcollect(ex) == [1:5]
    @test 1:5 |> SplitBy(==(4); keepempty = true) |> fcollect(ex) == [1:3, 5:5]
    @test 1:5 |> SplitBy(==(5); keepempty = true) |> fcollect(ex) == [1:4]

    @test 1:5 |> SplitBy(>=(4)) |> fcollect(ex) == [1:3]
    @test 1:5 |> SplitBy(>=(4); keepend = true) |> fcollect(ex) == [1:4, 5:5]
    @test 1:5 |> SplitBy(>=(4); keepempty = true) |> fcollect(ex) == [1:3, 5:4]

    @test 1:5 |> SplitBy(isodd) |> fcollect(ex) == [2:2, 4:4]
    @test 1:5 |> SplitBy(isodd; keepend = true) |> fcollect(ex) == [1:1, 2:3, 4:5]
    @test 1:5 |> SplitBy(isodd; keepempty = true) |> fcollect(ex) == [1:0, 2:2, 4:4]

    @test 1:4 |> SplitBy(iseven) |> fcollect(ex) == [1:1, 3:3]
    @test 1:4 |> SplitBy(iseven; keepend = true) |> fcollect(ex) == [1:2, 3:4]
    @test 1:4 |> SplitBy(iseven; keepempty = true) |> fcollect(ex) == [1:1, 3:3]

    @test "1 2  3" |> SplitBy(==(' ')) |> fcollect(ex) == ["1", "2", "3"]
    @test "1 α 3" |> SplitBy(==(' ')) |> fcollect(ex) == ["1", "α", "3"]
end

end  # module
