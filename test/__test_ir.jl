include("preamble.jl")

using InteractiveUtils: code_llvm, code_warntype
using Statistics: mean

using Transducers: Reduction, start, __foldl__, __simple_foldl__, maybe_usesimd

"""
    llvm_ir(f, args) :: String

Get LLVM IR of `f(args...)` as a string.
"""
llvm_ir(f, args) = sprint(code_llvm, f, Base.typesof(args...))

"""
    julia_ir(f, args) :: String

Get Julia IR of `f(args...)` as a string.
"""
julia_ir(f, args) = sprint(code_warntype, f, Base.typesof(args...))

matchedlines(r, s) = [m.match for m in eachmatch(r, s)]
anyunions(s) = matchedlines(r".*UNION.*", s)
nmatches(r, s) = count(_ -> true, eachmatch(r, s))


@testset "map!" begin
    xf = Filter(x -> -0.5 < x < 0.5) |> Map(x -> 2x)
    xs = Float64[]
    ys = Float64[]
    ir = llvm_ir(map!, (xf, ys, xs))
    @test nmatches(r"fmul <4 x double>", ir) >= 4
    @test nmatches(r"fcmp [a-z]* <4 x double>", ir) >= 4
end


@testset "Cat SIMD" begin
    coll = [Float64[]]
    rf = Reduction(maybe_usesimd(Cat(), true), +, eltype(coll))
    ir = llvm_ir(transduce, (rf, 0.0, coll))
    @test_broken_if(
        VERSION < v"1.1-",
        nmatches(r"fadd (fast )?<4 x double>", ir) >= 9)
end


@testset "PartitionBy" begin
    xf = PartitionBy(x -> x > 0) |>
        Filter(xs -> mean(abs, xs) < 1.0) |>
        Map(prod)

    coll = Float64[]
    rf = Reduction(xf, +, eltype(coll))
    val = start(rf, 0.0)
    @test anyunions(julia_ir(__foldl__, (rf, val, coll))) == []

    # If Julia becomes clever enough to make `__simple_foldl__`
    # type-stable, there is no need to maintain current complex code:
    simple_ir = julia_ir(__simple_foldl__, (rf, val, coll))
    @test !isempty(anyunions(simple_ir))
end
