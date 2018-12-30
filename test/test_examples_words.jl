module TestExamplesWords
include("preamble.jl")

include("../examples/loader.jl")
using .TransducersExamplesLoaders: @exload
@exload("words")

N_SAMPLES = 100
# N_SAMPLES = 1  # for debug

seed = rand(UInt)
Random.seed!(seed)
@info "Using: Random.seed!($seed)"

genpos(rng) = 2 ^ rand(rng, 0:5) + rand(rng, 0:10)

function randomjoin(rng, words)
    writespace(io) =
        for _ in 1:genpos(rng)
            write(io, ' ')
        end
    io = IOBuffer()
    if rand(rng, Bool)
        writespace(io)
    end
    write(io, words[1])
    for w in @view words[2:end]
        writespace(io)
        write(io, w)
    end
    if rand(rng, Bool)
        writespace(io)
    end
    return String(take!(io))
end

function gensample(seed)
    rng = MersenneTwister(seed)
    words = [join(rand(rng, 'a':'z', genpos(rng))) for _ in 1:genpos(rng)]
    return randomjoin(rng, words), words
end

# ../examples/words/01_steele09.jl
@testset "collectwords" begin
    @testset for seed in [rand(UInt) for _ in 1:N_SAMPLES]
        (str, words) = gensample(seed)
        @test collectwords(str) == words
    end
end

# ../examples/words/03_as_transducers.jl
@testset "wordsxf" begin
    @testset for seed in [rand(UInt) for _ in 1:N_SAMPLES]
        (str, words) = gensample(seed)
        @test sort(collect(wordsxf, str)) == sort(words)
    end
end

function gencountsample(seed)
    rng = MersenneTwister(seed)
    counts = Dict{String,Int}()
    words = String[]
    for _ in 1:genpos(rng)
        w = join(rand(rng, 'a':'z', genpos(rng)))
        c = genpos(rng)
        for _ in 1:c
            push!(words, w)
        end
        counts[w] = c + get(counts, w, 0)
    end
    shuffle!(rng, words)
    return randomjoin(rng, words), counts
end

# ../examples/words/05_counter.jl
@testset "countxf" begin
    @testset "$(p.label)" for p in [
            [(str = str,
              counts = counts,
              label = "str = $(repr(str))")
             for (str, counts) in [
                 ("", Dict()),
                 ("JustOneWord", Dict("JustOneWord" => 1)),
                 ("a b", Dict("a" => 1, "b" => 1)),
                 (" a b a ", Dict("a" => 2, "b" => 1)),
             ]
            ];
            [let seed = rand(UInt)
                 (label = "seed = $seed",
                  seed = seed)
             end
             for _ in 1:N_SAMPLES]
            ]
        if haskey(p, :seed)
            str, counts = gencountsample(p.seed)
        else
            str = p.str
            counts = p.counts
        end

        @testset for nthreads in [1, 2, 4, 8]
            actual = countwords(str; nthreads=nthreads)
            @test actual == counts
        end
    end
end

end  # module
