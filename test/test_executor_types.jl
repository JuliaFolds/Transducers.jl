module TestExecutorTypes

include("preamble.jl")
using Referenceables: referenceable
using Transducers: Executor, PreferParallel, executor_type, maybe_set_simd

struct Opinionated{T<:Executor} <: AbstractVector{Int} end
Opinionated(::Type{T}) where {T} = Opinionated{T}()
Transducers.executor_type(::Opinionated{T}) where {T} = T

@testset "executor_type (promote)" begin
    @testset for (xs, ex) in [
        (1:2, PreferParallel),
        (Channel(0), SequentialEx),
        (zip(1:2, 3:4), PreferParallel),
        (zip(1:2, Channel(0)), SequentialEx),
        (Iterators.product(1:2, 3:4), PreferParallel),
        (Iterators.product(1:2, Channel(0)), SequentialEx),
        (Opinionated(DistributedEx), DistributedEx),
        (zip(Opinionated(DistributedEx), 1:2), DistributedEx),
        (zip(1:2, Opinionated(DistributedEx)), DistributedEx),
        (zip(Opinionated(DistributedEx), 1:2, 3:4), DistributedEx),
        (zip(1:2, Opinionated(DistributedEx), 3:4), DistributedEx),
        (zip(1:2, 3:4, Opinionated(DistributedEx)), DistributedEx),
        (referenceable([]), PreferParallel),
        (referenceable(Opinionated(SequentialEx)), SequentialEx),
    ]
        @test @inferred(executor_type(xs)) === ex
    end
end

@testset "executor_type (error)" begin
    err =
        @test_error executor_type(zip(Opinionated(ThreadedEx), Opinionated(DistributedEx)))
    msg = sprint(showerror, err)
    @test occursin("failed to promote executors", msg)
end

@testset "show" begin
    @test occursin("ThreadedEx()", sprint(show, ThreadedEx()))
    @test occursin("ThreadedEx(simd = true)", sprint(show, ThreadedEx(simd = true)))
    @test occursin(
        "ThreadedEx(simd = true, basesize = 2)",
        sprint(show, ThreadedEx(simd = true, basesize = 2)),
    )
end

@testset "repr" begin
    @testset for x in [
        ThreadedEx(),
        ThreadedEx(simd = true),
        ThreadedEx(simd = true, basesize = 2),
        ThreadedEx{Any}(),
        ThreadedEx{Any}(simd = true),
        ThreadedEx{Any}(simd = true, basesize = 2),
    ]
        str = repr(x)
        reconstructed = include_string(@__MODULE__, str)
        @test reconstructed == x
    end
end

@testset "maybe_set_simd" begin
    @test maybe_set_simd(SequentialEx(), true).kwargs.simd === true
    @test maybe_set_simd(SequentialEx(), false).kwargs.simd === false
    @test maybe_set_simd(SequentialEx(simd = false), true).kwargs.simd === false
    @test maybe_set_simd(SequentialEx(simd = true), false).kwargs.simd === true
end

end  # module
