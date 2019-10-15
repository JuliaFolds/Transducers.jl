"""
    withprogress(foldable) -> foldable′

Wrap a foldable so that progress is shown in logging-based progress meter
(e.g., Juno) during `foldl`.

# Examples
```jldoctest
julia> using Transducers

julia> xf = Map() do x
           sleep(0.01)
           x
       end;

julia> foldl(+, xf, withprogress(1:100))  # see progress meter
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

function Transducers.__foldl__(rf0, val0, coll::ProgressLoggingFoldable)
    __progress() do id
        n = length(coll.foldable)
        xf = Enumerate() |> Map() do (i, x)
            @debug "foldl" _id=id progress=i/n
            x
        end
        rf = Reduction(xf, rf0)
        val = wrap(rf, 1, val0)  # manually `start`ing `Enumerate`
        return Transducers.__foldl__(rf, val, coll.foldable)
    end
end

Base.eltype(::ProgressLoggingFoldable{T}) where {T} = eltype(T)

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
