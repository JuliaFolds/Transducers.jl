module TestCore
include("preamble.jl")
using Transducers: has, reform

@testset "has" begin
    @test has(Count(), Count)
    @test has(Map(identity) |> Count(), Count)
    @test has(Count() |> Map(identity), Count)
end

@testset "reform" begin
    f = Completing(Transducers.push!!)  # bottom reducing function for eduction
    @testset for xf in [
            Count(),
            Map(identity) |> Count(),
            TeeZip(Map(identity) |> Count()),
            ]
        rf = eduction(xf, 1:1).rf
        @test rf === reform(rf, f)
        @test rf !== reform(rf, +)
    end
end

@testset "OnInit" begin
    @testset "mapfoldl" begin
        @testset for xs in iterator_variants(1:3)
            @test mapfoldl(
                Zip(Map(identity), Map(string)),
                push!,
                xs,
                init = OnInit(() -> [])
            ) == [(1, "1"), (2, "2"), (3, "3")]
        end
    end
end

end  # module
