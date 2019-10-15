"""
    withprogress(foldable) -> foldable′

Wrap a foldable so that progress is shown in logging-based progress meter
(e.g., Juno) during `foldl`.

# Keyword Arguments
- `interval::Real`: Minimum interval (in seconds) for how often progress is
  logged.

# Examples
```jldoctest
julia> using Transducers

julia> xf = Map() do x
           sleep(0.01)
           x
       end;

julia> foldl(+, xf, withprogress(1:100; interval=1e-3))  # see progress meter
5050
```
"""
withprogress(
    foldable;
    interval::Real = 0.1,
) = ProgressLoggingFoldable(
    foldable,
    convert(Float64, interval),
)

struct ProgressLoggingFoldable{T} <: Foldable
    foldable::T
    interval::Float64
end

# Juno.progress
function __progress(f; name = "")
    _id = gensym()
    @debug name progress=0.0 _id=_id
    try
        f(_id)
    finally
        @debug name progress="done" _id=_id
    end
end

function __foldl__(rf0, init, coll::ProgressLoggingFoldable)
    __progress() do id
        n = length(coll.foldable)
        progress_interval = coll.interval
        scaninit = (0, time())
        xf = ScanEmit(scaninit) do (i, t0), x
            t1 = time()
            if t1 - t0 > progress_interval
                @debug "foldl" _id=id progress=i/n
                t0 = t1
            end
            x, (i + 1, t0)
        end
        rf = Reduction(xf, rf0)
        val = wrap(rf, scaninit, init)  # manually `start`ing `ScanEmit`
        return Transducers.__foldl__(rf, val, coll.foldable)
    end
end

Base.eltype(::ProgressLoggingFoldable{T}) where {T} = eltype(T)

struct LogProgressOnCombine{C} <: Transducer
    chan::C
    progress_interval::Float64
end

# Recrod started time:
start(rf::R_{LogProgressOnCombine}, result) =
    wrap(rf, (time(), 0), start(inner(rf), result))

# Count processed number of items:
@inline next(rf::R_{LogProgressOnCombine}, result, input) =
    wrapping(rf, result) do (t0, n), iresult
        (t0, n + 1), next(inner(rf), iresult, input)
    end

@inline complete(rf::R_{LogProgressOnCombine}, result) =
    complete(inner(rf), unwrap(rf, result)[2])

# Send number of processed item to progress channel:
@inline function combine(rf::R_{LogProgressOnCombine}, a, b)
    (ta, na), ira = unwrap(rf, a)
    (tb, nb), irb = unwrap(rf, b)
    irc = combine(inner(rf), ira, irb)

    tc = time()
    t0 = min(ta, tb)
    nc = na + nb
    if tc - t0 > xform(rf).progress_interval
        put!(xform(rf).chan, nc)
        nc = 0
    else
        tc = t0
    end

    return wrap(rf, (tc, nc), irc)
end

function _reduce_progress(reduce_impl, rf0, init, coll)
    if rf0 isa R_{UseSIMD}
        xf0 = xform(rf0)
        rfinner = inner(rf0)
    else
        xf0 = IdentityTransducer()
        rfinner = rf0
    end

    chan = Channel{Int}(0)
    xf = xf0 |> LogProgressOnCombine(chan, coll.reducible.interval)
    rf = Reduction(xf, rfinner)

    reducible = @set coll.reducible = coll.reducible.foldable
    progress_task = @async let n = length(coll.reducible.foldable)
        __progress() do id
            foreach(Scan(+), chan) do i
                @debug "reduce" _id=id progress=i/n
            end
        end
    end
    try
        result = reduce_impl(rf, init, reducible)
        result isa Reduced && return result
        # Manually unwrap LogProgressOnCombine's private state:
        _, iresult = unwrap(rf, result)
        return iresult
    finally
        close(chan)
        wait(progress_task)
    end
end

_reduce(ctx, rf, init, coll::SizedReducible{<:ProgressLoggingFoldable}) =
    _reduce_progress(rf, init, coll) do rf, init, coll
        _reduce(ctx, rf, init, coll)
    end

_reduce_threads_for(rf, init, coll::SizedReducible{<:ProgressLoggingFoldable}) =
    _reduce_progress(_reduce_threads_for, rf, init, coll)

struct RemoteFoldlWithLogging{C} <: Function
    chan::C
    progress_interval::Float64
end
# Manually create a closure to make it work nicely with Revise.jl:
# https://github.com/timholy/Revise.jl/pull/157

function (foldl::RemoteFoldlWithLogging)(rf0, init, coll)
    xf = ScanEmit((0, time())) do (n, t0), x
        t1 = time()
        n += 1
        if t1 - t0 > foldl.progress_interval
            put!(foldl.chan, n)
            n = 0
        end
        x, (n, t1)
    end
    rf = Reduction(xf, rf0)
    acc = _start_init(rf, init)
    result = foldl_nocomplete(rf, acc, coll)
    result isa Reduced && return result
    _, iresult = unwrap(rf, result)  # manually unwrap ScanEmit's private state
    return iresult
end

function dtransduce(
    xform::Transducer, step, init, coll::ProgressLoggingFoldable;
    kwargs...,
)
    chan = Distributed.RemoteChannel()
    remote_foldl_with_logging = RemoteFoldlWithLogging(chan, coll.interval)
    progress_task = @async let n = length(coll.foldable)
        __progress() do id
            i = 0
            while true
                i += try
                    take!(chan)
                catch
                    return
                end
                @debug "dreduce" _id=id progress=i/n
            end
            #=
            foreach(Scan(+), chan) do i
                @debug "dreduce" _id=id progress=i/n
            end
            =#
        end
    end

    try
        return dtransduce(
            xform, step, init, coll.foldable;
            _remote_foldl = remote_foldl_with_logging,
            kwargs...,
        )
    finally
        close(chan)
        wait(progress_task)
    end
end
