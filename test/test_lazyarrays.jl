module TestLazyArrays

include("preamble.jl")
using LazyArrays

@testset "Vcat" begin
    xs = Vcat(1:5, 2:3)
    @test foldl(+, Map(inc), xs) == foldl(+, Map(inc), collect(xs))
end

end  # module
