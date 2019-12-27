"""
    dreduce(step, xform::Transducer, array; [init, simd, basesize, pool])

Distributed.jl-based parallelization of [`foldl`](@ref).  Input
collection must be indexable.

Unlike [`reduce`](@ref), early termination by [`reduced`](@ref) is not
supported yet.

Use [`dcollect`](@ref) or [`dcopy`](@ref) to collect results into a
container.

See also: [Parallel processing tutorial](@ref tutorial-parallel),
[`foldl`](@ref), [`reduce`](@ref).

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

julia> dreduce(+, Map(exp) |> Map(log), 1:3)
6.0
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
    basesize::Integer = max(1, length(coll) ÷ Distributed.nworkers()),
    pool::Distributed.AbstractWorkerPool = Distributed.default_worker_pool(),
    _remote_foldl = _remote_foldl,
)
    @argcheck basesize > 0
    isempty(coll) && return init
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
    dcopy([T,] itr) :: Union{T, Empty{T}}

Distributed.jl-based parallel version of [`copy`](@ref).  Keyword
arguments are passed to [`dreduce`](@ref).  For examples, see
[`tcopy`](@ref).

See also: [Parallel processing tutorial](@ref tutorial-parallel)
(especially [Example: parallel `collect`](@ref tutorial-parallel-collect)).

!!! compat "Transducers.jl 0.4.5"

    New in version 0.4.5.

!!! compat "Transducers.jl 0.4.8"

    `dcopy` now accepts iterator comprehensions and eductions.
"""
dcopy(xf, T, reducible; kwargs...) =
    dreduce(append!!, xf |> Map(SingletonVector), reducible; init = Empty(T), kwargs...)
dcopy(xf, reducible; kwargs...) = dcopy(xf, _materializer(reducible), reducible; kwargs...)

function dcopy(::Type{T}, itr; kwargs...) where {T}
    xf, foldable = induction(eduction(itr))
    return dcopy(xf, T, foldable; kwargs...)
end

function dcopy(itr; kwargs...)
    xf, foldable = induction(eduction(itr))
    return dcopy(xf, foldable; kwargs...)
end

"""
    dcollect(xf::Transducer, reducible; basesize) :: Union{Vector, Empty{Vector}}
    dcollect(itr; basesize) :: Union{Vector, Empty{Vector}}

Distributed.jl-based parallel version of [`collect`](@ref).
This is just a short-hand notation of `dcopy(xf, Vector, reducible)`.
Use [`dcopy`](@ref) to get a container other than a `Vector`.

See also: [Parallel processing tutorial](@ref tutorial-parallel)
(especially [Example: parallel `collect`](@ref tutorial-parallel-collect)).

!!! compat "Transducers.jl 0.4.5"

    New in version 0.4.5.

!!! compat "Transducers.jl 0.4.8"

    `dcollect` now accepts iterator comprehensions and eductions.
"""
dcollect(xf, reducible; kwargs...) = dcopy(xf, Vector, reducible; kwargs...)
dcollect(itr; kwargs...) = dcollect(induction(eduction(itr))...; kwargs...)
