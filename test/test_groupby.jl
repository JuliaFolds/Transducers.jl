module TestGroupBy
include("preamble.jl")
using Transducers: DefaultInit

@testset begin
    @test foldl(right, GroupBy(string, Map(last), push!!), [1, 2, 1, 2, 3]) ==
          Dict("1" => [1, 1], "2" => [2, 2], "3" => [3])

    @test foldl(
        right,
        GroupBy(
            identity,
            opcompose(Map(last), Scan(+)),
            (_, x) -> x > 3 ? reduced(x) : x,
            nothing,
        ),
        [1, 2, 1, 2, 3],
    ) == Dict(2 => 4, 1 => 2)
end

@testset "post-groupby filtering" begin
    d = foldl(right, GroupBy(isodd, opcompose(Map(last), Filter(isodd)), +), 1:10)
    @test d == Dict(true => 25)
    @test d.state == Dict(true => 25, false => DefaultInit(+))
    @test valtype(d) <: Int
    @test valtype(d.state) <: Union{Int,typeof(DefaultInit(+))}
end

@testset "automatic asmonoid" begin
    @test foldl(right, GroupBy(identity, Map(first), (a, b) -> a + b), [1, 2, 1, 2, 3]) ==
          Dict(1 => 2, 2 => 4, 3 => 3)

    @test foldl(right, GroupBy(identity, (_, x) -> x), [1, 2, 1, 2, 3]) ==
          Dict(1 => 1 => 1, 2 => 2 => 2, 3 => 3 => 3)
end

@testset "GroupByViewDict" begin
    gd1 = foldl(right, GroupBy(string, Map(last), push!!), [1, 2, 1, 2, 3])
    gd2 = foldl(right, GroupBy(x -> gcd(x, 6), Map(last) |> Filter(isodd), push!!), 1:10)
    gd3 = foldl(right, Filter(isodd) |> GroupBy(x -> gcd(x, 6), Map(last), push!!), 1:10)
    gd4 = foldl(
        right,
        GroupBy(x -> gcd(x, 6), Map(last) |> Unique(x -> gcd(x, 4)), push!!),
        1:10,
    )
    @test gd1 == Dict("1" => [1, 1], "2" => [2, 2], "3" => [3])
    @test gd2 == gd3
    @test gd4 == Dict(2 => [2, 4], 3 => [3], 6 => [6], 1 => [1])
    @test Dict(gd1) == Dict("1" => [1, 1], "2" => [2, 2], "3" => [3])
    @test Dict(gd2) == Dict(gd3)
    @test Dict(gd4) == Dict(2 => [2, 4], 3 => [3], 6 => [6], 1 => [1])
end

end  # module
