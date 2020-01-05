module BenchWords
using BenchmarkTools
include("../../examples/words.jl")

suite = BenchmarkGroup()

function makewords(n)
    genpos() = 2 ^ rand(0:5) + rand(0:10)
    io = IOBuffer()
    for _ in 1:n
        for _ in 1:genpos()
            write(io, ' ')
        end
        write(io, String(rand('a':'z', genpos())))
    end
    return String(take!(io))
end

str = makewords(2^14)

for n in [1, 2, 4]
    b = length(str) ÷ n
    suite["nthreads=$n"] = @benchmarkable countwords($str; basesize=$b)
end

end  # module
BenchWords.suite
