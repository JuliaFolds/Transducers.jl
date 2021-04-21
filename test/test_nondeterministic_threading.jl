module TestNondeterministicThreading

include("preamble.jl")

function slow_identity(x)
    sleep(x)
    return x
end

throw_if_nothing(x) = x === nothing ? error("GOT NOTHING!") : x

@testset "happy path" begin
    @testset for seed in 1:100
        rng = MersenneTwister(seed)
        ntasks = rand(rng, 2:32)
        len = rand(rng, (1:10) .* ntasks)
        xs = 1e-3 .+ rand(rng, Float64, len) .* 9e-3
        ys =
            xs |>
            NondeterministicThreading(basesize = 1, ntasks = ntasks) |>
            Map(slow_identity)
        @test collect(ys) == xs
    end
end

@testset "Reduced" begin
    y =
        1:100 |>
        NondeterministicThreading(basesize = 1, ntasks = 10) |>
        Map() do i
            sleep(i * 1e-6)
            return i
        end |>
        ReduceIf() do i
            i == 1
        end |>
        foldxl(right)
    @test y == 1
end

@testset "error" begin
    @testset for seed in 1:100
        rng = MersenneTwister(seed)
        ntasks = rand(rng, 2:32)
        len = rand(rng, (1:10) .* ntasks)
        xs = 1e-3 .+ rand(rng, Float64, len) .* 9e-3
        xs = collect(Union{Float64,Nothing}, xs)
        xs[rand(rng, 1:len)] = nothing
        ys =
            xs |>
            NondeterministicThreading(basesize = 1, ntasks = ntasks) |>
            Map(throw_if_nothing) |>
            Map(slow_identity)
        err = @test_error collect(ys)
        @test occursin("GOT NOTHING!", sprint(showerror, err))
    end
end

end  # module
