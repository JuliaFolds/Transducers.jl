"""
    dreduce(step, xform::Transducer, array; [init, simd, basesize, pool])

Distributed.jl-based parallelization of [`foldl`](@ref).  Input
collection must be indexable.

Unlike [`reduce`](@ref), early termination by [`reduced`](@ref) is not
supported yet.

!!! compat "Transducers.jl 0.4.3"

    New in version 0.4.3.

# Keyword Arguments
- `pool::AbstractWorkerPool`: Passed to `Distributed.remotecall`.
- `basesize::Integer = length(array) ÷ nworkers()`: A size of chunk in
  `array` that is processed by each worker.  A smaller size may be
  required when computation time for processing each item can
  fluctuate a lot.
- For other keyword arguments, see [`foldl`](@ref).

# Examples
```jldoctest
julia> using Transducers
       using Distributed
       using BangBang

julia> dreduce(append!!, Map(vcat), 1:3; init=Union{}[])
3-element Array{Int64,1}:
 1
 2
 3
```
"""
dreduce(step, xform::Transducer, itr; init=MissingInit(), kwargs...) =
    unreduced(dtransduce(xform, Completing(step), init, itr; kwargs...))

"""
    dtransduce(xform::Transducer, step, init, array; [simd, basesize, pool])

See [`dreduce`](@ref) and [`transduce`](@ref).
"""
function dtransduce(
    xform::Transducer, step, init, coll;
    simd::SIMDFlag = Val(false),
    basesize::Integer = length(coll) ÷ Distributed.nworkers(),
    pool::Distributed.AbstractWorkerPool = Distributed.default_worker_pool(),
    _remote_foldl = _remote_foldl,
)
    @argcheck basesize > 0
    load_me_everywhere()
    rf = maybe_usesimd(Reduction(xform, step), simd)
    futures = map(firstindex(coll):basesize:lastindex(coll)) do start
        Distributed.remotecall(
            _remote_foldl,
            pool,
            rf,
            init,
            coll[start:min(end, start - 1 + basesize)],
        )
    end
    # TODO: Cancel remote computation when there is a Reduced.
    results = map(fetch, futures)
    i = findfirst(isreduced, results)
    i === nothing || return results[i]
    c = foldl(results) do a, b
        combine(rf, a, b)
    end
    return complete(rf, c)
end

function _remote_foldl(rf, init, coll)
    acc = _start_init(rf, init)
    return foldl_nocomplete(rf, acc, coll)
end

function load_me_everywhere()
    pkgid = Base.PkgId(@__MODULE__)
    @everywhere Base.require($pkgid)
end

"""
    dcopy(xf::Transducer, T, reducible; basesize) :: Union{T, Empty{T}}
    dcopy(xf::Transducer, reducible::T; basesize) :: Union{T, Empty{T}}

Distributed.jl-based parallel version of [`copy`](@ref).

!!! compat "Transducers.jl 0.4.5"

    New in version 0.4.5.
"""
dcopy(xf, T, reducible; kwargs...) =
    dreduce(append!!, xf |> Map(SingletonVector), reducible; init = Empty(T), kwargs...)
dcopy(xf, reducible::T; kwargs...) where {T} = dcopy(xf, T, reducible; kwargs...)

"""
    dcollect(xf::Transducer, reducible; basesize)

Distributed.jl-based parallel version of [`collect`](@ref).

!!! compat "Transducers.jl 0.4.5"

    New in version 0.4.5.
"""
dcollect(xf, reducible; kwargs...) = dcopy(xf, Vector, reducible; kwargs...)
