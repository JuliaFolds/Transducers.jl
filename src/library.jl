struct Map{F} <: Transducer
    f::F
end

outtype(xf::Map, intype) = Union{Base.return_types(xf.f, (intype,))...}
next(rf::R_{Map}, result, input) = next(rf.inner, result, rf.xform.f(input))

struct Replace{D} <: Transducer
    d::D  # dictionary-like object
end

outtype(xf::Replace, intype) = Union{intype, valtype(xf.d)}
next(rf::R_{Replace}, result, input) =
    next(rf.inner, result, get(rf.xform.d, input, input))

struct Cat <: Transducer
end

outtype(::Cat, intype) = ieltype(intype)
next(rf::R_{Cat}, result, input) = __foldl__(rf.inner, result, input)

const MapCat = Composition{<:Map, <:Cat}

MapCat(f) = Map(f) |> Cat()

struct Filter{P} <: AbstractFilter
    pred::P
end

next(rf::R_{Filter}, result, input) =
    rf.xform.pred(input) ? next(rf.inner, result, input) : result

struct Take <: AbstractFilter
    n::Int
end

start(rf::R_{Take}, result) = wrap(rf, rf.xform.n, result)

next(rf::R_{Take}, result, input) =
    wrapping(rf, result) do n, iresult
        if n > 0
            iresult = next(rf.inner, iresult, input)
            n -= 1
        end
        if n <= 0
            iresult = ensure_reduced(iresult)
        end
        return n, iresult
    end

struct TakeWhile{P} <: AbstractFilter
    pred::P
end

next(rf::R_{TakeWhile}, result, input) =
    rf.xform.pred(input) ? next(rf.inner, result, input) : ensure_reduced(result)

struct TakeNth <: AbstractFilter
    n::Int
end

start(rf::R_{TakeNth}, result) = wrap(rf, rf.xform.n, result)

next(rf::R_{TakeNth}, result, input) =
    wrapping(rf, result) do c, iresult
        if c == rf.xform.n
            iresult = next(rf.inner, iresult, input)
            c = 1
        else
            c += 1
        end
        return c, iresult
    end

struct Drop <: AbstractFilter
    n::Int
end

start(rf::R_{Drop}, result) = wrap(rf, 0, result)

next(rf::R_{Drop}, result, input) =
    wrapping(rf, result) do c, iresult
        if c >= rf.xform.n
            c, next(rf.inner, iresult, input)
        else
            c += 1
            c, iresult
        end
    end

struct DropLast <: AbstractFilter
    n::Int

    function DropLast(n)
        @assert n > 0
        return new(n)
    end
end

function start(rf::R_{DropLast}, result)
    n = rf.xform.n + 1
    return wrap(rf, (-n, Vector{InType(rf)}(undef, n)), result)
end

next(rf::R_{DropLast}, result, input) =
    wrapping(rf, result) do (c, buffer), iresult
        c += 1
        n = length(buffer)
        if c <= 0
            buffer[c + n] = input
            if c == 0
                (c, buffer), next(rf.inner, iresult, buffer[1])
            else
                (c, buffer), iresult
            end
        elseif c >= n
            buffer[c] = input
            (0, buffer), next(rf.inner, iresult, buffer[1])
        else
            buffer[c] = input
            (c, buffer), next(rf.inner, iresult, buffer[c + 1])
        end
    end

struct DropWhile{F} <: AbstractFilter
    pred::F
end

start(rf::R_{DropWhile}, result) = wrap(rf, true, result)

next(rf::R_{DropWhile}, result, input) =
    wrapping(rf, result) do dropping, iresult
        if dropping
            dropping = rf.xform.pred(input)
            dropping && return (dropping, iresult)
        end
        dropping, next(rf.inner, iresult, input)
    end

struct Window <: Transducer
    size::Int
    step::Int
    flush::Bool
end

Window(size, step; flush = false) = Window(size; step = step, flush = flush)
Window(size; step = size, flush = false) = Window(size, step, flush)

outtype(::Window, intype) = DenseSubVector{intype}

function start(rf::R_{Window}, result)
    buf = Vector{InType(rf)}()
    sizehint!(buf, rf.xform.size)
    return wrap(rf, (0, 0, buf), result)
end

function next(rf::R_{Window}, result, input)
    wrapping(rf, result) do (i, s, buf), iresult
        _window_next(rf, i, s, buf, iresult, input)
    end
end

function _window_next(rf, i, s, buf, iresult, input)
    i += 1
    @assert 1 <= i <= rf.xform.size
    len = length(buf)
    if s == 0 && len < rf.xform.size
        push!(buf, input)
        if i == rf.xform.size
            # This is the first time `length(buf) == rf.xform.size` is
            # true.
            iinput = (@view buf[1:end]) :: DenseSubVector
            # Do not use `@view buf[:]` to make the indices
            # `UnitRange` instead of `OneTo`.
            @assert i == rf.xform.size
            i = 0
            s = rf.xform.step
            iresult = next(rf.inner, iresult, iinput)
            # Throw away buf[1] which is just consumed by the downstream:
            deleteat!(buf, 1)
        end
        return (i, s, buf), iresult
    elseif len < 2 * rf.xform.size - 1
        push!(buf, input)
    else
        # TODO: optimize for size < step case
        buf[i + rf.xform.size - 1] = input
    end
    if i == rf.xform.size
        # Wrapping the window.  Next window will be i=1.
        # Copy tail to head.
        copyto!(buf,
                1,                  # destination offset
                buf,
                rf.xform.size + 1,  # source offset
                rf.xform.size - 1)  # size
    end
    s -= 1
    @assert 0 <= s < rf.xform.step
    if s == 0
        s = rf.xform.step
        iinput = @view buf[i:i + rf.xform.size - 1] # unsafe_view? @inbounds?
        iinput :: DenseSubVector
        iresult = next(rf.inner, iresult, iinput)
    end
    if i == rf.xform.size
        i = 0
    end
    return (i, s, buf), iresult
end

function complete(rf::R_{Window}, result)
    (i, s, buf), iresult = unwrap(rf, result)
    if rf.xform.flush && s != rf.xform.step
        iinput = @view buf[i:i + rf.xform.size - 1] # unsafe_view? @inbounds?
        iinput = @view iinput[s + 1:end]
        iinput :: DenseSubVector
        iresult = next(rf.inner, iresult, iinput)
    end
    return complete(rf.inner, iresult)
end

# TODO: implement SVector version of Window

struct PartitionBy{F} <: Transducer
    f::F
end

struct Unseen end

outtype(::PartitionBy, intype) = Vector{intype}

function start(rf::R_{PartitionBy}, result)
    iinput = InType(rf)[]
    return wrap(rf, (iinput, Unseen()), start(rf.inner, result))
end

function next(rf::R_{PartitionBy}, result, input)
    wrapping(rf, result) do (iinput, pval), iresult
        val = rf.xform.f(input)
        if pval isa Unseen || val == pval
            push!(iinput, input)
        else
            iresult = next(rf.inner, iresult, iinput)
            empty!(iinput)
            isreduced(iresult) || push!(iinput, input)
        end
        return (iinput, val), iresult
    end
end

function complete(rf::R_{PartitionBy}, ps)
    (iinput, _), iresult = unwrap(rf, ps)
    if !isempty(iinput)
        iresult = next(rf.inner, iresult, iinput)
    end
    return complete(rf.inner, iresult)
end

struct Keep{F} <: Transducer
    f::F
end

outtype(xf::Keep, intype) =
    Core.Compiler.typesubtract(Union{Base.return_types(xf.f, (intype,))...},
                               Nothing)

function next(rf::R_{Keep}, result, input)
    iinput = rf.xform.f(input)
    return iinput === nothing ? result : next(rf.inner, result, iinput)
end

struct Distinct <: AbstractFilter
end

function start(rf::R_{Distinct}, result)
    seen = Set(InType(rf)[])
    return wrap(rf, seen, start(rf.inner, result))
end

function next(rf::R_{Distinct}, result, input)
    wrapping(rf, result) do seen, iresult
        if input in seen
            return seen, iresult
        else
            push!(seen, input)
            return seen, next(rf.inner, iresult, input)
        end
    end
end

struct Interpose{T} <: Transducer
    sep::T
end

outtype(xf::Interpose, intype) = Union{typeof(xf.sep), intype}

start(rf::R_{Interpose}, result) = wrap(rf, Val(true), start(rf.inner, result))

next(rf::R_{Interpose}, result, input) =
    wrapping(rf, result) do isfirst, iresult
        if isfirst isa Val{false}
            iresult = next(rf.inner, iresult, rf.xform.sep)
        end
        return Val(false), next(rf.inner, iresult, input)
    end

struct Dedupe <: AbstractFilter
end

start(rf::R_{Dedupe}, result) = wrap(rf, Unseen(), start(rf.inner, result))

next(rf::R_{Dedupe}, result, input) =
    wrapping(rf, result) do prev, iresult
        if prev isa Unseen || prev != input
            return input, next(rf.inner, iresult, input)
        else
            return input, iresult
        end
    end

struct Scan{F, T} <: Transducer
    f::F
    init::T
end

Scan(f) = Scan(f, nothing)

_lefttype(xf::Scan{<:Any, Nothing}, intype) = typeof(identityof(xf.f, intype))
_lefttype(xf::Scan{<:Any, T}, _) where {T} = T

outtype(xf::Scan, intype) =
    Union{Base.return_types(xf.f, (_lefttype(xf, intype), intype))...}

function start(rf::R_{Scan}, result)
    if rf.xform.init === nothing
        init = identityof(rf.xform.f, InType(rf))
    else
        init = rf.xform.init :: InType(rf)
    end
    return wrap(rf, init, start(rf.inner, result))
end

function next(rf::R_{Scan}, result, input)
    wrapping(rf, result) do acc, iresult
        acc = rf.xform.f(acc, input)
        return acc, next(rf.inner, iresult, acc)
    end
end

"""
    TeeZip(xform::Transducer)

Branch input into two "flows", inject one into `xform` and then merge
the output of `xform` with the original input.

To illustrate how it works, consider the following usage

```
xf0 |> TeeZip(xf1) |> xf2
```

where `xf0`, `xf1`, and `xf2` are some transducers.  Schematically,
the output `yn` from `xfn` flows as follows:

```text
xf0      xf1                       xf2
---- y0 ------ y1 ---.-- (y0, y1) ----->
      |              |
       `-------------'
    "Tee"          "Zip"
```
"""
struct TeeZip{T} <: Transducer
    xform::T
end
# The idea is to insert an object `Joiner` to the bottom of
# `Reduction` dynamically which calls to the rest of inner reductions
# after the value is zipped (joined).

struct Joiner{F, T}  # Note: not a Transducer
    inner::F  # original inner reduction
    value::T  # original input

    Joiner(inner::F, value::T) where {F,T} = new{F,T}(inner, value)
    Joiner{F,T}(inner) where {F,T} = new{F,T}(inner)
end

next(rf::Joiner, result, input) = next(rf.inner, result, (rf.value, input))
complete(rf::Joiner, result) = complete(rf.inner, result)

outtype(xf::TeeZip, intype) = Tuple{intype, outtype(xf.xform, intype)}

@inline rejoin(rf::R_{TeeZip},
               f = Joiner{typeof(rf.inner), InType(rf)}(rf.inner)) =
    Reduction(rf.xform.xform, f, InType(rf))

start(rf::R_{TeeZip}, result) = start(rejoin(rf), result)
next(rf::R_{TeeZip}, result, input) =
    next(rejoin(rf, Joiner(rf.inner, input)), result, input)
complete(rf::R_{TeeZip}, result) = complete(rejoin(rf), result)

# add joint
Base.adjoint(xf::Transducer) = TeeZip(xf)


struct GetIndex{inbounds, A} <: Transducer
    array::A
end

GetIndex{inbounds}(array::A) where {inbounds, A} = GetIndex{inbounds, A}(array)
GetIndex(array) = GetIndex{false}(array)

outtype(xf::GetIndex, ::Type{<:Integer}) = eltype(xf.array)
outtype(::GetIndex, T) =
    error("Unexpected non-integer input type for GetIndex:\n", T)

next(rf::R_{GetIndex{true}}, result, input) =
    next(rf.inner, result, @inbounds rf.xform.array[input])
next(rf::R_{GetIndex{false}}, result, input) =
    next(rf.inner, result, rf.xform.array[input])

struct SetIndex{inbounds, A} <: Transducer
    array::A
end

SetIndex{inbounds}(array::A) where {inbounds, A} = SetIndex{inbounds, A}(array)
SetIndex(array) = SetIndex{false}(array)

outtype(xf::SetIndex, ::Type{<:Integer}) = eltype(xf.array)
outtype(::SetIndex, T) =
    error("Unexpected non-integer input type for SetIndex:\n", T)

next(rf::R_{SetIndex{true}}, result, input::NTuple{2, Any}) =
    next(rf.inner, result, (@inbounds rf.xform.array[input[1]] = input[2];))
next(rf::R_{SetIndex{false}}, result, input::NTuple{2, Any}) =
    next(rf.inner, result, (rf.xform.array[input[1]] = input[2];))
# Index is `input[1]` due to `TeeZip`'s definition.  Is it better to
# flip, to be compatible with `Base.setindex!`?
