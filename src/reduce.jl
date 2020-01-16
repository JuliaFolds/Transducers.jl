"""
    reduce(step, xf, reducible; [init, simd, basesize]) :: T

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
- For other keyword arguments, see [`foldl`](@ref).

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

issmall(reducible::SizedReducible) =
    length(reducible.reducible) <= max(reducible.basesize, 1)

function halve(reducible::SizedReducible)
    left, right = halve(reducible.reducible)
    return (
        SizedReducible(left, reducible.basesize),
        SizedReducible(right, reducible.basesize),
    )
end

function halve(arr::AbstractArray)
    # TODO: support "slow" arrays
    mid = length(arr) ÷ 2
    left = @view arr[firstindex(arr):firstindex(arr) - 1 + mid]
    right = @view arr[firstindex(arr) + mid:end]
    return (left, right)
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

function transduce_assoc(
    xform::Transducer, step, init, coll;
    simd::SIMDFlag = Val(false),
    basesize::Integer = length(coll) ÷ Threads.nthreads(),
)
    rf = maybe_usesimd(Reduction(xform, step), simd)
    acc = @return_if_reduced _transduce_assoc_nocomplete(rf, init, coll, basesize)
    return complete(rf, acc)
end

function _transduce_assoc_nocomplete(rf, init, coll, basesize)
    reducible = SizedReducible(coll, basesize)
    @static if VERSION >= v"1.3-alpha"
        return _reduce(TaskContext(), rf, init, reducible)
    else
        return _reduce_threads_for(rf, init, reducible)
    end
end

function _reduce(ctx, rf, init, reducible::Reducible)
    should_abort(ctx) && return init
    if issmall(reducible)
        acc = foldl_nocomplete(rf, _start_init(rf, init), foldable(reducible))
        if acc isa Reduced
            cancel!(ctx)
        end
        return acc
    else
        left, right = halve(reducible)
        fg, bg = splitcontext(ctx)
        task = @spawn _reduce(bg, rf, init, right)
        a0 = _reduce(fg, rf, init, left)
        b0 = fetch(task)
        a = @return_if_reduced a0
        b = @return_if_reduced b0
        should_abort(ctx) && return a  # slight optimization
        return combine(rf, a, b)
    end
end

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
        return foldl(combine_step(rf), Map(identity), results)
    end
end

combine_step(rf) =
    asmonoid((a, b) -> combine(rf, (@return_if_reduced a), (@return_if_reduced b)))

# AbstractArray for disambiguation
Base.mapreduce(xform::Transducer, step, itr::AbstractArray;
               init = MissingInit(), kwargs...) =
    unreduced(transduce_assoc(xform, step, init, itr; kwargs...))

Base.mapreduce(xform::Transducer, step, itr;
               init = MissingInit(), kwargs...) =
    unreduced(transduce_assoc(xform, step, init, itr; kwargs...))

Base.reduce(step, xform::Transducer, itr; kwargs...) =
    mapreduce(xform, Completing(step), itr; kwargs...)

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
    xf, foldable = induction(eduction(itr))
    return tcopy(xf, T, foldable; kwargs...)
end

function tcopy(itr; kwargs...)
    xf, foldable = induction(eduction(itr))
    return tcopy(xf, foldable; kwargs...)
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
