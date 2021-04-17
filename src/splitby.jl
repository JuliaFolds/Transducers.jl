"""
    Transducers.ReduceSplitBy(f, rf, init)

Split chunks by elements evaluated to `true` by `f` and reduce each chunk by
reducing function `rf`.

!!! note
    This is an internal implementation detail of [`SplitBy`](@ref) for now.

The reducing function `rf` receives either a `Bulk(x)` if `!f(x)` or a
`End(x)` if `f(x)` returns `true`. Just just after `rf` is called with
`End(x)`, its accumulator is finalized by [`complete`](@ref) and then passed
to the downstream transducer/reducing function.

# Examples
```jldoctest
julia> using Transducers
       using Transducers: ReduceSplitBy, Bulk, End

julia> 1:5 |> ReduceSplitBy(isodd, Map(getindex)'(string), "") |> collect
3-element Vector{String}:
 "1"
 "23"
 "45"

julia> function just_bulk(x)
           if x isa Bulk
               Some(x[])
           else
               nothing
           end
       end;

julia> 1:5 |> ReduceSplitBy(isodd, KeepSomething(just_bulk)'(string), "") |> collect
3-element Vector{String}:
 ""
 "2"
 "4"
```
"""
struct ReduceSplitBy{F,RF,Init} <: Transducer
    f::F
    rf::RF
    init::Init
end

abstract type _Element end
Base.getindex(x::_Element) = x.value

struct Bulk{T} <: _Element
    value::T
end

struct End{T} <: _Element
    value::T
end

struct Chunk{Right}
    right::Right
end
is_prelude(::Chunk) = true

struct Vacant{Left,Right}
    left::Left
    right::Right
end

start(rf::R_{ReduceSplitBy}, acc) = wrap(rf, Chunk(nothing), start(inner(rf), acc))

next(rf::R_{ReduceSplitBy}, acc, input) =
    wrapping(rf, acc) do state, iacc
        if state.right === nothing
            acc0 = start(xform(rf).rf, xform(rf).init)
        else
            acc0 = something(state.right)
        end
        if xform(rf).f(input)
            acc1 = next(xform(rf).rf, acc0, End(input))
            # @show acc1
            if state isa Vacant
                y = complete(xform(rf).rf, acc1)
                iacc′ = next(inner(rf), iacc, y)
                left = state.left
            else
                iacc′ = iacc
                left = acc1
            end
            (Vacant(left, nothing), iacc′)
        else
            right = Some(next(xform(rf).rf, acc0, Bulk(input)))
            ((@set state.right = right), iacc)
        end
    end

function complete(rf::R_{ReduceSplitBy}, acc)
    state, iacc1 = unwrap(rf, acc)
    if state.right === nothing
        iacc2 = iacc1
    else
        yr = complete(xform(rf).rf, something(state.right))
        iacc2 = next(inner(rf), iacc1, yr)
    end
    if state isa Vacant
        # @show state.left
        yl = complete(inner(rf), state.left)
        # TODO: Is it OK to always use DefaultInit? Is there a better way?
        iacc0 = next(inner(rf), start(inner(rf), DefaultInit), yl)
        iacc3 = combine(inner(rf), iacc0, iacc2)
    else
        iacc3 = iacc2
    end
    return complete(inner(rf), iacc3)
end

@inline maybe_combine(_, ::Nothing, ::Nothing) = nothing
@inline maybe_combine(_, x::Some, ::Nothing) = x
@inline maybe_combine(_, ::Nothing, x::Some) = x
@inline maybe_combine(rf::RF, a::Some, b::Some) where {RF} =
    Some(combine(rf, something(a), something(b)))

function combine(rf::R_{ReduceSplitBy}, a, b)
    a1, a2 = unwrap(rf, a)
    b1, b2 = unwrap(rf, b)
    if a1 isa Chunk
        if b1 isa Chunk
            c1 = Chunk(maybe_combine(xform(rf).rf, a1.right, b1.right))
        else
            left = something(maybe_combine(xform(rf).rf, a1.right, Some(b1.left)))
            c1 = Vacant(left, b1.right)
        end
    else
        if b1 isa Chunk
            c1 = Vacant(a1.left, maybe_combine(xform(rf).rf, a1.right, b1.right))
        else
            acc = something(maybe_combine(xform(rf).rf, a1.right, Some(b1.left)))
            y = complete(xform(rf).rf, acc)
            a2 = next(inner(rf), a2, y)
            c1 = Vacant(a1.left, b1.right)
        end
    end
    c2 = combine(inner(rf), a2, b2)
    return wrap(rf, c1, c2)
end

"""
    SplitBy(f; [keepend = false,] [keepempty = false,])

Split input collection into chunks delimited by the elements on which `f`
returns `true`. This can be used to implement parallel and lazy versions of
functions like `eachline` and `split`.

If `keepend` is `true` (or `Val(true)`), include the "delimiter"/end element
at the end of each chunk. If `keepempty` is `true` (or `Val(true)`), include
empty chunks. When `keepend` is `true`, the value of `keepempty` is
irrelevant since the chunks cannot be empty (i.e., it at least contains the
end).

The input collection (`xs` in `SplitBy(...)(xs)`) has to support `eachindex`
and `view` or `SubString`.

# Extended Help

## Examples

For demonstration, consider the following input stream and `SplitBy(iszero;
...)` used with the following options:

```
input     keepend=false       keepend=false        keepend=true
          keepempty=false     keepempty=true

1           `.                  `.                  `.
2            | y1                | y1                | y1
3           ,'                  ,'                   |
0                                                   ,'
1           `.                  `.                  `.
2            | y2                | y2                | y2
3            |                   |                   |
4           ,'                  ,'                   |
0                               __ y3               ,'
0                                                    ] y3
1           `.                  `.                  `.
2            | y3                | y4                | y4
```

In the above diagram, `yi` (`i = 1, 2, 3, 4`) are the output of `SplitBy`. This
can be checked in the REPL easily as follows. (Note: we are using
`Map(collect)` for cleaner printing; it's not required unless the arrays is
mutated in the downstream.)

```jldoctest
julia> using Transducers

julia> xs = [1, 2, 3, 0, 1, 2, 3, 4, 0, 0, 1, 2];  # input

julia> xs |> SplitBy(iszero) |> Map(collect) |> collect
3-element Vector{Vector{Int64}}:
 [1, 2, 3]
 [1, 2, 3, 4]
 [1, 2]

julia> xs |> SplitBy(iszero; keepempty = true) |> Map(collect) |> collect
4-element Vector{Vector{Int64}}:
 [1, 2, 3]
 [1, 2, 3, 4]
 []
 [1, 2]

julia> xs |> SplitBy(iszero; keepend = true) |> Map(collect) |> collect
4-element Vector{Vector{Int64}}:
 [1, 2, 3, 0]
 [1, 2, 3, 4, 0]
 [0]
 [1, 2]
```
"""
struct SplitBy{F,KeepEnd<:ValBool,KeepEmpty<:ValBool} # <: Transducer  # TODO: should I?
    f::F
    keepend::KeepEnd
    keepempty::KeepEmpty
end

SplitBy(
    f;
    keepend::Union{Bool,ValBool} = Val(false),
    keepempty::Union{Bool,ValBool} = Val(false),
) = SplitBy(f, asval(keepend), asval(keepempty))

struct SplitByReducingFunction{KeepEnd<:ValBool,KeepEmpty<:ValBool}
    keepend::KeepEnd
    keepempty::KeepEmpty
end

function next(rf::SplitByReducingFunction, a, b)
    # @show a b
    j = b[]
    if a === nothing
        i = j
        k = j - 1
    else
        i, k, = a::Tuple{Any,Any}
    end
    if b isa Bulk
        return (i, j)
    else
        b::End
        if rf.keepend === Val(true)
            return (i, j)
        elseif rf.keepempty === Val(true)
            return (i, k)
        elseif a === nothing
            return nothing
        else
            return (i, k)
        end
    end
end

function combine(::SplitByReducingFunction, a, b)
    a === nothing && return b
    b === nothing && return a
    return (a[1], b[2])
end

complete(::SplitByReducingFunction, a) = a

(f::SplitBy)(xs) =
    xs |>
    eachindex |>
    ReduceSplitBy(
        i -> f.f(@inbounds xs[i]),
        SplitByReducingFunction(f.keepend, f.keepempty),
        nothing,
    ) |>
    NotA(Nothing) |>
    Map(sb_viewer(xs))
# TODO: Check if it is better to use `pairs`; note that it'd require
# `pairs(::AbstractString)` to return some structured iterator.

sb_viewer(xs) = view_any((i, j),) = view(xs, i:j)
sb_viewer(xs::AbstractString) = view_str((i, j),) = SubString(xs, i, j)
