aschannel(input::Channel, _) = input
function aschannel(input, size)
    if Base.IteratorEltype(input) isa Base.HasEltype
        T = eltype(input)
    else
        T = Any
    end
    return _Channel(T, size) do ch
        for x in input
            put!(ch, x)
        end
    end
end

maybe_popfirst!(input::AbstractChannel) =
    try
        Some(take!(input))
    catch err
        if isa(err, InvalidStateException) && err.state === :closed
            nothing
        else
            rethrow()
        end
    end

# This function assumes that `tasks` does not grow.
function _unsafe_sync_end(tasks)
    exceptions = []
    for t in tasks
        try
            wait(t)
        catch err
            push!(exceptions, err)
        end
    end
    if !isempty(exceptions)
        throw(CompositeException(exceptions))
    end
end

if VERSION < v"1.5-"
    const sync_end = Base.sync_end
else
    const sync_end = _unsafe_sync_end
end

function transduce_commutative!(
    xform::Transducer,
    step,
    init,
    input;
    simd::SIMDFlag = Val(false),
    ntasks::Integer = Threads.nthreads(),
    basesize::Integer = 1,
)
    @argcheck ntasks > 0
    @argcheck basesize > 0
    rf = reducingfunction(xform, step; simd = simd)
    stop = Threads.Atomic{Bool}(false)
    tasks = map(1:ntasks) do _
        @spawn try
            acc′ = start(rf, init)
            finished = false
            while !finished
                acc′, finished = let acc′′ = acc′
                    @spawn begin
                        acc = acc′′
                        for _ in 1:basesize
                            x = maybe_popfirst!(input)
                            x === nothing && return acc, true
                            acc = next(rf, acc, something(x))
                            if isreduced(acc)
                                stop[] = true
                                return acc, true
                            end
                        end
                        return acc, false
                    end
                end |> fetch
                finished |= stop[]
            end
            return acc′
        catch
            stop[] = true
            rethrow()
        end
    end
    sync_end(tasks)
    return foldl(combine_step(rf), Map(fetch), tasks)
end

reduce_commutative!(step, xform::Transducer, itr; init = DefaultInit, kwargs...) =
    unreduced(transduce_commutative!(xform, Completing(step), init, itr; kwargs...))

reduce_commutative(
    step,
    xform::Transducer,
    itr;
    ntasks::Integer = Threads.nthreads(),
    basesize::Integer = 1,
    kwargs...,
) = reduce_commutative!(
    step,
    xform,
    aschannel(itr, ntasks * basesize);
    ntasks = ntasks,
    basesize = basesize,
    kwargs...,
)

function _push!(output, x)
    push!(output, x)
    return output
end

_push!(output) = output  # complete
function combine(::typeof(_push!), a, b)
    @assert a === b
    return a
end

"""
    append_unordered!(output, xf, input; ntasks, basesize)
    append_unordered!(output, itr; ntasks, basesize)

Process `input` elements through a transducer `xf` and then `push!` them
into `output` in undefined order.

Binary method `append_unordered!(output, itr)` is like
`append!(output, itr)` but without order guarantee.  Iterator
comprehensions and [`eduction`](@ref)s can be passed as the input
`itr`.

`output` (typically a `Channel`) must implement thread-safe
`push!(output, x)` method.

See also [`channel_unordered`](@ref).

!!! compat "Transducers.jl 0.4.8"

    New in version 0.4.8.

!!! compat "Transducers.jl 0.4.9"

    Binary method `append_unordered!(output, itr)` requires Transducers.jl 0.4.9.

$_experimental_warning

# Examples
```jldoctest
julia> using Transducers: Map, append_unordered!

julia> input = Channel(Map(identity), 1:3);

julia> output = Channel{Int}(0);

julia> task = @async try
           append_unordered!(output, Map(x -> x + 1), input)
       finally
           close(output)
       end;

julia> sort!(collect(output))
3-element Array{Int64,1}:
 2
 3
 4

julia> input = Channel(Map(identity), 1:3);

julia> output = Channel{Int}(0);

julia> task = @async try
           append_unordered!(output, (y for x in input if isodd(x) for y in 1:x))
       finally
           close(output)
       end;

julia> sort!(collect(output))
4-element Array{Int64,1}:
 1
 1
 2
 3
```
"""
function append_unordered!(
    output,
    xf,
    input;
    ntasks::Integer = Threads.nthreads(),
    basesize::Integer = 1,
    kwargs...,
)
    transduce_commutative!(
        xf,
        _push!,
        output,
        aschannel(input, ntasks * basesize);
        ntasks = ntasks,
        basesize = basesize,
        kwargs...,
    )
    return output
end
# Strictly speaking, this invocation of `transduce_commutative!` does
# not make sense as `_push!` is not even a magma/groupoid (let alone a
# commutative monoid).  It should really be written as (roughly
# speaking)
#
#     xf′ = xf |> Map(x -> [x])
#     step(a, b) = foldl(_push!, b; init=a)
#     transduce_commutative!(xf′, step, input; init = channel)
#
# "Fusing" the `Map` and `step` yields the invocation of
# `transduce_commutative!` in `append_unordered!`.

append_unordered!(output, itr; kwargs...) =
    append_unordered!(output, extract_transducer(itr)...; kwargs...)

"""
    channel_unordered(xf, input; eltype, size, ntasks, basesize) :: Channel{eltype}
    channel_unordered(itr; eltype, size, ntasks, basesize) :: Channel{eltype}

Provide elements in `input` processed by a transducer `xf` through a
`Channel`.

Unary method `channel_unordered(itr)` produces a `Channel` that
provides elements in the input iterator `itr` with possibly different
order.  Iterator comprehensions and [`eduction`](@ref)s can be passed
as the input `itr`.

Use [`append_unordered!`](@ref) to send outputs to an existing channel.

!!! compat "Transducers.jl 0.4.8"

    New in version 0.4.8.

!!! compat "Transducers.jl 0.4.9"

    Unary method `channel_unordered(itr)` requires Transducers.jl 0.4.9.

$_experimental_warning

# Keyword Arguments
- `eltype::Type`: element type of returned channel
- `size`: The size of `Channel`. A non-negative `Int` or `Inf`.
- `ntasks::Int`: Number of concurrent tasks.  Default to
  `Threads.nthreads()`.
- `basesize`: The "batch size" of the processing; i.e., the number of
  elements to be processed in a single task.  Default to 1.

# Examples
```jldoctest
julia> using Transducers: Map, channel_unordered

julia> sort!(collect(channel_unordered(Map(x -> x + 1), 1:3)))
3-element Array{Any,1}:
 2
 3
 4

julia> sort!(collect(channel_unordered(x + 1 for x in 1:3 if isodd(x))))
2-element Array{Any,1}:
 2
 4
```
"""
channel_unordered(xf, input; eltype=Any, size=Inf, kwargs...) =
    _Channel(eltype, size) do output
        append_unordered!(output, xf, input; kwargs...)
        return
    end

channel_unordered(itr; kwargs...) =
    channel_unordered(extract_transducer(itr)...; kwargs...)
