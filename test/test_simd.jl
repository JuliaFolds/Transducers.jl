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

@testset "usesimd" begin
    xfsimd = UseSIMD{false}()
    @test usesimd(Map(identity), xfsimd) ===
        xfsimd |> Map(identity)
    @test usesimd(Cat(), xfsimd) ===
        Cat() |> xfsimd
    @test usesimd(Map(sin) |> Cat() |> Map(cos), xfsimd) ===
        Map(sin) |> Cat() |> xfsimd |> Map(cos)
    @test usesimd(Map(sin) |> Cat() |> Map(cos) |> Cat() |> Map(tan), xfsimd) ===
        Map(sin) |> Cat() |> Map(cos) |> Cat() |> xfsimd |> Map(tan)
end

@testset "skipcomplete" begin
    @testset for xf in [
            UseSIMD{false}(),
            usesimd(Map(identity), UseSIMD{false}()),
            usesimd(Map(sin) |> Map(cos), UseSIMD{false}()),
            ]
        rf = Reduction(xf, +, Float64)
        @test rf isa R_{UseSIMD}
        @test skipcomplete(rf) isa R_{UseSIMD}
    end
end

end  # module
