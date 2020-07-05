module TestExamplesTutorialMissings
include("../examples/tutorial_missings.jl")
include("preamble.jl")

slow_xf_fullextrema =
    opcompose(Zip(Count(), NotA(Missing)), Zip(xf_scanext(>), xf_scanext(<)))

slow_xf_argextrema = opcompose(slow_xf_fullextrema, Map() do ((argmin, min), (argmax, max))
    (argmin, argmax)
end)

@testset "slow compilation" begin
    @test mapfoldl(slow_xf_fullextrema, right, [1.0, 3.0, -1.0, missing, 2.0]) ===
        ((3, -1.0), (2, 3.0))

    @test mapfoldl(slow_xf_argextrema, right, [1.0, 3.0, -1.0, missing, 2.0]) ===
        (3, 2)

    # Excluding `missing` from the input vector seems to slow down
    # compilation a lot.
    slow_test("slow compilation test with xf_fullextrema", 20) do
        @test mapfoldl(slow_xf_fullextrema, right, [1.0, 3.0, -1.0, 2.0]) ==
            ((3, -1.0), (2, 3.0))
    end
    slow_test("slow compilation test with xf_argextrema", 20) do
        @test mapfoldl(slow_xf_argextrema, right, [1.0, 3.0, -1.0, 2.0]) ==
            (3, 2)
    end
end

end  # module
