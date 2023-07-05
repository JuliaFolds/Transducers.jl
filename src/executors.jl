abstract type Executor end
struct SequentialEx{K} <: Executor
    kwargs::K
end
struct ThreadedEx{K} <: Executor
    kwargs::K
end
struct DistributedEx{K} <: Executor
    kwargs::K
end
struct PreferParallel{K} <: Executor
    kwargs::K
end

const _SIMD_OPT_DOCS = """
- `simd`: If `true` or `:ivdep`, enable SIMD using `Base.@simd`.  If
  `:ivdep`, use `@simd ivdep for ... end` variant.  Read Julia manual
  of `Base.@simd` to understand when it is appropriate to use this
  option.  For example, `simd = :ivdep` _must not_ be used with stateful
  transducer like [`Scan`](@ref).  If `false` (default), `Base.@simd` is not
  used.
"""

"""
    SequentialEx(; simd)

Sequential fold executor.  It can be passed to APIs from packages such as
Folds.jl and FLoops.jl to run the algorithm sequentially.

See also: [`foldxl`](@ref), [`ThreadedEx`](@ref) and [`DistributedEx`](@ref).

# Keyword Arguments
$_SIMD_OPT_DOCS

# Examples
```jldoctest
julia> using Folds

julia> Folds.sum(1:3, SequentialEx())
6
```
"""
SequentialEx

const _THREADED_EX_OPTS_DOCS = """
- `basesize::Integer = amount(reducible) ÷ nthreads()`: A size of
  chunk in `reducible` that is processed by each worker.  A smaller
  size may be required when:
    * computation time for processing each item fluctuates a lot
    * computation can be terminated by [`reduced`](@ref) or
      transducers using it, such as [`ReduceIf`](@ref)
- `stoppable::Bool`: [This option usually does not have to be set
  manually.]  The threaded fold executed in the "stoppable"
  mode used for optimizing reduction with [`reduced`](@ref) has a
  slight overhead if `reduced` is not used.  This mode can be disabled
  by passing `stoppable = false`.  It is usually automatically
  detected and set appropriately.  Note that this option is purely for
  optimization and does not affect the result value.
- `nestlevel::Union{Integer,Val}`: Specify how many inner `Cat`
  (flatten) transducers to be multi-threaded (using [`TCat`](@ref)).
  It must be a positive integer, `Val` of positive integer, or
  `Val(:inf)`.  `Val(:inf)` means to use multi-threading for all `Cat`
  transducers.  Note that `Cat` transducer should be statically known.
  That is to say, the fold implementation sees two `Cat`s in `... |> Map(f) |>
  Cat() |> Cat()` but only one `Cat` in `... |> Map(x -> f(x) |> Cat()) |>
  Cat()` even though they are semantically identical.
"""

"""
    ThreadedEx(; basesize, stoppable, nestlevel, simd)

Multi-threaded fold executor.  This is the default [^1] parallel executor used
by Folds.jl and FLoops.jl.

See also: [`foldxt`](@ref), [`SequentialEx`](@ref) and [`DistributedEx`](@ref).

[^1]: More specifically, Folds.jl and FLoops.jl uses [`PreferParallel`](@ref)
      which in turn defaults to `ThreadedEx`.

# Keyword Arguments
$_THREADED_EX_OPTS_DOCS
$_SIMD_OPT_DOCS

# Examples
```jldoctest
julia> using Folds

julia> Folds.sum(1:3, ThreadedEx(basesize = 1))
6
```
"""
ThreadedEx

const _DISTRIBUTED_EX_OPTS_DOCS = """
- `pool::AbstractWorkerPool`: Passed to `Distributed.remotecall`.
- `basesize::Integer = amount(array) ÷ nworkers()`: A size of chunk in
  `array` that is processed by each worker.  A smaller size may be
  required when computation time for processing each item can
  fluctuate a lot.
- `threads_basesize::Integer = basesize ÷ nthreads()`: A size of chunk
  in `array` that is processed by each task in each worker process.
  The default setting assumes that the number of threads used in all
  workers are the same.  For heterogeneous setup where each worker
  process has different number of threads, it may be required to use
  smaller `threads_basesize` _and_ `basesize` to get a good performance.
"""

"""
    DistributedEx(; pool, basesize, threads_basesize, simd)

Distributed fold executor.  It can be passed to APIs from packages such as
Folds.jl and FLoops.jl to run the algorithm sequentially.

See also: [`foldxd`](@ref), [`SequentialEx`](@ref) and [`ThreadedEx`](@ref).

# Keyword Arguments
$_DISTRIBUTED_EX_OPTS_DOCS
$_SIMD_OPT_DOCS

# Examples
```jldoctest
julia> using Folds

julia> Folds.sum(1:3, DistributedEx())
6
```
"""
DistributedEx

"""
    PreferParallel(; simd, basesize)

A "placeholder" executor that indicates preference to parallel execution.

This lets the input data collection decide preferred execution strategy
(e.g., `CUDAEx` for `CuArray` when FoldsCUDA.jl is available), **assuming
that the reducing function is associative**. The default executor is
[`ThreadedEx`](@ref). As an optional feature, some input data collections
support (e.g., `AbstractChannel`) automatically demoting the execution
strategy to [`SequentialEx`](@ref).  An error is thrown if the automatic
detection fails,
"""
PreferParallel

maybe_set_simd(exc::Executor, simd) =
    isdefined(exc.kwargs, :simd) ? exc : @set exc.kwargs = merge(exc.kwargs, (simd = simd,))

(::Type{Ex})(; kwargs...) where {Ex<:Executor} = Ex(values(kwargs))

transduce(xf, rf::RF, init, coll, exc::SequentialEx) where {RF} =
    transduce(xf, rf, init, coll; exc.kwargs...)
transduce(xf, rf, init, coll, exc::ThreadedEx) =
    transduce_assoc(xf, rf, init, coll; exc.kwargs...)
transduce(xf, rf, init, coll, exc::DistributedEx) =
    dtransduce(xf, rf, init, coll; exc.kwargs...)

fold(rf::RF, coll, exec::Executor; init = DefaultInit) where {RF} =
    unreduced(transduce(IdentityTransducer(), Completing(rf), init, coll, exec))
fold(rf::RF, coll; init = DefaultInit, kwargs...) where {RF} =
    fold(rf, coll, PreferParallel(; kwargs...); init = init)

function transduce(xf, rf, init, coll, exc::PreferParallel)
    xf0, coll0 = extract_transducer(coll)
    return transduce(xf ∘ xf0, rf, init, coll0, executor_for(coll0, exc))
end

fold(rf; kw...) = itr -> fold(rf, itr; kw...)

executor_from(::Type{Ex}, exc::PreferParallel) where {Ex<:Executor} = Ex(exc.kwargs)
executor_from(::Type{PreferParallel}, exc::PreferParallel) = ThreadedEx(exc.kwargs)
executor_from(::Type{SequentialEx}, exc::PreferParallel) =
    SequentialEx(; _seq_ex_kwargs(; exc.kwargs...)...)
_seq_ex_kwargs(; simd = Val(false), _...) = (simd = simd,)

executor_for(xs::Any, exc) = executor_from(executor_type(xs), exc)
# * `ThreadedEx` part sould be determined by the property of transducers (and,
#   ideally, reducing function).
# * We can extend the API of `executor_type` that returns a list of compatible
#   executors rather than only one executor.

# `executor_type(::CustomContainer)` is the main (still hidden) API.
# TODO: should `executor_type` be renamed to `parallel_executor_type` if the
# default type is `PreferParallel`?
@inline executor_type(::Any) = PreferParallel

# Some "famous" containers known to be sequential-only:
@inline executor_type(::AbstractChannel) = SequentialEx
# @inline executor_type(::Distributed.RemoteChannel) = SequentialEx
@inline executor_type(::Iterators.Stateful) = SequentialEx

@inline executor_type(xs::Iterators.Pairs) =
    executor_promote_type(executor_type(keys(xs)), executor_type(values(xs)))

@inline executor_type(xs::Iterators.ProductIterator) =
    mapfoldlargs(executor_type, executor_promote_type, PreferParallel, xs.iterators...)

@inline executor_type(xs::_Zip) =
    mapfoldlargs(executor_type, executor_promote_type, PreferParallel, arguments(xs)...)

@inline executor_promote_type(::Type{T}, ::Type{T}) where {T} = T
@inline function executor_promote_type(::Type{T}, ::Type{S}) where {T,S}
    result =
        executor_promote_result(executor_promote_rule(T, S), executor_promote_rule(S, T))
    result === nothing && throw_promote_failure(T, S)
    return result
end

# `nothing` means promotion failure
@inline executor_promote_result(::Nothing, ::Nothing) = nothing
@inline executor_promote_result(::Type{T}, ::Type{S}) where {T,S} = nothing
@inline executor_promote_result(::Type{T}, ::Type{T}) where {T} = T
@inline executor_promote_result(::Nothing, ::Type{T}) where {T} = T
@inline executor_promote_result(::Type{T}, ::Nothing) where {T} = T

# Only the owner of the first argument should define the rule. Furthermore, a
# custom executor `CustomEx` should define
# `executor_promote_rule(::Type{SequentialEx}, ::Type{OtherEx}) = OtherEx` only
# if it knows how to handle all `xs` such that `executor_type(xs) = OtherEx`.
@inline executor_promote_rule(::Type{PreferParallel}, ::Type{T}) where {T} = T
@inline executor_promote_rule(::Type, ::Type) = nothing

@noinline throw_promote_failure(T, S) = error("failed to promote executors:\n$T\n$S")
# TODO: show information on which container "suggested" which executor?

function Base.show(io::IO, exc::Executor)
    T = typeof(exc.kwargs)
    if (
        fieldtype(typeof(exc), 1) !== typeof(exc.kwargs) ||
        any(i -> typeof(exc.kwargs[i]) != fieldtype(T, i), 1:nfields(exc.kwargs))
    )
        return invoke(show, Tuple{IO,Any}, io, exc)
    end
    Ex = getfield(parentmodule(typeof(exc)), nameof(typeof(exc)))
    print(io, Ex)
    if isempty(exc.kwargs)
        print(io, "()")
    elseif length(exc.kwargs) == 1
        print(io, '(', fieldname(T, 1), " = ", exc.kwargs[1], ')')
    else
        print(io, exc.kwargs)
    end
    return
end
