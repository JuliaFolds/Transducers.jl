module TestUnordered
include("preamble.jl")
using Transducers: append_unordered!, channel_unordered

@testset "append_unordered!" begin
    input = Channel(Map(identity), 1:100)
    output = Channel{Int}(Inf)
    append_unordered!(output, Map(inc), input)
    close(output)
    ys = sort!(collect(output))
    @test ys == (1:100) .+ 1
end

@testset "channel_unordered" begin
    input = Channel(Map(identity), 1:100)
    ys = sort!(collect(channel_unordered(Map(inc), input)))
    @test ys == (1:100) .+ 1
end

end  # module
