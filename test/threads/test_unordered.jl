module TestUnordered
include("../preamble.jl")
using Transducers: append_unordered!, channel_unordered, reduce_commutative

@testset "reduce_commutative" begin
    @testset "Map(inc)(+)" begin
        @test reduce_commutative(+, Map(inc), 1:100) == sum((1:100) .+ 1)
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

@testset "append_unordered!(output, (x + 1 for x in input))" begin
    input = Channel(Map(identity), 1:100)
    output = Channel{Int}(Inf)
    append_unordered!(output, (x + 1 for x in input))
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
    @testset "x + 1 for x in input" begin
        input = Channel(Map(identity), 1:100)
        ys = sort!(collect(channel_unordered(x + 1 for x in input)))
        @test ys == (1:100) .+ 1
    end
    @testset "eduction(x + 1 for x in input)" begin
        input = Channel(Map(identity), 1:100)
        ys = sort!(collect(channel_unordered(eduction(x + 1 for x in input))))
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
    @testset "error handling (no dangling tasks)" begin
        input_length = 100
        input = Channel(Map(identity), 1:input_length)
        trace = Channel(input_length)
        ntasks = 10
        block = Channel{Nothing}(1)
        xs = input |> Map() do x
            put!(trace, x)
            wait(block)
            x
        end |> Map() do x
            error("Throwing error with x = $x")
        end
        bg = @async begin
            traced = Int[]
            for _ in 1:ntasks
                push!(traced, popfirst!(trace))
            end
            # Now all tasks completed `put!(trace, x)`.
            put!(block, nothing)
            for x in trace
                push!(traced, x)
            end
            traced
        end
        @test_throws Exception take!(channel_unordered(xs; ntasks=ntasks))
        close(trace)
        consumed = sort!(fetch(bg))
        @test consumed == 1:ntasks
    end
    @testset "error handling (terminate other tasks)" begin
        input_length = 100
        input = Channel(Map(identity), 1:input_length)
        trace = Channel(input_length)
        ntasks = 10
        block = Channel{Nothing}(1)
        xs = input |> Map() do x
            put!(trace, x)
            wait(block)
            x
        end |> Map() do x
            if x == 1
                error("Throwing error with x = $x")
            end
            sleep(0.01)
            x
        end
        bg = @async begin
            traced = Int[]
            for _ in 1:ntasks
                push!(traced, popfirst!(trace))
            end
            # Now all tasks completed `put!(trace, x)`.
            put!(block, nothing)
            for x in trace
                push!(traced, x)
            end
            traced
        end
        @test_throws Exception collect(channel_unordered(xs; ntasks=ntasks))
        close(trace)
        consumed = sort!(fetch(bg))
        @test length(consumed) >= ntasks
        @test length(consumed) < input_length
    end
end

end  # module
