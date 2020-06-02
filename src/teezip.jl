"""
    ZipSource(xform::Transducer)

Branch input into two "flows", inject one into `xform` and then merge
(zip) the output of `xform` with the original (source) input.

$_experimental_warning

To illustrate how it works, consider the following usage

```
xf0 |> ZipSource(xf1) |> xf2
```

where `xf0`, `xf1`, and `xf2` are some transducers.  Schematically,
the output `yn` from `xfn` flows as follows:

```text
xf0      xf1                       xf2
---- y0 ------ y1 ---.-- (y0, y1) ----->
      |              |
       `-------------'
```

# Examples
```jldoctest
julia> using Transducers
       using Transducers: ZipSource

julia> collect(ZipSource(Filter(isodd) |> Map(x -> x + 1)), 1:5)
3-element Array{Tuple{Int64,Int64},1}:
 (1, 2)
 (3, 4)
 (5, 6)
```
"""
struct ZipSource{T} <: Transducer
    xform::T
end
# The idea is to insert an object `Joiner` to the bottom of
# `Reduction` dynamically which calls to the rest of inner reductions
# after the value is zipped (joined).

# Consider a transducer:
#
#     Map(identity) |>
#         ZipSource(
#             Count() |> Filter(isodd)
#         ) |>
#         MapSplat(*)
#
# Applying this transducer to a reducing function `rf` produces
#
#     Reduction(
#         identity,
#         Splitter(
#             Reduction(
#                 Count(),
#                 Reduction(
#                     Filter(isodd),
#                     Joiner(
#                         Reduction(
#                             MapSplat(*),
#                             rf))))))

struct Splitter{R} <: AbstractReduction{R}
    inner::R
end

setinner(rf::Splitter, inner) = Splitter(inner)
reform(rf::Splitter, f) = Splitter(reform(inner(rf), f))

struct Joiner{F} <: AbstractReduction{F}
    inner::F  # original inner reduction
end

setinner(rf::Joiner, inner) = Joiner(inner)
reform(rf::Joiner, f) = Joiner(reform(inner(rf), f))

# It's ugly that `Reduction` returns a non-`Reduction` type!  TODO: fix it
function Reduction(xf::Composition{<:ZipSource}, f)
    @nospecialize
    rf = _teezip_rf(xf.outer.xform, (xf.inner, f))
    return Splitter(rf)
end

function Reduction(xf::ZipSource, f)
    @nospecialize
    rf = _teezip_rf(xf.xform, (nothing, f))
    return Splitter(rf)
end

function _teezip_rf(xf::Composition, downstream)
    @nospecialize
    rf_inner = _teezip_rf(xf.inner, downstream)
    return Reduction(xf.outer, rf_inner)
end

function _teezip_rf(xf, downstream)
    @nospecialize
    xf_ds, f = downstream
    if xf_ds === nothing
        rf_ds = ensurerf(f)
    else
        rf_ds = Reduction(xf_ds, f)
    end
    joiner = Joiner(rf_ds)
    return Reduction(xf, joiner)
end

const SplitterState = PrivateState{<:Splitter}
const JoinerState = PrivateState{<:Joiner}

"""
    _set_joiner_value(ps::PrivateState, x) :: PrivateState

Set `.state` field of the `PrivateState` of the first "unbalanced"
`Joiner`.  A `Joiner` matched with preceding `Splitter` would be
treated as a regular reducing function node.  Thus, private state `ps`
must have one more `Joiner` than `Splitter`.
"""
@inline _set_joiner_value(ps, x) = _set_joiner_value(ps, x, Val(0))
@inline _set_joiner_value(ps::JoinerState, x, ::Val{0}) =
    setpsstate(ps, x)
@inline _set_joiner_value(ps::JoinerState, x, ::Val{c}) where c =
    setpsresult(ps, _set_joiner_value(psresult(ps), x, Val(c - 1)))
@inline _set_joiner_value(ps::SplitterState, x, ::Val{c}) where c =
    setpsresult(ps, _set_joiner_value(psresult(ps), x, Val(c + 1)))
@inline _set_joiner_value(ps, x, VC) =
    setpsresult(ps, _set_joiner_value(psresult(ps), x, VC))
#
# Writing above with a single function was much easier to read.
# However, it didn't work with the compiler (which tries to
# dynamically allocate type variable somehow).

start(rf::Splitter, result) = wrap(rf, nothing, start(inner(rf), result))
complete(rf::Splitter, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::Splitter, result, input) =
    wrapping(rf, result) do _, iresult
        nothing, next(inner(rf), _set_joiner_value(iresult, input), input)
    end

start(rf::Joiner, result) = wrap(rf, nothing, start(inner(rf), result))
complete(rf::Joiner, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::Joiner, result, input) =
    wrapping(rf, result) do state, iresult
        state, next(inner(rf), iresult, (state, input))
    end
# Putting `state` back to make it type stable.

isexpansive(xf::ZipSource) = isexpansive(xf.xform)

function Transducer(rf::Splitter)
    xf_split, rf_ds = _rf_to_teezip(inner(rf))
    return ZipSource(xf_split) |> Transducer(rf_ds)
end

function _rf_to_teezip(rf::Reduction)
    xf_split, rf_ds = _rf_to_teezip(inner(rf))
    return xform(rf) |> xf_split, rf_ds
end

_rf_to_teezip(rf::Joiner) = IdentityTransducer(), inner(rf)

function _rf_to_teezip(rf::Splitter)
    xf_split, rf_inner = _rf_to_teezip(inner(rf))
    xf_inner, rf_ds = _rf_to_teezip(rf_inner)
    return ZipSource(xf_split) |> xf_inner, rf_ds
end


# add joint
# Base.adjoint(xf::Transducer) = ZipSource(xf)

"""
    Zip(xforms...)

Zip outputs of transducers `xforms` in a tuple and pass it to the
inner reduction step.

!!! warning
    Head transducers drive tail transducers.  Be careful when using it
    with transducers other than [`Map`](@ref), especially the
    contractive ones like [`PartitionBy`](@ref) and the expansive ones
    like [`MapCat`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> collect(Zip(Map(identity), Map(x -> 10x), Map(x -> 100x)), 1:3)
3-element Array{Tuple{Int64,Int64,Int64},1}:
 (1, 10, 100)
 (2, 20, 200)
 (3, 30, 300)
```
"""
Zip(xforms...) =
    Map(_zip_init) |> _Zip(xforms...) |> Map(last)
# TODO: add `lower(xf)` mechanism so that constructing Zip does not
# immidiately create a complex composite transducer.

_Zip() = IdentityTransducer()
_Zip(xf1, xforms...) =
    ZipSource(Map(first) |> xf1) |> Map(_zip_between) |> _Zip(xforms...)

_zip_init(y0) = (y0, ())
_zip_between(((y0, ys), yn)) = (y0, (ys..., yn))
