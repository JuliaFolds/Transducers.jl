module TestOldTutorialMissings
include("preamble.jl")

argext_step(should_update) =
    (old, (index, value)) ->
        if old === nothing || should_update(old[2], value)
            (index, value)
        else
            old
        end

xf_scanext(should_update) = Scan(argext_step(should_update), nothing)

slow_xf_fullextrema =
    opcompose(Zip(Count(), NotA(Missing)), Zip(xf_scanext(>), xf_scanext(<)))

slow_xf_argextrema = opcompose(slow_xf_fullextrema, Map() do ((argmin, min), (argmax, max))
    (argmin, argmax)
end)

@testset "slow compilation" begin
    @test foldl(right, slow_xf_fullextrema, [1.0, 3.0, -1.0, missing, 2.0]) ===
        ((3, -1.0), (2, 3.0))

    @test foldl(right, slow_xf_argextrema, [1.0, 3.0, -1.0, missing, 2.0]) ===
        (3, 2)

    # Excluding `missing` from the input vector seems to slow down
    # compilation a lot.
    slow_test("slow compilation test with xf_fullextrema", 20) do
        @test foldl(right, slow_xf_fullextrema, [1.0, 3.0, -1.0, 2.0]) ==
            ((3, -1.0), (2, 3.0))
    end
    slow_test("slow compilation test with xf_argextrema", 20) do
        @test foldl(right, slow_xf_argextrema, [1.0, 3.0, -1.0, 2.0]) ==
            (3, 2)
    end
end

end  # module
