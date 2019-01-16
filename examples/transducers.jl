# # How to write transducers
#
# `Transducers` don't export public interface for implementing
# transducers (and reducible collections).  Let's import some handy
# ones:

using Transducers
using Transducers: Transducer, R_, next, inner, xform

# ## Stateless transducer

# Let's write manually what `Filter(x -> x isa Int) |> Map(x -> x +
# 1)` would do:

struct AddOneIfInt <: Transducer end

function Transducers.next(rf::R_{AddOneIfInt}, result, input)
    if input isa Int
# Output `input + 1` is passed to the "inner" reducing step:
        next(inner(rf), result, input + 1)
    else
# Filtering out is done by "doing nothing"; return `result`-so-far
# as-is:
        result
    end
end

# Ineed, for integer collection, it increments input by one:

addone_out1 = begin  # hide
collect(AddOneIfInt(), 1:5)
end  # hide

# Non integer elements are filtered out:

collect(AddOneIfInt(), Any[3, nothing, 2.0, missing, 5])

# Notice that output `eltype` is `Any`; it can be fixed by defining
# `outtype`:

Transducers.outtype(::AddOneIfInt, _intype) = Int

addone_out2 = begin  # hide
collect(AddOneIfInt(), 1:5)
end  # hide

# ## Stateful transducer
#
# `AddOneIfInt` is a stateless transducer which is very easy to
# implement.  A stateful transducer needs a bit more code.

using Transducers: start, complete, InType, wrap, unwrap, wrapping
using Random

# Let's define a transducer that spits out a random past element from
# the buffer:

struct RandomRecall <: Transducer
    history::Int
    seed::Int
end
RandomRecall() = RandomRecall(3, 0)
nothing  # hide

# A stateful transducer needs to implement [`Transducers.start`](@ref)
# to "allocate" its private state.  Here, the private state is a
# `buffer` and a random number generator state `rng`:

function Transducers.start(rf::R_{RandomRecall}, result)
    buffer = InType(rf)[]
    rng = MersenneTwister(xform(rf).seed)
    private_state = (buffer, rng)
    return wrap(rf, private_state, start(inner(rf), result))
end

# Stateful transducer needs to unwrap its private state inside
# [`Transducers.next`](@ref) and then re-wrap it.  There is a helper
# function [`Transducers.wrapping`](@ref) does that with the `do`
# block:

function Transducers.next(rf::R_{RandomRecall}, result, input)
    wrapping(rf, result) do (buffer, rng), iresult
# Pickup a random element to be passed to the inner reducing function.
# Replace it with the new incoming one in the buffer:
        if length(buffer) < xform(rf).history
            push!(buffer, input)
            iinput = rand(rng, buffer)
        else
            i = rand(rng, 1:length(buffer))
            iinput = buffer[i]
            buffer[i] = input
        end
# Call the inner reducing function.  Note that `iresult` unwrapped by
# [`Transducers.wrapping`](@ref) must be passed to `next`:
        iresult = next(inner(rf), iresult, iinput)
        return (buffer, rng), iresult
    end
end

Transducers.outtype(::RandomRecall, intype) = intype

# Indeed, it picks up some random elements from the past elements:

recall_out1 = begin  # hide
collect(RandomRecall(), 1:5)
end  # hide

# With slightly more complex transducer:

collect(Filter(isodd) |> RandomRecall() |> Filter(x -> x > 10) |> Take(5), 1:100)

# Another overloadable API is [`Transducers.complete`](@ref).  It is
# invoked at the end of each transducible process.  It is useful for,
# e.g., flushing buffer.

function Transducers.complete(rf::R_{RandomRecall}, result)
    (buffer, _), iresult = unwrap(rf, result)
    for x in buffer
# Note that inner `next` can be called more than one time inside
# `next` and `complete`:
        iresult = next(inner(rf), iresult, x)
    end
# `complete` for inner reducing function must be called exactly once:
    return complete(inner(rf), iresult)
end

# This then adds 3 (`= RandomRecall().history`) more elements to the
# output:

recall_out2 = begin  # hide
collect(RandomRecall(), 1:5)
end  # hide
