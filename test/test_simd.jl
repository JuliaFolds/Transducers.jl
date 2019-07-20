module TestSIMD
include("preamble.jl")

using Transducers: @simd_if, UseSIMD, usesimd, Reduction, skipcomplete, R_

function simd_if_demo(xf, ys, xs)
    @inbounds @simd_if xf for i in eachindex(ys, xs)
        ys[i] = 2 .* xs[i]
    end
    return ys
end

@testset "@simd_if" begin
    xs = [1:100;] .* 1.0
    @test simd_if_demo(Map(identity), zero(xs), xs) == 2xs
    @test simd_if_demo(UseSIMD{false}(), zero(xs), xs) == 2xs
    @test simd_if_demo(UseSIMD{true}(), zero(xs), xs) == 2xs
end

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
    @testset for simd in [false, true, :ivdep]
        xs = [1:100;]
        ys = zeros(100)
        foreach(Zip(Count(), Map(x -> x + 1.0)), xs; simd=simd) do (i, x)
            @inbounds ys[i] = x
        end
        @test ys == xs .+ 1.0
    end
end

end  # module
