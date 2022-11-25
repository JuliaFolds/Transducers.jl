struct SizedReducible{T,S<:Integer} <: Reducible
    reducible::T
    basesize::S
end

foldable(reducible::SizedReducible) = reducible.reducible
foldable(reducible) = reducible

issmall(reducible, basesize) = amount(reducible) <= basesize

issmall(reducible::SizedReducible) =
    issmall(reducible.reducible, max(reducible.basesize, 1))

function _halve(reducible::SizedReducible)
    left, right = _halve(reducible.reducible)
    return (
        SizedReducible(left, reducible.basesize),
        SizedReducible(right, reducible.basesize),
    )
end
_halve(x) = halve(x)

abstract type DACContext end

struct NoopDACContext <: DACContext end
splitcontext(ctx::NoopDACContext) = (ctx, ctx)
should_abort(::NoopDACContext) = false
cancel!(::NoopDACContext) = nothing

struct CancellableDACContext <: DACContext
    listening::Vector{Threads.Atomic{Bool}}
    cancellables::Vector{Threads.Atomic{Bool}}
end

CancellableDACContext() =
    CancellableDACContext(Threads.Atomic{Bool}[], Threads.Atomic{Bool}[])

function splitcontext(ctx::CancellableDACContext)
    c = Threads.Atomic{Bool}(false)
    fg = CancellableDACContext(ctx.listening, vcat(ctx.cancellables, c))
    bg = CancellableDACContext(vcat(ctx.listening, c), ctx.cancellables)
    return (fg, bg)
end

function should_abort(ctx::CancellableDACContext)
    for c in ctx.listening
        c[] && return true
    end
    return false
end

function cancel!(ctx::CancellableDACContext)
    for c in ctx.cancellables
        c[] = true
    end
end

@noinline _reduce_basecase(rf::F, init::I, reducible) where {F,I} =
    restack(foldl_basecase(rf, start(rf, init), foldable(reducible)))
# `restack` here is crucial when using heap-allocated accumulator.
# See `ThreadsX.unique` and the MWE extracted from it:
# https://github.com/tkf/Restacker.jl/blob/master/benchmark/bench_unique.jl
