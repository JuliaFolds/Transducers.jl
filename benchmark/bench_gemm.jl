module BenchGEMM

using ArgCheck
using BenchmarkTools
using LinearAlgebra
using Referenceables: referenceable
using Transducers
using Transducers: @simd_if, @next!, complete, maybe_usesimd, BottomRF, SideEffect

@inline function ij_ik_kj_foldable(C, A, B)
    @argcheck size(C) === (size(A)[1], size(B)[2])
    @argcheck size(A)[2] === size(B)[1]
    @argcheck !any(Base.has_offset_axes, (A, B, C))
    return AdHocFoldable() do rf, acc, _
        Base.@_inline_meta
        for j in 1:size(C, 2), k in 1:size(A, 2)
            b = @inbounds B[k, j]
            @simd_if rf for i in 1:size(A, 1)
                c = @inbounds C[i, j]
                a = @inbounds A[i, k]
                @next!(rf, acc, (c, a, b))
            end
        end
        return complete(rf, acc)
    end
end

function xfmul!(C, A, B, simd=Val(false))
    fill!(C, 0)

    CAB = ij_ik_kj_foldable(referenceable(C), A, B)

    # Passing `simd::Val` as a keyword argument introduces an
    # `invoke`, even if I add `@inline` annotation to `foreach`...
    #=
    foreach(CAB; simd=simd) do (c, a, b)
        c[] = muladd(a, b, c[])
    end
    =#

    rf = SideEffect() do (c, a, b)
        c[] = muladd(a, b, c[])
    end
    transduce(maybe_usesimd(BottomRF{Any}(rf), simd), nothing, CAB)

    return C
end

macro _simd_if(simd, loop)
    ex = quote
        if $simd === Val(:ivdep)
            $Base.@simd ivdep $loop
        elseif $simd === Val(true)
            $Base.@simd $loop
        else
            $loop
        end
    end
    return esc(ex)
end

function manmul!(C, A, B, simd=Val(true))
    @argcheck size.((C, C, A), (1, 2, 2)) === size.((A, B, B), (1, 2, 1))
    @argcheck !any(Base.has_offset_axes, (A, B, C))
    fill!(C, 0)
    for j in 1:size(C, 2), k in 1:size(A, 2)
        b = @inbounds B[k, j]
        aofs = LinearIndices(A)[1, k] - 1
        cofs = LinearIndices(C)[1, j] - 1
        @_simd_if simd for i in 1:size(A, 1)
            c = @inbounds C[i + cofs]
            a = @inbounds A[i + aofs]
            @inbounds C[i + cofs] = muladd(a, b, c)
        end
    end
    C
end

let
    A = randn(3, 3)
    B = randn(3, 3)
    desired = A * B
    C = zero(desired)

    xfmul!(C, A, B)
    @assert maximum(abs.(C .- desired)) < 1e-8
end


suite = BenchmarkGroup()
for impl in ["xf", "man"]
    suite[impl] = BenchmarkGroup()
    suite[impl]["false"] = BenchmarkGroup()
    suite[impl]["true"] = BenchmarkGroup()
    suite[impl]["ivdep"] = BenchmarkGroup()
end

suite["linalg"] = BenchmarkGroup()

for n in [8, 32, 256]
    A = randn(n, n)
    B = randn(n, n)
    desired = A * B
    C = zero(desired)

    for (impl, f) in [("xf", xfmul!), ("man", manmul!)]
        for simd in [false, true, :ivdep]
            suite[impl][string(simd)][n] = @benchmarkable(
                $f($C, $A, $B, $(Val(simd)))
            )
        end
    end
    suite["linalg"][n] = @benchmarkable mul!($C, $A, $B)
end

end  # module
BenchGEMM.suite
