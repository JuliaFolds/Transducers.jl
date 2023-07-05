"""
    Consecutive(size, step = size)
    Consecutive(size; step = size)

Sliding window of width `size` and interval `step`. Yield tuples.

This transducer is like [`Partition`](@ref) but feeds tuples to the
downstream transducers instead of vectors.

If `step == 1`, this transducer supports parallel reduction for any
collections; i.e., `Consecutive(size, 1)'(op)` is associative if
`op` is associative.

!!! warning
    Currently, in parallel folds, `Consecutive(size, 1)` cannot be
    used with reducing functions that can produce a `Reduced`.

If `step > 1`, this transducer can, in principle, support parallel reduction
if the input collection allows random access (e.g., arrays). However, this
feature is not implemented yet.

# Examples
```jldoctest
julia> using Transducers

julia> 1:8 |> Consecutive(3) |> collect
2-element Vector{Tuple{Int64, Int64, Int64}}:
 (1, 2, 3)
 (4, 5, 6)

julia> 1:8 |> Consecutive(3; step = 1) |> collect
6-element Vector{Tuple{Int64, Int64, Int64}}:
 (1, 2, 3)
 (2, 3, 4)
 (3, 4, 5)
 (4, 5, 6)
 (5, 6, 7)
 (6, 7, 8)
```
"""
struct Consecutive{Size<:Val,Step<:Val} <: Transducer
    size::Size
    step::Step

    function Consecutive(size::Val, step::Val)
        @argcheck valueof(size) isa Integer
        @argcheck valueof(step) isa Integer
        @argcheck valueof(size) > 0
        @argcheck valueof(step) > 0
        size′ = mapvalue(Int, size)
        step′ = mapvalue(Int, step)
        return new{typeof(size′),typeof(step′)}(size′, step′)
    end
end

Consecutive(size, step) =
    Consecutive(asval(size), asval(step))
Consecutive(size; step = asval(size)) = Consecutive(size, step)

#=
eduction(
    ::Consecutive{Size,Val{step}},
    xs::AbstractArray,
) where {Size<:Val,step} = (
    ntuple(i -> (@inbounds xs[i]), Size) for
    i in firstindex(xs):step:lastindex(xs)-valueof(Size)  # ???
)
=#

mapvalue(f, ::Val{x}) where {x} = Val(f(x))
valueof(::Val{x}) where {x} = x

asval(x::Val) = x
asval(x) = Val(x)

# Special-casing step=1 case for supporting parallel reduction:
const SingleStepConsecutive{Size<:Val} = Consecutive{Size,Val{1}}

function start(rf::R_{SingleStepConsecutive}, acc)
    left = () # first `size-1` items of _this chunk_ saved for `combine`
    buf = () # immediate last `size-1` items for output
    return wrap(rf, (left, buf), start(inner(rf), acc))
end

next(rf::R_{SingleStepConsecutive}, acc, input) =
    wrapping(rf, acc) do (left, buf0), iacc
        output = (buf0..., input)
        if length(output) === valueof(xform(rf).size)
            ((left, tail(output)), next(inner(rf), iacc, output))
        else
            ((output, output), iacc)
        end
    end

function complete(rf::R_{SingleStepConsecutive}, acc)
    (_left, buf), iacc = unwrap(rf, acc)
    return complete(inner(rf), iacc)
end

function combine(rf::R_{SingleStepConsecutive}, a, b)
    (_, bufa), _ = unwrap(rf, a)
    (leftb, bufb), irb = unwrap(rf, b)
    (lefta, _), ira = unwrap(rf, @return_if_reduced foldlargs(rf, a, leftb...))
    irc = combine(inner(rf), ira, irb)
    bufc = lastitems((bufa..., bufb...), Val(valueof(xform(rf).size) - 1))
    return wrap(rf, (lefta, bufc), irc)
end

lastitems(xs::NTuple{N,Any}, ::Val{M}) where {N,M} =
    N >= M ? ntuple(i -> xs[N-M+i], Val(M)) : xs

start(rf::R_{Consecutive}, acc) =
    wrap(rf, ((), 0), start(inner(rf), acc))

next(rf::R_{Consecutive}, acc, input) =
    wrapping(rf, acc) do (buf0, c), iacc
        output = (buf0..., input)
        if length(output) === valueof(xform(rf).size)
            if c == 0
                ((tail(output), valueof(xform(rf).step) - 1), next(inner(rf), iacc, output))
            else
                ((tail(output), c - 1), iacc)
            end
        else
            ((output, 0), iacc)
        end
    end

function complete(rf::R_{Consecutive}, acc)
    _, iacc = unwrap(rf, acc)
    return complete(inner(rf), iacc)
end
