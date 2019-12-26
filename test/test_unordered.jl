module TestUnordered
include("preamble.jl")
using Transducers: append_unordered!, channel_unordered, transduce_commutative

@testset "transduce_commutative" begin
    @testset "Map(inc)(+)" begin
        input = Channel(Map(identity), 1:100)
        @test transduce_commutative(Map(inc), +, 0, input) == sum((1:100) .+ 1)
    end
end

@testset "append_unordered!" begin
    input = Channel(Map(identity), 1:100)
    output = Channel{Int}(Inf)
    append_unordered!(output, Map(inc), input)
    close(output)
    ys = sort!(collect(output))
    @test ys == (1:100) .+ 1
end

@testset "channel_unordered" begin
    @testset "Map(inc)" begin
        input = Channel(Map(identity), 1:100)
        ys = sort!(collect(channel_unordered(Map(inc), input)))
        @test ys == (1:100) .+ 1
    end
    @testset "ReduceIf(isodd): early termination" begin
        input_data = fill(2, 100)
        input_data[10] = 1
        input = Channel(Map(identity), input_data)
        ys = collect(channel_unordered(ReduceIf(isodd), input))
        @test count(x -> x == 1, ys) == 1
        @test sort!(unique(ys)) == [1, 2]
        @test length(ys) < length(input_data)
    end
end

end  # module
