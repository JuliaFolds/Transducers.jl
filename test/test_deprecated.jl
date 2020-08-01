module TestDeprecated

using Test
using Transducers

@testset "|>" begin
    @test_deprecated Map(identity) |> Map(identity)
end

@testset "reduce" begin
    @test_deprecated reduce(+, Map(identity), 1:3)
    @test_deprecated reduce(+, 1:3 |> Map(identity))
end

@testset "dreduce" begin
    @test_deprecated dreduce(+, Map(identity), 1:3)
    @test_deprecated dreduce(+, 1:3 |> Map(identity))
end

end  # module
