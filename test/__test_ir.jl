include("preamble.jl")

using InteractiveUtils: code_llvm, code_warntype
using Statistics: mean

using Transducers: Reduction, start, __foldl__, __simple_foldl__,
    maybe_usesimd, SideEffect, _prepare_map, _map!

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

    @testset "history" begin
        # This test used to work but it wouldn't work now (unless the
        # compiler becomes _extremely_ smart).
        ir = llvm_ir(map!, (xf, ys, xs))
        @test_broken nmatches(r"fmul <4 x double>", ir) >= 4
        @test_broken nmatches(r"fcmp [a-z]* <4 x double>", ir) >= 4
    end

    @testset for simd in [false, true, :ivdep]
        args = _prepare_map(xf, ys, xs, simd)
        ir = llvm_ir(_map!, args)
        @test nmatches(r"fmul <4 x double>", ir) >= 4
        @test nmatches(r"fcmp [a-z]* <4 x double>", ir) >= 4
    end
end


@testset "Cat SIMD" begin
    coll = [Float64[]]
    rf = maybe_usesimd(Reduction(Cat(), +, eltype(coll)), true)
    ir = llvm_ir(transduce, (rf, 0.0, coll))
    @test_broken_if(
        VERSION < v"1.1-",
        nmatches(r"fadd (fast )?<4 x double>", ir) >= 9)
end

unsafe_setter(ys) =
    function((i, x),)
        @inbounds ys[i] = x
    end

@testset "foreach SIMD" begin
    xf_double = Map(x -> 2x)

    params = [
        :Enumerate => xf_double |> Enumerate(),
        :TeeZip => xf_double |> Transducers.TeeZip(Count()) |> Map(reverse),
        :Zip => Zip(Count(), xf_double),
    ]

    @testset "$key" for key in first.(params)
        xf = Dict(params)[key]

        xs = ones(10)
        ys = zero(xs)

        foreach(unsafe_setter(ys), xf, xs)
        @test ys == 2xs

        # Manually "expand" `foreach` internal (so that I can observe
        # SIMD in the IR).
        rf = Reduction(xf,
                       SideEffect(unsafe_setter(ys)),
                       eltype(xs))
        rf = maybe_usesimd(rf, true)
        fill!(ys, 0)
        transduce(rf, nothing, xs)
        @test ys == 2xs

        ir = llvm_ir(transduce, (rf, nothing, xs))
        @test_broken nmatches(r"fmul <4 x double>", ir) >= 4
    end
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
