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
    transduce(IdentityTransducer(), rf, init, coll, exec)

function fold(rf::RF, coll; init = DefaultInit, kwargs...) where {RF}
    xf, coll0 = extract_transducer(coll)
    return unreduced(
        transduce(xf, Completing(rf), init, coll0, executor_for(coll0; kwargs...)),
    )
end

fold(rf; kw...) = itr -> fold(rf, itr; kw...)

executor_for(::Any; kwargs...) = SequentialEx(; kwargs...)

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
