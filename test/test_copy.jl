module TestCopy

using Test
using Transducers

@testset "copy [base types]" begin
    @test copy(Map(x -> x^2), Vector, 1:3) == (1:3) .^ 2
    @test copy(Map(x -> x^2), [1:3;]) == (1:3) .^ 2
    @test copy(Map(x -> x^2), Set, 1:3) == Set((1:3) .^ 2)
    @test copy(Map(x -> x => x^2), Dict, 2:2) == Dict(2 => 4)
end

@testset "Set" begin
    @test Set(eduction(y for x in 1:1000 for y in 1:x)) == Set(1:1000)
end

@testset "Dict" begin
    @test Dict(eduction(x => y for x in 1:1000 for y in 1:x)) == Dict(1:1000 .=> 1:1000)
end

end  # module
