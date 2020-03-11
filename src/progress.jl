"""
    withprogress(foldable) -> foldable′

Wrap a foldable so that progress is shown in logging-based progress meter
(e.g., Juno) during [`foldl`](@ref), [`reduce`](@ref), [`dreduce`](@ref), etc.

For parallel reduction such as `reduce` and `dreduce`, reasonably small
`basesize` and `threads_basesize` (for `dreduce`) must be used to ensure that
progress information is updated frequently.  However, it may slow down the
computation if `basesize` is too small.

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

In `foldl` and `reduce`, `withprogress` can be nested.  This is not supported
in `dreduce`.

```jldoctest; setup = :(using Transducers)
julia> xf = MapCat() do x
           withprogress(1:x; interval=1e-3)  # nested progress
       end |> Map() do x
           sleep(0.5)
           x
       end;

julia> if VERSION >= v"1.3-alpha"
           # Calling `sleep` in thread is safe in Julia 1.3:
           reduce(+, xf, withprogress(1:10; interval=1e-3); basesize=1)
       else
           foldl(+, xf, withprogress(1:10; interval=1e-3))
       end
220
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

# Use Juno/Atom-compatible log-level.  See:
# https://github.com/JunoLab/Atom.jl/blob/v0.11.1/src/progress.jl#L75-L76
const PROGRESSLEVEL = LogLevel(-1)

# Juno.progress
function __progress(f; name = "")
    _id = gensym()
    @logmsg PROGRESSLEVEL name progress=0.0 _id=_id
    try
        f(_id)
    finally
        @logmsg PROGRESSLEVEL name progress="done" _id=_id
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
                @logmsg PROGRESSLEVEL "foldl" _id=id progress=i/n
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
# TODO: `put!` on complete as well

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

function setup_logprogressoncombine(rf0, interval, chan)
    if rf0 isa R_{UseSIMD}
        xf0 = xform(rf0)
        rfinner = inner(rf0)
    else
        xf0 = IdentityTransducer()
        rfinner = rf0
    end

    xf = xf0 |> LogProgressOnCombine(chan, interval)
    rf = Reduction(xf, rfinner)
    return rf
end

function _reduce_progress(reduce_impl, rf0, init, coll)
    chan = Channel{Int}(0)
    rf = setup_logprogressoncombine(rf0, coll.reducible.interval, chan)
    reducible = @set coll.reducible = coll.reducible.foldable
    progress_task = @async let n = length(coll.reducible.foldable)
        __progress() do id
            foreach(Scan(+), chan) do i
                @logmsg PROGRESSLEVEL "reduce" _id=id progress=i/n
            end
        end
    end
    try
        result = reduce_impl(rf, init, reducible)
        result isa Reduced && return result
        # Manually unwrap LogProgressOnCombine's private state:
        _, iresult = unwrap(rf isa R_{UseSIMD} ? inner(rf) : rf, result)
        return iresult
    finally
        close(chan)
        wait(progress_task)
    end
end

_reduce(
    ctx,
    stoppable,
    task,
    rf,
    init,
    coll::SizedReducible{<:ProgressLoggingFoldable},
) =
    _reduce_progress(rf, init, coll) do rf, init, coll
        _reduce(ctx, stoppable, task, rf, init, coll)
    end

if VERSION >= v"1.2"
    _reduce_threads_for(rf, init, coll::SizedReducible{<:ProgressLoggingFoldable}) =
        _reduce_progress(_reduce_threads_for, rf, init, coll)
else
    # In earlier versions, Channel was not thread-safe (?)
    # https://github.com/JuliaLang/julia/pull/30186
    _reduce_threads_for(rf, init, coll::SizedReducible{<:ProgressLoggingFoldable}) =
        _reduce_threads_for(
            rf,
            init,
            (@set coll.reducible = coll.reducible.foldable),
        )
end

if VERSION < v"1.3-alpha"
    maybe_collect(coll::ProgressLoggingFoldable) =
        @set coll.foldable = maybe_collect(coll.foldable)
end

struct RemoteReduceWithLogging{C} <: Function
    chan::C
    progress_interval::Float64
end
# Manually create a closure to make it work nicely with Revise.jl:
# https://github.com/timholy/Revise.jl/pull/157

function (foldl::RemoteReduceWithLogging)(rf0, init, coll, basesize)
    chan = _Channel(eltype(foldl.chan), 0) do chan
        while true
            put!(foldl.chan, take!(chan))
        end
    end
    local rf
    result = try
        rf = setup_logprogressoncombine(rf0, foldl.progress_interval, chan)
        _transduce_assoc_nocomplete(rf, init, coll, basesize)
    finally
        close(chan)
    end
    result isa Reduced && return result
    # Manually unwrap LogProgressOnCombine's private state:
    (_t0, n), iresult = unwrap(rf isa R_{UseSIMD} ? inner(rf) : rf, result)
    if n > 0
        put!(foldl.chan, n)
    end
    return iresult
end

function dtransduce(
    xform::Transducer, step, init, coll::ProgressLoggingFoldable;
    kwargs...,
)
    chan = Distributed.RemoteChannel()
    remote_reduce_with_logging = RemoteReduceWithLogging(chan, coll.interval)
    progress_task = @async let n = length(coll.foldable)
        __progress() do id
            i = 0
            while true
                i += try
                    take!(chan)
                catch
                    return
                end
                @logmsg PROGRESSLEVEL "dreduce" _id=id progress=i/n
            end
            #=
            foreach(Scan(+), chan) do i
                @logmsg PROGRESSLEVEL "dreduce" _id=id progress=i/n
            end
            =#
        end
    end

    try
        return dtransduce(
            xform, step, init, coll.foldable;
            _remote_reduce = remote_reduce_with_logging,
            kwargs...,
        )
    finally
        close(chan)
        wait(progress_task)
    end
end
