"""
    NondeterministicThreading(; basesize, ntasks = nthreads())

Parallelize inner reducing function using `ntasks`.

Given

```julia
#                   ,-- Not parallelized
#            ______/__
  foldxl(rf, xs |> xfo |> NondeterministicThreading() |> xfi)
#        ==                                              ===
#        Parallelized                                    Parallelized
```

the inner transducer `xfi` and the reducing function `rf` are
parallelized but the outer transducer `xfo` and the iteration over
data collection `xs` are not parallelized.

The scheduling of the tasks (hence the call tree of the inner reducing
function) is non-deterministic.  It means that the result is
deterministic only if the inner reducing function is exactly
associative.  If the inner reducing function is only approximately
associative (e.g., addition of floating point numbers), the result of
reduction is likely different for each time.

The outer transducers and `iterate` are processed sequentially.  In
particular, the data collection does not have to implement
`SplittablesBase.halve`.

!!! note
    Currently, the default `basesize` is 1.  However, it may be
    changed in the future (e.g. it may be automatically tuned at
    run-time).

!!! note
    `NondeterministicThreading` does not work with Julia < 1.3.

# Keyword Arguments
- `basesize::Integer`: The number of input elements to be accumulated
  in a buffer before sent to a task.
- `ntasks::Integer`: The number of tasks `@spawn`ed.  The default
  value is `Threads.nthreads()`.  A number larger than
  `Threads.nthreads()` may be useful if the inner reducing function
  contains I/O and does not consume too much resource (e.g., memory).

# Examples
```jldoctest
julia> using Transducers

julia> collect(1:4 |> Filter(isodd))
2-element Vector{Int64}:
 1
 3

julia> collect(1:4 |> NondeterministicThreading() |> Filter(isodd))
2-element Vector{Int64}:
 1
 3
```
"""
struct NondeterministicThreading <: Transducer
    basesize::Int
    ntasks::Int
end

NondeterministicThreading(; basesize = 1, ntasks = Threads.nthreads()) =
    NondeterministicThreading(basesize, ntasks)

function start(rf::R_{NondeterministicThreading}, init)
    buffer = UndefVector(xform(rf).basesize)
    n = xform(rf).basesize - 1
    ntasks = xform(rf).ntasks
    irf = inner(rf)
    taskref = Ref{Task}()
    err_promise = Promise()
    ichan = Channel(0; taskref = taskref) do ichan
        async_foreach(1:ntasks) do _
            sync_spawn_foreach(ichan) do (lbridge, buffer, rbridge)
                try
                    acc = foldl_basecase(irf, start(irf, init), buffer)
                    while true
                        x = tryfetch(lbridge::Union{Nothing,Promise})
                        x isa Some{<:Ok} || break
                        lacc, lbridge = something(x).value
                        acc = combine_reduced(irf, lacc, acc)
                    end
                    while true
                        x = tryfetch(rbridge::Promise)
                        x isa Some{<:Ok} || break
                        racc, rbridge = something(x).value
                        acc = combine_reduced(irf, acc, racc)
                    end
                    while true
                        if lbridge isa Promise && isodd(time_ns())
                            x = tryput!(lbridge::Promise, Ok((acc, rbridge)))
                            x isa Some{<:Ok} || break
                            lacc, lbridge = something(x).value
                            acc = combine_reduced(irf, lacc, acc)
                        else
                            x = tryput!(rbridge::Promise, Ok((acc, lbridge)))
                            x isa Some{<:Ok} || break
                            racc, rbridge = something(x).value
                            acc = combine_reduced(irf, acc, racc)
                        end
                    end
                catch err
                    @debug(
                        "start(::R_{NondeterministicThreading}, _)",
                        exception = (err, catch_backtrace())
                    )
                    tryput!(err_promise, err)
                    close(ichan)
                    rethrow()
                end
            end
        end
    end
    return (n, buffer, nothing, ichan, taskref[], init, err_promise)
end

function next(
    rf::R_{NondeterministicThreading},
    (n, buffer, lbridge, ichan, task, init, err_promise),
    x,
)
    buffer = setindex!!(buffer, x, length(buffer) - n)
    if n == 0
        rbridge = Promise()
        try
            put!(ichan, (lbridge, buffer, rbridge))
        catch err
            if err isa InvalidStateException
                istaskdone(task) && fetch(task)  # let it throw
                let x = tryfetch(err_promise)
                    x === nothing || throw(something(x))
                end
            end
            rethrow()
        end
        lbridge = rbridge
        buffer = typeof(buffer)(undef, xform(rf).basesize)
        n = xform(rf).basesize - 1
    else
        n -= 1
    end
    return (n, buffer, lbridge, ichan, task, init, err_promise)
end

function complete(
    rf::R_{NondeterministicThreading},
    (n, buffer, lbridge, ichan, task, init, err_promise),
)
    if !(buffer isa UndefVector)
        ilast = length(buffer) - n - 1
        if ilast > 0
            resize!(buffer, ilast)
            rbridge = Promise()
            put!(ichan, (lbridge, buffer, rbridge))
            lbridge = rbridge
        end
    end
    close(ichan)
    if lbridge === nothing
        acc = start(inner(rf), init)
    else
        # Two tasks below share `lbridge`
        local errtask
        @sync begin
            errtask = @async begin
                local err = fetch(err_promise)
                err === nothing && return
                # Chase `lbridge` and propagate the error in the other
                # task below:
                while lbridge isa Promise
                    local x = tryput!(lbridge, Err(err))
                    x isa Some{<:Ok} || break
                    _, lbridge = something(x).value
                end
                Err(err)
            end
            acc = fetch(@async begin
                local acc
                local x = fetch(lbridge)
                x isa Ok || return
                acc, lbridge = x.value
                while lbridge isa Promise
                    local lacc
                    x = fetch(lbridge)
                    x isa Ok || return
                    lacc, lbridge = x.value
                    acc = combine_reduced(inner(rf), lacc, acc)
                end
                tryput!(err_promise, nothing)  # cancel `errtask`
                return acc
            end)
        end
        let x = fetch(errtask)
            x isa Err && throw(x.value)
        end
    end
    wait(task)
    return complete(inner(rf), acc)
end
