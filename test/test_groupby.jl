module TestGroupBy
include("preamble.jl")

@testset begin
    @test foldl(right, GroupBy(string, Map(last), push!!), [1, 2, 1, 2, 3]) ==
          Dict("1" => [1, 1], "2" => [2, 2], "3" => [3])

    @test foldl(
        right,
        GroupBy(identity, Map(last) |> Scan(+), (_, x) -> x > 3 ? reduced(x) : x, nothing),
        [1, 2, 1, 2, 3],
    ) == Dict(2 => 4, 1 => 2)
end

@testset "automatic asmonoid" begin
    @test foldl(right, GroupBy(identity, Map(first), (a, b) -> a + b), [1, 2, 1, 2, 3]) ==
          Dict(1 => 2, 2 => 4, 3 => 3)

    @test foldl(right, GroupBy(identity, (_, x) -> x), [1, 2, 1, 2, 3]) ==
          Dict(1 => 1 => 1, 2 => 2 => 2, 3 => 3 => 3)
end

end  # module
