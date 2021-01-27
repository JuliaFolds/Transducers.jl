module TestOutputSize

include("preamble.jl")
using Base: HasLength, HasShape, IteratorSize, SizeUnknown
using Transducers: OutputSize, SizeStable, SizeChanging

@testset "SizeStable" begin
    @testset for xf in [
        Map(sin),
        MapSplat(*),
        Replace((a = 1,)),
        FlagFirst(),
        Iterated(identity, nothing),
        Count(),
        GetIndex(1:3),
        SetIndex([]),
        Enumerate(),
        Broadcasting(),
        opcompose(MapSplat(*), Map(sin)),
        opcompose(MapSplat(*), Map(sin), FlagFirst()),
    ]
        @test OutputSize(typeof(xf)) isa SizeStable

        @testset for xs in [1:3, reshape(1:6, 2, 3), 1]
            @test IteratorSize(xs |> xf) isa HasShape
            @test size(xs |> xf) == size(xs)
            @test length(xs |> xf) == length(xs)
        end

        @testset for xs in [(1, 2), (a = 1, b = 2)]
            @test IteratorSize(xs |> xf) isa HasLength
            @test length(xs |> xf) == length(xs)
            @test_error size(xs |> xf)
        end

        @testset """eachline(IOBuffer("a"))""" begin
            xs = eachline(IOBuffer("a"))
            @test IteratorSize(xs |> xf) isa SizeUnknown
            @test_error size(xs |> xf)
            @test_error length(xs |> xf)
        end
    end
end

@testset "SizeChanging" begin
    @testset for xf in [
        Cat(),
        opcompose(Cat(), MapSplat(*)),
        opcompose(Cat(), MapSplat(*), Map(sin)),
    ]
        @test OutputSize(typeof(xf)) isa SizeChanging

        @testset for xs in [
            1:3,
            reshape(1:6, 2, 3),
            1,
            (1, 2),
            (a = 1, b = 2),
            eachline(IOBuffer("a")),
        ]
            @test IteratorSize(xs |> xf) isa SizeUnknown
            @test_error size(xs |> xf)
            @test_error length(xs |> xf)
        end
    end
end

end  # module
