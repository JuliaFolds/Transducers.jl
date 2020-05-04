"""
    dreduce(step, xform::Transducer, array; [init, simd, basesize, threads_basesize, pool])

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
- `threads_basesize::Integer = basesize ÷ nthreads()`: A size of chunk
  in `array` that is processed by each task in each worker process.
  The default setting assumes that the number of threads used in all
  workers are the same.  For heterogeneous setup where each worker
  process has different number of threads, it may be required to use
  smaller `threads_basesize` _and_ `basesize` to get a good performance.
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
    dtransduce(xform::Transducer, step, init, array; [simd, basesize, threads_basesize, pool])

See [`dreduce`](@ref) and [`transduce`](@ref).
"""
function dtransduce(
    xform::Transducer, step, init, coll;
    simd::SIMDFlag = Val(false),
    basesize::Integer = max(1, length(coll) ÷ Distributed.nworkers()),
    threads_basesize::Integer = max(1, basesize ÷ Threads.nthreads()),
    pool::Distributed.AbstractWorkerPool = Distributed.default_worker_pool(),
    _remote_reduce = _transduce_assoc_nocomplete,
)
    @argcheck basesize > 0
    isempty(coll) && return init
    load_me_everywhere()
    rf = _reducingfunction(xform, step; init = init, simd = simd)
    futures = map(firstindex(coll):basesize:lastindex(coll)) do start
        Distributed.remotecall(
            _remote_reduce,
            pool,
            rf,
            init,
            coll[start:min(end, start - 1 + basesize)],
            threads_basesize,
        )
    end
    # TODO: Cancel remote computation when there is a Reduced.
    results = map(fetch, futures)
    return complete(rf, combine_all(rf, results))
end

function load_me_everywhere()
    pkgid = Base.PkgId(@__MODULE__)
    @everywhere Base.require($pkgid)
end

"""
    dcopy(xf::Transducer, T, reducible; [basesize, threads_basesize]) :: Union{T, Empty{T}}
    dcopy(xf::Transducer, reducible::T; [basesize, threads_basesize]) :: Union{T, Empty{T}}
    dcopy([T,] itr; [basesize, threads_basesize]) :: Union{T, Empty{T}}

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
    xf, foldable = extract_transducer(itr)
    return dcopy(xf, T, foldable; kwargs...)
end

function dcopy(itr; kwargs...)
    xf, foldable = extract_transducer(itr)
    return dcopy(xf, foldable; kwargs...)
end

"""
    dcollect(xf::Transducer, reducible; [basesize, threads_basesize]) :: Union{Vector, Empty{Vector}}
    dcollect(itr; [basesize, threads_basesize]) :: Union{Vector, Empty{Vector}}

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
dcollect(itr; kwargs...) = dcollect(extract_transducer(itr)...; kwargs...)
