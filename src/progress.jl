"""
    withprogress(foldable) -> foldable′

Wrap a foldable so that progress is shown in logging-based progress meter
(e.g., Juno) during [`foldl`](@ref), [`reduce`](@ref), [`dreduce`](@ref), etc.

For parallel reduction such as `reduce` and `dreduce`, reasonably small
`basesize` must be supplied to ensure that progress information is updated
frequently.  However, it may slow down the computation if `basesize` is too
small.

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

function __foldl__(rf0, init, coll::ProgressLoggingFoldable)
    @withprogress name = "foldl" begin
        n = length(coll.foldable)
        progress_interval = coll.interval
        scaninit = (0, time())
        xf = ScanEmit(scaninit) do (i, t0), x
            t1 = time()
            if t1 - t0 > progress_interval
                @logprogress i/n
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
        @withprogress name = "reduce" begin
            foreach(Scan(+), chan) do i
                @logprogress i/n
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
        @withprogress name = "dreduce" begin
            i = 0
            while true
                i += try
                    take!(chan)
                catch
                    return
                end
                @logprogress i/n
            end
            #=
            foreach(Scan(+), chan) do i
                @logprogress i/n
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
