"""
    dreduce(step, xform::Transducer, array; [init, simd, basesize, pool])

Distributed.jl-based parallelization of `reduce`.  Input collection must
be indexable.

# Keyword Arguments
- `pool::AbstractWorkerPool`: Passed to `Distributed.remotecall`.
- `basesize::Integer`: A size of chunk in `itr` that is processed by
  each worker.  Unlike `reduce`, this is `length(itr) ÷ nworkers()`
  so that inter-process communication is minimized.  A smaller size may
  be required when computation time for processing each item can fluctuate
  a lot.
- For other keyword arguments, see [`reduce`](@ref).

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
    unreduced(dtransduce(xform, Completing(step), init, itr); kwargs...)

"""
    dtransduce(xform::Transducer, step, init, array; [simd, basesize, pool])

See [`dreduce`](@ref) and [`transduce`](@ref).
"""
function dtransduce(
    xform::Transducer, step, init, coll;
    simd::SIMDFlag = Val(false),
    basesize::Integer = length(coll) ÷ Distributed.nworkers(),
    pool::Distributed.AbstractWorkerPool = Distributed.default_worker_pool(),
)
    @argcheck basesize > 0
    load_me_everywhere()
    rf = maybe_usesimd(Reduction(xform, step), simd)
    futures = map(firstindex(coll):basesize:lastindex(coll)) do start
        Distributed.remotecall(
            foldl_nocomplete,
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

function load_me_everywhere()
    pkgid = Base.PkgId(@__MODULE__)
    @everywhere Base.require($pkgid)
end
