module TestSIMD
include("preamble.jl")

using Transducers: UseSIMD, usesimd, Reduction, skipcomplete, R_, @simd_if

asrf(xf) = Reduction(xf, right, Int)

@testset "usesimd" begin
    xfsimd = UseSIMD{false}()
    @test usesimd(asrf(Map(identity)), xfsimd) === asrf(xfsimd |> Map(identity))
    @test usesimd(asrf(Cat()), xfsimd) === asrf(Cat() |> xfsimd)
    @test usesimd(asrf(Map(sin) |> Cat() |> Map(cos)), xfsimd) ===
        asrf(Map(sin) |> Cat() |> xfsimd |> Map(cos))
    @test usesimd(asrf(Map(sin) |> Cat() |> Map(cos) |> Cat() |> Map(tan)),
                  xfsimd) ===
        asrf(Map(sin) |> Cat() |> Map(cos) |> Cat() |> xfsimd |> Map(tan))
end

@testset "skipcomplete" begin
    @testset for rf in [
            asrf(UseSIMD{false}()),
            usesimd(asrf(Map(identity)), UseSIMD{false}()),
            usesimd(asrf(Map(sin) |> Map(cos)), UseSIMD{false}()),
            ]
        @test rf isa R_{UseSIMD}
        @test skipcomplete(rf) isa R_{UseSIMD}
    end
end

@testset "foldl" begin
    @testset for simd in [false, true]
        xs = [1:100;]
        result = foldl(eduction(Map(identity), xs);
                       init = 0.0,
                       simd = simd) do y, x
            y + 2x
        end
        @test result == sum(2 .* xs)
    end
end

@testset "foreach" begin
    # TODO: simd=:ivdep support using Referenceables.jl
    @testset for simd in [false, true]
        xs = [1:100;]
        ys = zeros(100)
        foreach(Zip(Count(), Map(x -> x + 1.0)), xs; simd=simd) do (i, x)
            @inbounds ys[i] = x
        end
        @test ys == xs .+ 1.0
    end
end

@testset "UX" begin
    for err in [
        (@test_error mapfoldl(Map(identity), +, 1:2; simd=:ivdep)),
        (@test_error foldl(+, Map(identity), 1:2; simd=:ivdep)),
        (@test_error foldl(+, eduction(Map(identity), 1:2); simd=:ivdep)),
    ]
        @test occursin("`simd=:ivdep` must not be used",
                       sprint(showerror, err))
    end
end

@testset "@simd_if" begin
    err = @test_error @macroexpand @simd_if rf for i in 1:1
    end
    @test occursin("No call of the form `@next!(rf, acc, input)` is found.",
                   sprint(showerror, err))

    err = @test_error @macroexpand @simd_if rf for i in 1:1
        @next!(rf, acc, init)
        @next!(rf, acc, init)
    end
    @test occursin("Multiple `@next!(rf, acc, input)` statements found.",
                   sprint(showerror, err))
end

end  # module
