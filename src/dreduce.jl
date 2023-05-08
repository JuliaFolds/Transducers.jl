"""
    foldxd(step, xform::Transducer, array; [init, simd, basesize, threads_basesize, pool])

e**X**tended **d**istributed fold (reduce).  This is a distributed
`reduce` based on extended fold protocol defined in Transducers.jl.

Unlike [`foldxt`](@ref), early termination by [`reduced`](@ref) is not
supported yet.

Use [`dcollect`](@ref) or [`dcopy`](@ref) to collect results into a
container.

See also: [Parallel processing tutorial](@ref tutorial-parallel),
[`foldxl`](@ref), [`foldxt`](@ref).

!!! compat "Transducers.jl 0.4.3"

    New in version 0.4.3.

# Keyword Arguments
$_DISTRIBUTED_EX_OPTS_DOCS
- For other keyword arguments, see [`foldl`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> foldxd(+, 1:3 |> Map(exp) |> Map(log))
6.0

julia> 1:5 |> Filter(isodd) |> foldxd(+)
9

julia> foldxd(TeeRF(min, max), [5, 2, 6, 8, 3])
(2, 8)
```
"""
foldxd
foldxd(rf; kw...) = itr -> foldxd(rf, itr; kw...)
foldxd(step, xform::Transducer, itr; init = DefaultInit, kwargs...) =
    unreduced(dtransduce(xform, Completing(step), init, itr; kwargs...))
foldxd(step::F, foldable; kwargs...) where {F} =
    foldxd(step, extract_transducer(foldable)...; kwargs...)

"""
    dtransduce(xform::Transducer, step, init, array; [simd, basesize, threads_basesize, pool])

See [`foldxd`](@ref) and [`transduce`](@ref).
"""
function dtransduce(
    xform::Transducer,
    step,
    init,
    coll0;
    simd::SIMDFlag = Val(false),
    basesize::Union{Integer,Nothing} = nothing,
    threads_basesize::Union{Integer,Nothing} = nothing,
    pool::Distributed.AbstractWorkerPool = Distributed.default_worker_pool(),
    _remote_reduce = _transduce_assoc_nocomplete,
)
    rf0 = _reducingfunction(xform, step; init = init)
    rf1, coll = retransform(rf0, coll0)
    rf = maybe_usesimd(rf1, simd)
    isempty(coll) && return check_empty(rf, complete(rf, start(rf, init)))
    load_me_everywhere()
    basesize = if basesize === nothing
        max(1, amount(coll) ÷ Distributed.nworkers())
    else
        Int(basesize)
    end
    threads_basesize = if threads_basesize === nothing
        max(1, basesize ÷ Threads.nthreads())
    else
        Int(threads_basesize)
    end
    @argcheck basesize > 0
    @argcheck threads_basesize > 0
    chunks = split_into_chunks(coll, basesize)
    futures = map(chunks) do chunk
        Distributed.remotecall(
            _remote_reduce,
            pool,
            rf,
            init,
            chunk,
            threads_basesize,
        )
    end
    # TODO: Cancel remote computation when there is a Reduced.
    result = Distributed.remotecall_fetch(pool, futures) do futures
        results = map(fetch, futures)
        return complete(rf, combine_all(rf, results))
        # TODO: call combine asynchronously
    end
    return check_empty(rf, result)
end
# Note: Calling combine on remote is useful not only for computation
# off-loading but also for making it actually work. If `rf` contains any
# stateful transducers that use any anonymous functions defined in `Main`,
# `unwrap` will detect that the private states as incompatible. So, we need to
# use `rf` that is deserialized by Distributed, when combining and completing
# the stateful reductions.

function load_me_everywhere()
    pkgid = Base.PkgId(@__MODULE__)
    @everywhere Base.require($pkgid)
end

"""
    dcopy(xf::Transducer, T, reducible; [basesize, threads_basesize]) :: Union{T, Empty{T}}
    dcopy(xf::Transducer, reducible::T; [basesize, threads_basesize]) :: Union{T, Empty{T}}
    dcopy([T,] itr; [basesize, threads_basesize]) :: Union{T, Empty{T}}

Distributed.jl-based parallel version of [`copy`](@ref).  Keyword
arguments are passed to [`foldxd`](@ref).  For examples, see
[`tcopy`](@ref).

See also: [Parallel processing tutorial](@ref tutorial-parallel)
(especially [Example: parallel `collect`](@ref tutorial-parallel-collect)).

!!! compat "Transducers.jl 0.4.5"

    New in version 0.4.5.

!!! compat "Transducers.jl 0.4.8"

    `dcopy` now accepts iterator comprehensions and eductions.
"""
dcopy(xf, T, reducible; kwargs...) =
    foldxd(append!!, Map(SingletonVector) ∘ xf, reducible; init = Empty(T), kwargs...)
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
