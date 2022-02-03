module BenchGEMM

using ArgCheck
using BenchmarkTools
using LinearAlgebra
using Referenceables: referenceable
using Transducers
using Transducers: @simd_if, @next, complete, maybe_usesimd, BottomRF, SideEffect

_size(x) = size.(axes(x), 1)
_size(x, i) = size(axes(x)[i], 1)

@inline function ij_ik_kj_foldable(C, A, B)
    @argcheck _size(C) === (_size(A, 1), _size(B, 2))
    @argcheck _size(A, 2) === _size(B, 1)
    @argcheck !any(Base.has_offset_axes, (A, B, C))
    @inline function fold(rf, acc, _)
        for j in 1:size(C, 2), k in 1:size(A, 2)
            b = @inbounds B[k, j]
            @simd_if rf for i in 1:size(A, 1)
                c = @inbounds C[i, j]
                a = @inbounds A[i, k]
                acc = @next(rf, acc, (c, a, b))
            end
        end
        return complete(rf, acc)
    end
    return AdHocFoldable(fold)
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
        return  # for type stability
    end
    transduce(maybe_usesimd(BottomRF(rf), simd), nothing, CAB)

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

let sub = suite["mul"] = BenchmarkGroup()
    for impl in ["xf", "man"]
        sub[impl] = BenchmarkGroup()
        sub[impl]["false"] = BenchmarkGroup()
        sub[impl]["true"] = BenchmarkGroup()
        sub[impl]["ivdep"] = BenchmarkGroup()
    end

    sub["linalg"] = BenchmarkGroup()
end

for n in [8, 32, 256]
    A = randn(n, n)
    B = randn(n, n)
    desired = A * B
    C = zero(desired)

    sub = suite["mul"]
    for (impl, f) in [("xf", xfmul!), ("man", manmul!)]
        for simd in [false, true, :ivdep]
            sub[impl][string(simd)][n] = @benchmarkable(
                $f($C, $A, $B, $(Val(simd)))
            )
        end
    end
    sub["linalg"][n] = @benchmarkable mul!($C, $A, $B)
end

function fusedxfmul!(C, A, B1, B2)
    fill!(C, 0)

    B = Broadcast.instantiate(Broadcast.broadcasted(tuple, B1, B2))
    CAB = ij_ik_kj_foldable(referenceable(C), A, B)

    foreach(CAB; simd=Val(:ivdep)) do (c, a, (b1, b2))
        c0 = c[]
        c1 = muladd(a, b1, c0)
        c2 = a^2 * b2
        c[] = c1 + c2
        return  # for type stability
    end

    return C
end

function nonfusedmul!(C, A1, A2, B1, B2)
    Ⅰ = one(eltype(C))
    ∅ = zero(eltype(C))
    A2 .= A1 .^ 2
    BLAS.gemm!('N', 'N', Ⅰ, A1, B1, ∅, C)
    BLAS.gemm!('N', 'N', Ⅰ, A2, B2, Ⅰ, C)
    return C
end

let sub = suite["fusedmul"] = BenchmarkGroup(),
    n = 1024

    sub["xf"] = BenchmarkGroup()
    sub["blas"] = BenchmarkGroup()

    for m in [2, 8, 16, 32]
        A1 = randn(n, n)
        A2 = A1 .^ 2
        B1 = randn(n, m)
        B2 = randn(n, m)
        C = zero(A1 * B2)

        @assert isapprox(
            copy(fusedxfmul!(C, A1, B1, B2)),
            copy(nonfusedmul!(C, A1, A2, B1, B2)),
        )

        sub["xf"][m] = @benchmarkable fusedxfmul!($C, $A1, $B1, $B2)
        sub["blas"][m] = @benchmarkable nonfusedmul!($C, $A1, $A2, $B1, $B2)
    end
end

end  # module
BenchGEMM.suite
