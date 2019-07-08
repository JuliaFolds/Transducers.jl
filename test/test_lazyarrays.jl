module TestLazyArrays

include("preamble.jl")
using LazyArrays: Vcat, Hcat

@testset "Vcat" begin
    @testset for xs in @expressions begin
            Vcat(1:5, 2:3)
            Vcat(zeros(1, 2), ones(2, 2))
        end
        xs = @eval $xs
        @test collect(Map(identity), xs) == collect(xs)[:]
    end

end

@testset "Hcat" begin
    @testset for xs in @expressions begin
            Hcat(1:2, 3:4)
            Hcat(zeros(2, 1), ones(2, 2))
        end
        xs = @eval $xs
        @test collect(Map(identity), xs) == collect(xs)[:]
    end

end

end  # module
