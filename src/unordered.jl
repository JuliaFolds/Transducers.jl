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

function transduce_commutative(
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
        @spawn begin
            acc′ = _start_init(rf, init)
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
        end
    end
    return foldl(combine_step(rf), Map(fetch), tasks)
end

#=
reduce_commutative(step, xform::Transducer, itr; kwargs...) =
    unreduced(transduce_commutative(xform, Completing(step), itr; kwargs...))
=#

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

Process `input` elements through a transducer `xf` and then `push!` them
into `output` in undefined order.

See also [`channel_unordered`](@ref).

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
```
"""
function append_unordered!(output, xf, input; kwargs...)
    transduce_commutative(xf, _push!, output, input; kwargs...)
    return output
end
# Strictly speaking, this invocation of `transduce_commutative` does
# not make sense as `_push!` is not even a magma/groupoid (let alone a
# commutative monoid).  It should really be written as (roughly
# speaking)
#
#     xf′ = xf |> Map(x -> [x])
#     step(a, b) = foldl(_push!, b; init=a)
#     transduce_commutative(xf′, step, input; init = channel)
#
# "Fusing" the `Map` and `step` yields the invocation of
# `transduce_commutative` in `append_unordered!`.

"""
    channel_unordered(xf, input; eltype, size, ntasks, basesize) :: Channel{eltype}

Provide elements in `input` processed by a transducer `xf` through a
`Channel`.

Use [`append_unordered!`](@ref) to send outputs to an existing channel.

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

julia> input = Channel(Map(identity), 1:3);

julia> sort!(collect(channel_unordered(Map(x -> x + 1), input)))
3-element Array{Any,1}:
 2
 3
 4
```
"""
channel_unordered(xf, input; eltype=Any, size=Inf, kwargs...) =
    _Channel(eltype, size) do output
        append_unordered!(output, xf, input; kwargs...)
        return
    end
