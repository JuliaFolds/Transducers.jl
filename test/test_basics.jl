module TestBasics

using Transducers: _unzip, arguments
include("preamble.jl")

@testset "_unzip" begin
    @test _unzip(((Val(0), Val(1), Val(2)), (Val(5), Val(6), Val(7)))) ===
          ((Val(0), Val(5)), (Val(1), Val(6)), (Val(2), Val(7)))

    @test _unzip((
        (Val(0), Val(1), Val(2), Val(3), Val(4)),
        (Val(5), Val(6), Val(7), Val(8), Val(9)),
    )) === (
        (Val(0), Val(5)),
        (Val(1), Val(6)),
        (Val(2), Val(7)),
        (Val(3), Val(8)),
        (Val(4), Val(9)),
    )

    @test _unzip((ntuple(identity, 3), ntuple(x -> 10x, 3), ntuple(x -> 100x, 3))) ===
          ((1, 10, 100), (2, 20, 200), (3, 30, 300))

    if VERSION >= v"1.1"
        @test_inferred _unzip(((Val(0), Val(1), Val(2)), (Val(5), Val(6), Val(7))))
        @test_inferred _unzip((ntuple(Val, 10), ntuple(x -> Val(x + 10), 10)))
    end
end

@testset "arguments(zip(...))" begin
    @testset for args in Any[
        (1:1,),
        (1:1, 2:2),
        (1:1, 2:2, 3:3),
        (1:1, 2:2, 3:3, 4:4),
        (1:1, 2:2, 3:3, 4:4, 5:5),
    ]
        @test arguments(zip(args...)) === args
    end
end

end  # module
