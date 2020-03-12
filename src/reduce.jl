"""
    reduce(step, xf, reducible; [init, simd, basesize, stoppable]) :: T

Thread-based parallelization of [`foldl`](@ref).  The "bottom"
reduction function `step(::T, ::T) :: T` must be associative and
`init` must be its identity element.

Transducers composing `xf` must be stateless (e.g., [`Map`](@ref),
[`Filter`](@ref), [`Cat`](@ref), etc.) except for [`ScanEmit`](@ref).
Note that [`Scan`](@ref) is not supported (although possible in
theory).  Early termination requires Julia ≥ 1.3.

Use [`tcollect`](@ref) or [`tcopy`](@ref) to collect results into a
container.

See also: [Parallel processing tutorial](@ref tutorial-parallel),
[`foldl`](@ref), [`dreduce`](@ref).

# Keyword Arguments
- `basesize::Integer = length(reducible) ÷ nthreads()`: A size of
  chunk in `reducible` that is processed by each worker.  A smaller
  size may be required when:
    * computation time for processing each item fluctuates a lot
    * computation can be terminated by [`reduced`](@ref) or
      transducers using it, such as [`ReduceIf`](@ref)
- `stoppable::Bool`: [This option usually does not have to be set
  manually.]  Transducers.jl's `reduce` executed in the "stoppable"
  mode used for optimizing reduction with [`reduced`](@ref) has a
  slight overhead if `reduced` is not used.  This mode can be disabled
  by passing `stoppable = false`.  It is usually automatically
  detected and set appropriately.  Note that this option is purely for
  optimization and does not affect the result value.
- For other keyword arguments, see [`foldl`](@ref).

!!! compat "Transducers.jl 0.4.23"

    Keyword option `stoppable` requires at least Transducers.jl 0.4.23.

# Examples
```jldoctest
julia> using Transducers

julia> reduce(+, Map(exp) |> Map(log), 1:3)
6.0

julia> using BangBang: append!!

julia> reduce(append!!, Map(x -> 1:x), 1:2; basesize=1, init=Union{}[])
3-element Array{Int64,1}:
 1
 1
 2
```
"""
Base.reduce

"""
    mapreduce(xf, step, reducible; init, simd)

!!! warning

    `mapreduce` exists primary for backward compatibility.  It is
    recommended to use `reduce`.

Like [`reduce`](@ref) but `step` is _not_ automatically wrapped by
[`Completing`](@ref).
"""
Base.mapreduce

struct SizedReducible{T} <: Reducible
    reducible::T
    basesize::Int
end

foldable(reducible::SizedReducible) = reducible.reducible

"""
    Transducers.issmall(reducible, basesize) :: Bool

Check if `reducible` collection is considered small compared to
`basesize` (an integer).  Fold functions such as [`reduce`](@ref)
switches to sequential `__foldl__` when `issmall` returns `true`.

Default implementation is `length(reducible) <= basesize`.
"""
issmall

issmall(reducible, basesize) = length(reducible) <= basesize

issmall(reducible::SizedReducible) =
    issmall(reducible.reducible, max(reducible.basesize, 1))

function _halve(reducible::SizedReducible)
    left, right = halve(reducible.reducible)
    return (
        SizedReducible(left, reducible.basesize),
        SizedReducible(right, reducible.basesize),
    )
end

struct TaskContext
    listening::Vector{Threads.Atomic{Bool}}
    cancellables::Vector{Threads.Atomic{Bool}}
end

TaskContext() = TaskContext([], [])

function splitcontext(ctx::TaskContext)
    c = Threads.Atomic{Bool}(false)
    return (
        fg = TaskContext(ctx.listening, vcat(ctx.cancellables, c)),
        bg = TaskContext(vcat(ctx.listening, c), ctx.cancellables),
    )
end

function should_abort(ctx::TaskContext)
    for c in ctx.listening
        c[] && return true
    end
    return false
end

function cancel!(ctx::TaskContext)
    for c in ctx.cancellables
        c[] = true
    end
end

struct DummyTask end
Base.schedule(::DummyTask) = nothing

function transduce_assoc(
    xform::Transducer,
    step,
    init,
    coll;
    simd::SIMDFlag = Val(false),
    basesize::Integer = length(coll) ÷ Threads.nthreads(),
    stoppable::Union{Bool,Nothing} = nothing,
)
    rf = maybe_usesimd(Reduction(xform, step), simd)
    if stoppable === nothing
        stoppable = _might_return_reduced(rf, init, coll)
    end
    acc = @return_if_reduced _transduce_assoc_nocomplete(
        rf,
        init,
        coll,
        basesize,
        stoppable,
    )
    result = complete(rf, acc)
    if unreduced(result) isa DefaultInit
        throw(EmptyResultError(rf))
        # See how `transduce(rf, init, coll)` is implemented in ./processes.jl
    end
    return result
end

if VERSION >= v"1.3-alpha"
    maybe_collect(coll) = coll
else
    maybe_collect(coll::AbstractArray) = coll
    maybe_collect(coll) = collect(coll)
end

function _transduce_assoc_nocomplete(rf, init, coll, basesize, stoppable = true)
    reducible = SizedReducible(maybe_collect(coll), basesize)
    @static if VERSION >= v"1.3-alpha"
        return _reduce(TaskContext(), stoppable, DummyTask(), rf, init, reducible)
    else
        return _reduce_threads_for(rf, init, reducible)
    end
end

@noinline _reduce_basecase(rf::F, init::I, reducible) where {F,I} =
    restack(foldl_nocomplete(rf, _start_init(rf, init), foldable(reducible)))
# `restack` here is crucial when using heap-allocated accumulator.
# See `ThreadsX.unique` and the MWE extracted from it:
# https://github.com/tkf/Restacker.jl/blob/master/benchmark/bench_unique.jl

function _reduce(
    ctx,
    stoppable,
    next_task,
    rf::R,
    init::I,
    reducible::Reducible,
) where {R,I}
    if should_abort(ctx)
        # As other tasks may be calling `fetch` on `next_task`, it
        # _must_ be scheduled at some point to avoid dead lock:
        stoppable && schedule(next_task)
        # Maybe use `error=false`?  Or pass something and get it via `yieldto`?
        return init
    end
    if issmall(reducible)
        stoppable && schedule(next_task)
        acc = _reduce_basecase(rf, init, reducible)
        if acc isa Reduced
            cancel!(ctx)
        end
        return acc
    else
        left, right = _halve(reducible)
        fg, bg = splitcontext(ctx)
        task = nonsticky!(@task _reduce(bg, stoppable, next_task, rf, init, right))
        stoppable || schedule(task)
        a0 = _reduce(fg, stoppable, task, rf, init, left)
        b0 = fetch(task)
        a = @return_if_reduced a0
        should_abort(ctx) && return a  # slight optimization
        b0 isa Reduced && return combine_right_reduced(rf, a, b0)
        return combine(rf, a, b0)
    end
end

combine_right_reduced(rf, a, b0::Reduced) =
    reduced(combine(_realbottomrf(rf), a, unreduced(b0)))

function _reduce_threads_for(rf, init, reducible::SizedReducible{<:AbstractArray})
    arr = reducible.reducible
    basesize = reducible.basesize
    nthreads = max(
        1,
        basesize <= 1 ? length(arr) : length(arr) ÷ basesize
    )
    if nthreads == 1
        return foldl_nocomplete(rf, _start_init(rf, init), arr)
    else
        w = length(arr) ÷ nthreads
        results = Vector{Any}(undef, nthreads)
        Threads.@threads for i in 1:nthreads
            if i == nthreads
                chunk = @view arr[(i - 1) * w + 1:end]
            else
                chunk = @view arr[(i - 1) * w + 1:i * w]
            end
            results[i] = foldl_nocomplete(rf, _start_init(rf, init), chunk)
        end
        # It can be done in `log2(n)` for loops but it's not clear if
        # `combine` is compute-intensive enough so that launching
        # threads is worth enough.  Let's merge the `results`
        # sequentially for now.
        return combine_all(rf, results)
    end
end

function combine_all(rf, results)
    step = combine_step(rf)
    return transduce(ensurerf(Completing(step)), Init(step), results)
end

combine_step(rf) =
    asmonoid() do a0, b0
        a = @return_if_reduced a0
        b0 isa Reduced && return combine_right_reduced(rf, a, b0)
        return combine(rf, a, b0)
    end

# The output of `reduce` is correct regardless of the value of
# `stoppable`.  Thus, we can use `return_type` here purely for
# optimization.
_might_return_reduced(rf, init, coll) =
    Base.typeintersect(
        Core.Compiler.return_type(
            _reduce_dummy,  # simulate the output type of `_reduce`
            typeof((rf, init, coll)),
        ),
        Reduced,
    ) !== Union{}

_reduce_dummy(rf, init, coll) =
    __reduce_dummy(rf, init, SizedReducible(maybe_collect(coll), 1))

function __reduce_dummy(rf, init, reducible)
    if issmall(reducible)
        return _reduce_basecase(rf, init, reducible)
    else
        left, right = halve(reducible)
        a = _reduce_dummy(rf, init, left)
        b = _reduce_dummy(rf, init, right)
        a isa Reduced && return a
        b isa Reduced && return combine_right_reduced(rf, a, b)
        return combine(rf, a, b)
    end
end

# AbstractArray for disambiguation
Base.mapreduce(xform::Transducer, step, itr::AbstractArray;
               init = MissingInit(), kwargs...) =
    unreduced(transduce_assoc(xform, step, init, itr; kwargs...))

Base.mapreduce(xform::Transducer, step, itr;
               init = MissingInit(), kwargs...) =
    unreduced(transduce_assoc(xform, step, init, itr; kwargs...))

Base.reduce(step, xform::Transducer, itr; kwargs...) =
    mapreduce(xform, Completing(step), itr; kwargs...)

Base.reduce(step, foldable::Foldable; kwargs...) =
    reduce(step, induction(foldable)...; kwargs...)

"""
    tcopy(xf::Transducer, T, reducible; basesize) :: Union{T, Empty{T}}
    tcopy(xf::Transducer, reducible::T; basesize) :: Union{T, Empty{T}}
    tcopy([T,] itr; basesize) :: Union{T, Empty{T}}

Thread-based parallel version of [`copy`](@ref).
Keyword arguments are passed to [`reduce`](@ref).

See also: [Parallel processing tutorial](@ref tutorial-parallel)
(especially [Example: parallel `collect`](@ref tutorial-parallel-collect)).

!!! compat "Transducers.jl 0.4.5"

    New in version 0.4.5.

!!! compat "Transducers.jl 0.4.8"

    `tcopy` now accepts iterator comprehensions and eductions.

# Examples
```jldoctest
julia> using Transducers

julia> tcopy(Map(x -> x => x^2), Dict, 2:2)
Dict{Int64,Int64} with 1 entry:
  2 => 4

julia> using TypedTables

julia> @assert tcopy(Map(x -> (a=x,)), Table, 1:1) == Table(a=[1])

julia> using StructArrays

julia> @assert tcopy(Map(x -> (a=x,)), StructVector, 1:1) == StructVector(a=[1])
```

`tcopy` works with iterator comprehensions and eductions (unlike
[`copy`](@ref), there is no need for manual conversion with
[`eduction`](@ref)):

```jldoctest; setup = :(using Transducers, StructArrays, DataFrames)
julia> table = StructVector(a = [1, 2, 3], b = [5, 6, 7]);

julia> @assert tcopy(
           (A = row.a + 1, B = row.b - 1) for row in table if isodd(row.a)
       ) == StructVector(A = [2, 4], B = [4, 6])

julia> @assert tcopy(
           DataFrame,
           (A = row.a + 1, B = row.b - 1) for row in table if isodd(row.a)
       ) == DataFrame(A = [2, 4], B = [4, 6])

julia> @assert tcopy(eduction(
           Filter(row -> isodd(row.a)) |> Map(row -> (A = row.a + 1, B = row.b - 1)),
           table,
       )) == StructVector(A = [2, 4], B = [4, 6])
```

If you have [`Cat`](@ref) or [`MapCat`](@ref) at the end of the
transducer, consider using [`reduce`](@ref) directly:

```jldoctest
julia> using Transducers
       using DataFrames

julia> @assert tcopy(
           Map(x -> DataFrame(a = [x])) |> MapCat(eachrow),
           DataFrame,
           1:2;
           basesize = 1,
       ) == DataFrame(a = [1, 2])

julia> using BangBang: Empty, append!!

julia> @assert reduce(
           append!!,
           Map(x -> DataFrame(a = [x])),
           1:2;
           basesize = 1,
           # init = Empty(DataFrame),
       ) == DataFrame(a = [1, 2])
```

Note that above snippet assumes that it is OK to mutate the dataframe
returned by the transducer.  Use `init = Empty(DataFrame)` if this is
not the case.

This approach of using `reduce` works with other containers; e.g.,
with `TypedTables.Table`:

```jldoctest; setup = :(using Transducers)
julia> using TypedTables

julia> @assert reduce(
           append!!,
           Map(x -> Table(a = [x])),
           1:2;
           basesize = 1,
           # init = Empty(Table),
       ) == Table(a = [1, 2])
```
"""
tcopy(xf, T, reducible; kwargs...) =
    reduce(append!!, xf |> Map(SingletonVector), reducible; init = Empty(T), kwargs...)
tcopy(xf, reducible; kwargs...) = tcopy(xf, _materializer(reducible), reducible; kwargs...)

function tcopy(::Type{T}, itr; kwargs...) where {T}
    xf, foldable = _extract_xf(itr)
    return tcopy(xf, T, foldable; kwargs...)
end

function tcopy(itr; kwargs...)
    xf, foldable = _extract_xf(itr)
    return tcopy(xf, foldable; kwargs...)
end

tcopy(xf, T::Type{<:AbstractSet}, reducible; kwargs...) =
    reduce(union!!, xf |> Map(SingletonVector), reducible; init = Empty(T), kwargs...)

function tcopy(
    ::typeof(Map(identity)),
    T::Type{<:AbstractSet},
    array::PartitionableArray;
    basesize::Integer = max(1, length(array) ÷ Threads.nthreads()),
    kwargs...,
)
    @argcheck basesize >= 1
    return reduce(
        union!!,
        Map(identity),
        Iterators.partition(array, basesize);
        init = Empty(T),
        basesize = 1,
        kwargs...,
    )
end

"""
    tcollect(xf::Transducer, reducible; basesize) :: Union{Vector, Empty{Vector}}
    tcollect(itr; basesize) :: Union{Vector, Empty{Vector}}

Thread-based parallel version of [`collect`](@ref).
This is just a short-hand notation of `tcopy(xf, Vector, reducible)`.
Use [`tcopy`](@ref) to get a container other than a `Vector`.

See also: [Parallel processing tutorial](@ref tutorial-parallel)
(especially [Example: parallel `collect`](@ref tutorial-parallel-collect)).

!!! compat "Transducers.jl 0.4.5"

    New in version 0.4.5.

!!! compat "Transducers.jl 0.4.8"

    `tcollect` now accepts iterator comprehensions and eductions.

# Examples
```jldoctest
julia> using Transducers

julia> tcollect(Map(x -> x^2), 1:2)
2-element Array{Int64,1}:
 1
 4

julia> tcollect(x^2 for x in 1:2)
2-element Array{Int64,1}:
 1
 4
```
"""
tcollect(xf, reducible; kwargs...) = tcopy(xf, Vector, reducible; kwargs...)
tcollect(itr; kwargs...) = tcollect(induction(eduction(itr))...; kwargs...)
