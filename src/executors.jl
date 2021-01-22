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

"""
    SequentialEx(; kwargs...)
    ThreadedEx(; kwargs...)
    DistributedEx(; kwargs...)

Sequential, threaded, and distributed executor.  An executor specifies
execution strategy and its parameters.

See [`foldxl`](@ref), [`foldxt`](@ref) and [`foldxd`](@ref) for usable
keyword arguments.
"""
(SequentialEx, ThreadedEx, DistributedEx)

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

(::Type{Ex})(; kwargs...) where {Ex<:Executor} = Ex(kwargs.data)

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
# * We can extend the API of `executor_type` that returns a list of comptaible
#   executors rather than only one executor.

# `executor_type(::CustomContainer)` is the main (still hidden) API.
# TODO: should `executor_type` be renamed to `parallel_executor_type` if the
# default type is `PreferParallel`?
@inline executor_type(::Any) = PreferParallel

# Some "famous" containers known to be sequential-only:
@inline executor_type(::AbstractChannel) = SequentialEx
# @inline executor_type(::Distributed.RemoteChannel) = SequentialEx
@inline executor_type(::Iterators.Stateful) = SequentialEx

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
