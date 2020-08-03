using Base: @deprecate

function Base.:|>(f::Transducer, g::Transducer)
    if Base.JLOptions().depwarn == 1
        @warn """
        **Quick upgrade guide**: `f::Transducer |> g::Transducer` is deprecated.
        Instead of

            collect(Filter(f) |> Map(g), xs)
            foldl(+, Filter(f) |> Map(g), xs)

        it's now recommended to use `|>` with input collection

            xs |> Filter(f) |> Map(g) |> collect
            foldl(+, xs |> Filter(f) |> Map(g))

        If there is no input collection; e.g.,

            foldl(right, GroupBy(key, Filter(f) |> Map(g), push!!), xs)

        use `opcompose` instead:

            foldl(right, GroupBy(key, opcompose(Map(f), Filter(g)), push!!), xs)

        For more information, see:
        https://juliafolds.github.io/Transducers.jl/dev/howto/upgrade-to-ixf/
        """ maxlog = 1
    end
    Base.depwarn(
        "`f::Transducer |> g::Transducer` is deprecated. " *
        "Use `xs |> f |> g |> collect` instead of `collect(f |> g, xs)`. " *
        "For more information, see " *
        "https://juliafolds.github.io/Transducers.jl/dev/howto/upgrade-to-ixf/",
        :|>,
    )
    return g ∘ f
end

@deprecate Distinct() Unique()
@deprecate TeeZip(xf) ZipSource(xf) false
@deprecate Keep(f) opcompose(Map(f), NotA(Nothing))

"""
    Keep(f)

Pass non-`nothing` output of `f` to the inner reducing step.

!!! warning

    `Keep(f)` is a deprecated. Use `... |> Map(f) |> NotA(Nothing)`.
    If `f` does not return a `Some`, [`KeepSomething`](@ref) can also
    be used.

# Examples
```julia
julia> using Transducers

julia> xf = Keep() do x
           if x < 3
               x + 1
           end
       end;

julia> collect(xf, 1:5)
2-element Array{Int64,1}:
 2
 3
```
"""
Keep

# It wasn't a public API but to play on the safe side:
@deprecate induction(itr) extract_transducer(itr) false

function Base.mapfoldl(xform::Transducer, step, itr; kwargs...)
    Base.depwarn(_MAPFOLDL_DEPWARN, (:mapfoldl, Symbol("mapfoldl##kw")))
    return foldl(whencomplete(step, step), xform, itr; kwargs...)
end

# disambiguation
function Base.mapfoldl(xform::Transducer, step, itr::Foldable; kwargs...)
    Base.depwarn(_MAPFOLDL_DEPWARN, (:mapfoldl, Symbol("mapfoldl##kw")))
    return foldl(whencomplete(step, step), xform, itr; kwargs...)
end

function _mapreduce(xform, step, itr, kwargs)
    Base.depwarn(_MAPREDUCE_DEPWARN, (:mapreduce, Symbol("mapreduce##kw")))
    return reduce(whencomplete(step, step), xform, itr; kwargs...)
end

Base.mapreduce(xform::Transducer, step, itr; kwargs...) =
    _mapreduce(xform, step, itr, kwargs)

# Disambiguation:
Base.mapreduce(xform::Transducer, step, itr::AbstractArray; kwargs...) =
    _mapreduce(xform, step, itr, kwargs)
Base.mapreduce(xform::Transducer, step, itr::AbstractArrayOrBroadcasted; kwargs...) =
    _mapreduce(xform, step, itr, kwargs)
Base.mapreduce(xform::Transducer, step, itr::Base.SkipMissing{<:AbstractArray}; kwargs...) =
    _mapreduce(xform, step, itr, kwargs)
Base.mapreduce(xform::Transducer, step, itr::Number; kwargs...) =
    _mapreduce(xform, step, itr, kwargs)

import Base: reduce
@deprecate reduce(rf, xf::Transducer, itr; kw...) foldxt(rf, xf, itr; kw...) false
@deprecate reduce(rf, itr::Foldable; kw...) foldxt(rf, itr; kw...) false
using Base: reduce

"""
    reduce(rf, [xf,] itr)

Multi-threaded reduce.

!!! warning
    `reduce` is a deprecated. Use [`foldxt`](@ref) instead.
"""
reduce(rf, xf::Transducer, itr)

@deprecate dreduce(rf, xf, itr; kw...) foldxd(rf, xf, itr; kw...)
@deprecate dreduce(rf, itr; kw...) foldxd(rf, itr; kw...)

"""
    dreduce(rf, [xf,] itr)

Distributed reduce.

!!! warning
    `dreduce` is a deprecated. Use [`foldxd`](@ref) instead.
"""
dreduce
