module TestCore
include("preamble.jl")
using Transducers: has

@testset "has" begin
    @test has(Count(), Count)
    @test has(Map(identity) |> Count(), Count)
    @test has(Count() |> Map(identity), Count)
end

@testset "Initializer" begin
    @testset "Scan" begin
        @testset for xs in iterator_variants(1:10)
            @test_broken_if(
                (xs isa Base.Generator),
                collect(Scan(+, Initializer(T -> 5one(T))), xs) ==
                    cumsum(vcat(5, collect(xs)))[2:end])
        end
    end
    @testset "ScanEmit" begin
        @testset for xs in iterator_variants(1:10)
            @test_broken_if(
                (xs isa Base.Generator),
                collect(ScanEmit((u, x) -> (u + x, u + x),
                                 Initializer(T -> 5one(T))) |> Map(first),
                        xs) ==
                    cumsum(vcat(5, collect(xs)))[2:end])
        end
    end
    @testset "Iterated" begin
        @testset for xs in iterator_variants(1:10)
            @test_broken_if(
                (xs isa Base.Generator),
                collect(Iterated(inc, Initializer(T -> 5one(T))) |> Map(first),
                        xs) ==
                    (1:10) .+ (5 - 1))
        end
    end
end

end  # module
