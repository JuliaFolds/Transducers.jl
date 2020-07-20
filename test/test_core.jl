module TestCore
include("preamble.jl")
using InitialValues: INIT
using Transducers: has, reform

@testset "Reduced" begin
    @testset "constructor" begin
        @test Reduced(1) isa Reduced{Int}
        @test Reduced(Reduced(1)) isa Reduced{Reduced{Int}}
    end
    @testset "=" begin
        x = [1]
        y = [2]
        @test Reduced(x) !== Reduced(copy(x))
        @test Reduced(x) == Reduced(copy(x))
        @test Reduced(x) != Reduced(y)
        @test Reduced(Reduced(x)) == Reduced(Reduced(copy(x)))
        @test Reduced(Reduced(x)) != Reduced(Reduced(y))
        @test Reduced(Reduced(x)) != Reduced(x)
        @test Reduced(x) != Reduced(Reduced(x))
    end
end

@testset "reduced" begin
    @test reduced(1) === Reduced(1)
    @test reduced(reduced(1)) === Reduced(1)
end

@testset "has" begin
    @test has(Count(), Count)
    @test has(opcompose(Map(identity), Count()), Count)
    @test has(opcompose(Count(), Map(identity)), Count)
end

@testset "reform" begin
    f = Completing(Transducers.push!!)  # bottom reducing function for eduction
    @testset for xf in [
            Count(),
            opcompose(Map(identity), Count()),
            ZipSource(opcompose(Map(identity), Count())),
            ]
        rf = eduction(xf, 1:1).rf
        @test rf === reform(rf, f)
        @test rf !== reform(rf, +)
    end
end

@testset "reducingfunction" begin
    @test reducingfunction(Map(identity), +) isa Function
    @testset "INIT" begin
        @test reducingfunction(Map(identity), +)(INIT, :anything) === :anything
        @test reducingfunction(Map(identity), +)(:anything, INIT) === :anything

        # Test that `INIT` interacts with the bottom reducing
        # function.  The second argument should still be processed
        # with the transducer.  Note that, unlike `Map(identity)`, the
        # arguments in reversed order does not work.
        @test reducingfunction(Map(string), +)(INIT, :anything) === "anything"
    end
end

@testset "OnInit" begin
    @testset "foldl" begin
        @testset for xs in iterator_variants(1:3)
            @test foldl(
                push!,
                Zip(Map(identity), Map(string)),
                xs,
                init = OnInit(() -> [])
            ) == [(1, "1"), (2, "2"), (3, "3")]
        end
    end
end

@testset "broadcastable(::Transducer)" begin
    @test collect.(Enumerate(), ["abc", "def"]) ==
        [[(1, 'a'), (2, 'b'), (3, 'c')], [(1, 'd'), (2, 'e'), (3, 'f')]]
end

end  # module
