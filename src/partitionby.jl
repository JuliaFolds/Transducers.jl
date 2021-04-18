"""
    ReducePartitionBy(f, rf, [init])

Reduce partitions determined by `isequal` on the output value of `f` with an
associative reducing function `rf`. Partitions are reduced on-the-fly and no
intermediate arrays are allocated.

# Examples

Consider the input `1:6` "keyed" by a function `x -> x ÷ 3`:

```jldoctest
julia> map(x -> x ÷ 3, 1:6)
6-element Vector{Int64}:
 0
 0
 1
 1
 1
 2
```

i.e., there are three partitions with the key values `0`, `1`, and `2`. We
can use `ReducePartitionBy` to compute, e.g., the length and the sum of each
partition by:

```jldoctest
julia> using Transducers

julia> 1:6 |> ReducePartitionBy(x -> x ÷ 3, Map(_ -> 1)'(+)) |> collect
3-element Vector{Int64}:
 2
 3
 1

julia> 1:6 |> ReducePartitionBy(x -> x ÷ 3, +) |> collect
3-element Vector{Int64}:
  3
 12
  6
```
"""
struct ReducePartitionBy{F,RF,Init} <: Transducer
    f::F
    rf::RF
    init::Init
end
ReducePartitionBy(f, rf) = ReducePartitionBy(f, rf, Init)

struct PartitionChunk{K,V}
    kr::K
    right::V
end

struct PartitionVacant{KL, KR, Left, Right}
    kl::KL
    kr::KR
    left::Left
    right::Right
end

is_prelude(::PartitionChunk) = true

start(rf::R_{ReducePartitionBy}, acc) = wrap(rf, Unseen(), start(inner(rf), acc))

next(rf::R_{ReducePartitionBy}, acc, input) =
    wrapping(rf, acc) do state, iacc
        k = xform(rf).f(input)
        if state isa Unseen
            init = start(xform(rf).rf, xform(rf).init)
            (PartitionChunk(k, next(xform(rf).rf, init, input)), iacc)
        else
            if isequal(k, state.kr)
                acc0 = next(xform(rf).rf, state.right, input)
                ((@set state.right = acc0), iacc)
            else
                if state isa PartitionVacant
                    y = complete(xform(rf).rf, state.right)
                    iacc′ = next(inner(rf), iacc, y)
                    left = state.left
                    kl = state.kl
                else
                    iacc′ = iacc
                    left = state.right
                    kl = state.kr
                end
                init = start(xform(rf).rf, xform(rf).init)
                right = next(xform(rf).rf, init, input)
                (PartitionVacant(kl, k, left, right), iacc′)
            end
        end
    end

function complete(rf::R_{ReducePartitionBy}, acc)
    state, iacc1 = unwrap(rf, acc)
    yr = complete(xform(rf).rf, state.right)
    iacc2 = next(inner(rf), iacc1, yr)
    if state isa PartitionVacant
        yl = complete(inner(rf), state.left)
        iacc0 = next(inner(rf), start(inner(rf), DefaultInit), yl)
        iacc3 = combine(inner(rf), iacc0, iacc2)
    else
        iacc3 = iacc2
    end
    return complete(inner(rf), iacc3)
end

function combine(rf::R_{ReducePartitionBy}, a, b)
    a1, a2 = unwrap(rf, a)
    b1, b2 = unwrap(rf, b)
    # @show a1 b1
    if a1 isa PartitionChunk
        if b1 isa PartitionChunk
            if isequal(a1.kr, b1.kr)
                c1 = PartitionChunk(a1.kr, combine(xform(rf).rf, a1.right, b1.right))
            else
                c1 = PartitionVacant(a1.kr, b1.kr, a1.right, b1.right)
            end
        else
            if isequal(a1.kr, b1.kl)
                c1 = PartitionVacant(a1.kr, b1.kr, combine(xform(rf).rf, a1.right, b1.left), b1.right)
            else
                y = complete(xform(rf).rf, b1.left)
                # @show y
                a2 = next(inner(rf), a2, y)
                c1 = PartitionVacant(a1.kr, b1.kr, a1.right, b1.right)
            end
        end
    else
        if b1 isa PartitionChunk
            if isequal(a1.kr, b1.kr)
                c1 = PartitionVacant(a1.kl, a1.kr, a1.left, combine(xform(rf).rf, a1.right, b1.right))
            else
                y = complete(xform(rf).rf, a1.right)
                # @show y
                a2 = next(inner(rf), a2, y)
                c1 = PartitionVacant(a1.kl, b1.kr, a1.left, b1.right)
            end
        else
            if isequal(a1.kr, b1.kl)
                acc = combine(xform(rf).rf, a1.right, b1.left)
                y = complete(xform(rf).rf, acc)
                # @show y
                a2 = next(inner(rf), a2, y)
                c1 = PartitionVacant(a1.kl, b1.kr, a1.left, b1.right)
            else
                ya = complete(xform(rf).rf, a1.right)
                yb = complete(xform(rf).rf, b1.left)
                # @show ya yb
                a2 = next(inner(rf), a2, ya)
                a2 = next(inner(rf), a2, yb)
                c1 = PartitionVacant(a1.kl, b1.kr, a1.left, b1.right)
            end
        end
    end
    # @show c1
    c2 = combine(inner(rf), a2, b2)
    return wrap(rf, c1, c2)
end

left(l, r) = l
left(l) = l
InitialValues.@def_monoid left

function array_partitionby(f::F, xs) where {F}
    @inline getkey(i) = f(@inbounds xs[i])
    @inline getview((i, j),) = @inbounds view(xs, i:j)
    return eachindex(xs) |>
        ReducePartitionBy(getkey, TeeRF((left, right)), DefaultInit) |>
        Map(getview)
end

(f::PartitionBy)(xs::AbstractArray) = array_partitionby(f.f, xs)

if VERSION < v"1.3"
    Base.:|>(xs::AbstractArray, f::PartitionBy) = array_partitionby(f.f, xs)
end
