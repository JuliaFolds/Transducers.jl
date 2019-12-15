# --- Transducible processes

"""
    reducingfunction(xf, step; simd)

Apply transducer `xf` to the reducing function `step` to create a new
reducing function.

!!! compat "Transducers.jl 0.3"

    New in version 0.3.

!!! warning

    Be careful using `reducingfunction` with stateful transducers like
    [`Scan`](@ref) with mutable `init` (e.g., `Scan(push!, [])`).  See
    more in Examples below.

# Arguments
- `xf::Transducer`: A transducer.
- `step`: A callable which accepts 1 and 2 arguments.  If it only
  accepts 2 arguments, wrap it with [`Completing`](@ref) to "add"
  1-argument form (i.e., [`complete`](@ref) protocol).

# Keyword Arguments
- `simd`: `false`, `true`, or `:ivdep`. See [`maybe_usesimd`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> rf = reducingfunction(Map(x -> x + 1), *);

julia> rf(10, 2) === 10 * (2 + 1)
true
```

## Warning: Be careful when using `reducingfunction` with stateful transducers

Stateful `Transducer`s themselves in Transducers.jl are not inherently
broken with `reducingfunction`.  However, it can produce incorrect
results when combined with mutable states:

```jldoctest reducingfunction; setup = :(using Transducers)
julia> scan_state = [];

julia> rf_bad = reducingfunction(Scan(push!, scan_state) |> Cat(), string);

julia> transduce(rf_bad, "", 1:3)
"112123"
```

The first run works.  However, observe that the vector `scan_state` is
not empty anymore:

```jldoctest reducingfunction
julia> scan_state
3-element Array{Any,1}:
 1
 2
 3
```

Thus, the second run produces an incorrect result:

```jldoctest reducingfunction
julia> transduce(rf_bad, "", 1:3)
"123112312123123"
```

One way to solve this issue is to use [`CopyInit`](@ref) or [`OnInit`](@ref).

```jldoctest reducingfunction
julia> scan_state = CopyInit([])
CopyInit(Any[])

julia> rf_good = reducingfunction(Scan(push!, scan_state) |> Cat(), string);

julia> transduce(rf_good, "", 1:3)
"112123"

julia> scan_state
CopyInit(Any[])

julia> transduce(rf_good, "", 1:3)
"112123"
```
"""
@inline reducingfunction(xf::Transducer, step; simd::SIMDFlag = Val(false)) =
    maybe_usesimd(Reduction(xf, step), simd)

"""
    __foldl__(rf, init, reducible::T)

Left fold a `reducible` with reducing function `rf` and initial value
`init`.  This is primary an API for overloading when the reducible
"container" or "context" (e.g., I/O stream) of type `T` can provide a
better reduction mechanism than the default iterator-based one.

For a simple iterable type `MyType`, a valid implementation is:

```julia
function __foldl__(rf, val, itr::MyType)
    for x in itr
        val = @next(rf, val, x)
    end
    return complete(rf, val)
end
```

although in this case default ` __foldl__` can handle `MyType` and
thus there is no need for defining it.  In general, defining
`__foldl__` is useful only when there is a better way to go over items
in `reducible` than `Base.iterate`.

See also: [`@next`](@ref).
"""
__foldl__

const FOLDL_RECURSION_LIMIT = Val(10)
# const FOLDL_RECURSION_LIMIT = nothing
_dec(::Nothing) = nothing
_dec(::Val{n}) where n = Val(n - 1)

function __foldl__(rf, init, coll)
    ret = iterate(coll)
    ret === nothing && return complete(rf, init)
    x, state = ret
    val = @next(rf, init, x)
    return _foldl_iter(rf, val, coll, state, FOLDL_RECURSION_LIMIT)
end

@inline function _foldl_iter(rf, val::T, iter, state, counter) where T
    while true
        ret = iterate(iter, state)
        ret === nothing && break
        x, state = ret
        y = @next(rf, val, x)
        counter === Val(0) || y isa T ||
            return _foldl_iter(rf, y, iter, state, _dec(counter))
        val = y
    end
    return complete(rf, val)
end

__foldl__(rf, init, coll::Tuple) =
    complete(rf, @return_if_reduced foldlargs(rf, init, coll...))

# TODO: use IndexStyle
@inline function __foldl__(rf, init, arr::Union{AbstractArray, Broadcasted})
    isempty(arr) && return complete(rf, init)
    idxs = eachindex(arr)
    val = @next(rf, init, @inbounds arr[idxs[firstindex(idxs)]])
    @simd_if rf for k in firstindex(idxs) + 1:lastindex(idxs)
        i = @inbounds idxs[k]
        val = @next(rf, val, @inbounds arr[i])
    end
    return complete(rf, val)
end

@inline _getvalues(i) = ()
@inline _getvalues(i, a, rest...) = ((@inbounds a[i]), _getvalues(i, rest...)...)

# TODO: merge this with array implementation
@static if VERSION >= v"1.1-"
    @inline function __foldl__(
            rf, init,
            zs::Iterators.Zip{<:Tuple{Vararg{AbstractArray}}})
        isempty(zs) && return complete(rf, init)
        idxs = eachindex(zs.is...)
        val = @next(rf, init, _getvalues(firstindex(idxs), zs.is...))
        @simd_if rf for i in firstindex(idxs) + 1:lastindex(idxs)
            val = @next(rf, val, _getvalues(i, zs.is...))
        end
        return complete(rf, val)
    end
end

@inline function __foldl__(
        rf, init,
        prod::Iterators.ProductIterator{<:Tuple{Any,Any,Vararg{Any}}})
    val = _foldl_product(rf, init, (), prod.iterators...)
    val isa Reduced && return val
    return complete(rf, val)
end

@noinline _foldl_product(rf, val, ::Any) = error("Unreachable")
@inline _foldl_product(rf, val, ::Tuple) = next(rf, val, ())

@inline function _foldl_product(rf, val, outer, iterators...)
    inner_iterators, outer_iterator = _poptail(iterators)
    for input in outer_iterator
        val_ = _foldl_product(rf, val, (input, outer...), inner_iterators...)
        val_ isa Reduced && return val_
        val = val_
    end
    return val
end

@inline function _foldl_product(rf, val, outer, iterator)
    # TODO: Handle the case inner iterators are tuples.  In such case,
    # inner-most non-tuple iterators should use @simd_if.
    @simd_if rf for input in iterator
        val = @next(rf, val, (input, outer...))
    end
    return val
end

function __simple_foldl__(rf, val, itr)
    for x in itr
        val = @next(rf, val, x)
    end
    return complete(rf, val)
end

"""
    simple_transduce(xform, step, init, coll)

Simplified version of [`transduce`](@ref).  For simple transducers Julia
may be able to emit a good code.  This function exists only for
performance tuning.
"""
function simple_transduce(xform, f, init, coll)
    rf = Reduction(xform, f)
    return __simple_foldl__(rf, _start_init(rf, init), coll)
end

"""
    foldl_nocomplete(rf, init, coll)

Call [`__foldl__`](@ref) without calling [`complete`](@ref).
"""
foldl_nocomplete(rf, init, coll) = __foldl__(skipcomplete(rf), init, coll)

"""
    foldl(step, xf::Transducer, reducible; init, simd) :: T
    foldl(step, ed::Eduction; init, simd) :: T
    transduce(xf, step, init, reducible; simd) :: Union{T, Reduced{T}}

Compose transducer `xf` with reducing step function `step` and reduce
`itr` using it.

!!! note
    `transduce` differs from `foldl` as `Reduced{T}` is returned if
    the transducer `xf` or `step` aborts the reduction and `step` is
    _not_ automatically wrapped by [`Completing`](@ref).

This API is modeled after $(_cljref("transduce")).

For parallel versions, see [`reduce`](@ref) and [`dreduce`](@ref).

See also: [Empty result handling](@ref).

# Arguments
- `xf::Transducer`: A transducer.
- `step`: A callable which accepts 1 and 2 arguments.  If it only
  accepts 2 arguments, wrap it with [`Completing`](@ref) to "add"
  1-argument form (i.e., [`complete`](@ref) protocol).
- `reducible`: A reducible object (array, dictionary, any iterator, etc.).
- `init`: An initial value fed to the first argument to reducing step
  function `step`.  This argument can be omitted for well know binary
  operations like `+` or `*`.  Supported binary operations are listed
  in InitialValues.jl documentation.  When `Init` (not the result of
  `Init`, such as `Init(*)`) is given, it is automatically "instantiated"
  as `Init(step)` (where `step` is appropriately unwrapped if `step` is
  a `Completing`).  See [Empty result handling](@ref) in the manual
  for more information.
- `simd`: If `true` or `:ivdep`, enable SIMD using `Base.@simd`.  If
  `:ivdep`, use `@simd ivdep for ... end` variant.  Read Julia manual
  of `Base.@simd` to understand when it is appropriate to use this
  option.  For example, `simd = :ivdep` _must not_ be used with stateful
  transducer like [`Scan`](@ref).  This option has no effect if
  `false` (default).

# Examples
```jldoctest
julia> using Transducers

julia> foldl(Filter(isodd), 1:4, init=0.0) do state, input
           @show state, input
           state + input
       end
(state, input) = (0.0, 1)
(state, input) = (1.0, 3)
4.0
```
"""
foldl

"""
    transduce(xf, step, init, reducible) :: Union{T, Reduced{T}}

See [`foldl`](@ref).
"""
transduce

"""
    mapfoldl(xf::Transducer, step, reducible; init, simd)

!!! warning

    `mapfoldl` exists primary for backward compatibility.  It is
    recommended to use `foldl`.

Like [`foldl`](@ref) but `step` is _not_ automatically wrapped by
[`Completing`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> function step_demo(state, input)
           @show state, input
           state + input
       end;

julia> function step_demo(state)
           println("Finishing with state = ", state)
           state
       end;

julia> mapfoldl(Filter(isodd), step_demo, 1:4, init=0.0)
(state, input) = (0.0, 1)
(state, input) = (1.0, 3)
Finishing with state = 4.0
4.0
```
"""
mapfoldl

function transduce(xform::Transducer, f, init, coll; kwargs...)
    rf = Reduction(xform, f)
    return transduce(rf, init, coll; kwargs...)
end

# Materialize initial value and then call start.
_start_init(rf, init) = start(rf, provide_init(rf, init))

_unreduced__foldl__(rf, step, coll) = unreduced(__foldl__(rf, step, coll))

# TODO: should it be an internal?
@inline function transduce(rf0::AbstractReduction, init, coll;
                           simd::SIMDFlag = Val(false))
    # Inlining `transduce` and `__foldl__` were essential for the
    # `darkritual` below to work.
    rf = maybe_usesimd(rf0, simd)
    state = _start_init(rf, init)
    result = __foldl__(rf, state, coll)
    if unreduced(result) isa DefaultInit
        throw(EmptyResultError(rf0))
        # Should I check if `init` is a `MissingInit`?
    end
    # At this point, `return result` is the semantically correct thing
    # to do.  What follows are some convoluted instructions to
    # convince the compiler that this function is type-stable (in some
    # cases).  Note that return type would be inference-dependent only
    # if `init` is a `OptInit` type.  In the default case where `init
    # isa DefaultInit`, the real code pass is the `throw` above.

    # Unpacking as `ur_result` and re-packing it later somehow helps
    # the compiler to correctly eliminate a possibility in a `Union`.
    ur_result = unreduced(result)
    if ur_result isa InferableInit
        # Using `rf0` instead of `rf` helps the compiler.  Note that
        # this means that we are relying on that enabling SIMD does
        # not change the return type.
        realtype = _nonidtype(Core.Compiler.return_type(
            _unreduced__foldl__,
            typeof((rf0, state, coll)),
        ))
        if realtype isa Type
            realvalue = convert(realtype, ur_result)
            if result isa Reduced
                return Reduced(realvalue)
            else
                return realvalue
            end
        end
    end
    if result isa Reduced
        return Reduced(ur_result)
    else
        return ur_result
    end
end

function Base.mapfoldl(xform::Transducer, step, itr;
                       simd::SIMDFlag = Val(false),
                       init = MissingInit())
    unreduced(transduce(xform, step, init, itr; simd=simd))
end

struct Eduction{F, C} <: Foldable
    rf::F
    coll::C
end

Eduction(xform::Transducer, coll) =
    Eduction(Reduction(xform, Completing(push!!)), coll)

Transducer(ed::Eduction) = Transducer(ed.rf)

transduce(xform::Transducer, f, init, ed::Eduction) =
    transduce(Transducer(ed) |> xform, f, init, ed.coll)

Base.IteratorSize(::Type{<:Eduction}) = Base.SizeUnknown()

function Base.iterate(ts::Eduction, state = nothing)
    if state === nothing
        cret = iterate(ts.coll)
        cret === nothing && return nothing
        input, cstate = cret

        result = start(ts.rf, Union{}[])

        cdone = false
        rdone = false
        @goto step
        # Assuming the initial `result` can never be `Reduced`.
    else
        cstate, cdone, result, rdone = state
    end
    if !cdone && !rdone
        while isempty(unwrap_all(result))
            cret = iterate(ts.coll, cstate)
            if cret === nothing
                cdone = true
                result = complete(ts.rf, unreduced(result))
                # Stateful transducers may have flushed something.
                # Let's not `return nothing` yet.
                break
            end
            input, cstate = cret

            @label step
            result = next(ts.rf, result, input)
            if isreduced(result)
                rdone = true
                result = unreduced(result)
                break
            end
        end
    end
    buffer = unwrap_all(result)
    isempty(buffer) && return nothing
    y = popfirst!(buffer)
    next_state = (cstate, cdone, result, rdone)
    return (y, next_state)
end

"""
    eduction(xf::Transducer, coll)

Create a iterable and reducible object.

* [Iterable](https://docs.julialang.org/en/v1/manual/interfaces/#man-interface-iteration-1).
* Reducible; i.e., it can be handled by [`transduce`](@ref) efficiently.

This API is modeled after $(_cljref("eduction")).

# Examples
```jldoctest
julia> using Transducers

julia> for x in eduction(Filter(isodd) |> Take(3), 1:1000)
           @show x
       end
x = 1
x = 3
x = 5
```
"""
eduction(xform, coll) = Eduction(xform, coll)
# Note on `simd` keyword argument: `eduction` ATM does not support
# `simd` argument which could be done in principle.  However, how
# `foldl` and `foreach` with `Eduction` treat `simd` argument must be
# tweaked if that happens.
#
# Note on API:
# Exporting `Eduction` could also work.  But `Base` has, e.g.,
# `skipmissing` so maybe this is better for more uniform API.

"""
    induction(foldable) -> (xf, foldable′)

Reverse of `eduction` (I have no idea what the right name of this
function is).
"""
induction(ed::Eduction) = (Transducer(ed.rf), ed.coll)
induction(coll) = (Map(identity), coll)  # TODO: use `IdentityTransducer`

"""
    setinput(ed::Eduction, coll)

Set input collection of eduction `ed` to `coll`.

!!! compat "Transducers.jl 0.3"

    Previously, `setinput` combined with `eduction` was a recommended
    way to use transducers in a type stable manner.  As of v0.3, all
    the `foldl`-like functions and `eduction` are type stable for many
    cases.  This workaround is no more necessary.

# Examples
```jldoctest
julia> using Transducers

julia> ed = eduction(Map(x -> 2x), Float64[]);

julia> xs = ones(2, 3);

julia> foldl(+, setinput(ed, xs))
12.0
```
"""
setinput(ed::Eduction, coll) =
    _setinput(eltype(ed.coll), eltype(coll), ed, coll)

_setinput(::Type{T}, ::Type{T}, ed, coll) where T = @set ed.coll = coll
_setinput(::Type, ::Type, ed, coll) = eduction(Transducer(ed), coll)

"""
    append!(xf::Transducer, dest, src) -> dest

This API is modeled after $(_cljref("into")).

# Examples
```jldoctest
julia> using Transducers

julia> append!(Drop(2), [-1, -2], 1:5)
5-element Array{Int64,1}:
 -1
 -2
  3
  4
  5
```
"""
Base.append!(xf::Transducer, to, from) =
    unreduced(transduce(xf, Completing(push!), to, from))

"""
    BangBang.append!!(xf::Transducer, dest, src) -> dest′

Mutate-or-widen version of [`append!`](@ref).

!!! compat "Transducers.jl 0.4.4"

    New in version 0.4.4.

# Examples
```jldoctest
julia> using Transducers, BangBang

julia> append!!(Drop(2) |> Map(x -> x + 0.0), [-1, -2], 1:5)
5-element Array{Float64,1}:
 -1.0
 -2.0
  3.0
  4.0
  5.0
```
"""
BangBang.append!!(xf::Transducer, to, from) =
    unreduced(transduce(xf, Completing(push!!), to, from))

"""
    collect(xf::Transducer, itr)

Process an iterable `itr` using a transducer `xf` and collect the result
into a `Vector`.

For parallel versions, see [`tcollect`](@ref) and [`dcollect`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> collect(Interpose(missing), 1:3)
5-element Array{Union{Missing, Int64},1}:
 1
  missing
 2
  missing
 3
```
"""
function Base.collect(xf::Transducer, coll)
    rf = Reduction(xf, Completing(push!!))
    to = Union{}[]
    result = unreduced(transduce(rf, to, coll))
    if result isa Vector{Union{}}
        et = @default_finaltype(xf, coll)
        return et[]
    end
    return result
end
# Base.collect(xf, coll) = append!([], xf, coll)

"""
    copy(xf::Transducer, T, foldable) :: Union{T, Empty{T}}
    copy(xf::Transducer, foldable::T) :: Union{T, Empty{T}}

Process `foldable` with a transducer `xf` and then create a container of type `T`
filled with the result.  Return
[`BangBang.Empty{T}`](https://tkf.github.io/BangBang.jl/dev/#BangBang.NoBang.Empty)
if the transducer does not produce anything.  (This is because there is no
consistent interface to create an empty container given its type and not all
containers support creating an empty container.)

For parallel versions, see [`tcopy`](@ref) and [`dcopy`](@ref).

!!! compat "Transducers.jl 0.4.4"

    New in version 0.4.4.

# Examples
```jldoctest
julia> using Transducers
       using BangBang: Empty

julia> copy(Map(x -> x => x^2), Dict, 2:2)
Dict{Int64,Int64} with 1 entry:
  2 => 4

julia> @assert copy(Filter(_ -> false), Set, 1:1) === Empty(Set)

julia> using TypedTables

julia> @assert copy(Map(x -> (a=x, b=x^2)), Table, 1:1) == Table(a=[1], b=[1])

julia> using StructArrays

julia> @assert copy(Map(x -> (a=x, b=x^2)), StructVector, 1:1) == StructVector(a=[1], b=[1])
```
"""
Base.copy(xf::Transducer, ::Type{T}, foldable) where {T} = append!!(xf, Empty(T), foldable)
Base.copy(xf::Transducer, foldable) = copy(xf, _materializer(foldable), foldable)

"""
    map!(xf::Transducer, dest, src; simd)

Feed `src` to transducer `xf`, storing the result in `dest`.
Collections `dest` and `src` must have the same shape.  Transducer
`xf` may contain filtering transducers.  If some entries `src` are
skipped, the corresponding entries in `dest` will be unchanged.
Transducer `xf` must not contain any expansive transducers such as
[`MapCat`](@ref).

See also [`copy!`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> xs = collect(1:5)
       ys = zero(xs)
       map!(Filter(isodd), ys, xs)
5-element Array{Int64,1}:
 1
 0
 3
 0
 5

julia> ans === ys
true
```
"""
function Base.map!(xf::Transducer, dest::AbstractArray, src::AbstractArray;
                   simd::SIMDFlag = Val(false))
    _map!(_prepare_map(xf, dest, src, simd)...)
    return dest
end

_map!(rf, coll, dest) = transduce(darkritual(rf), nothing, coll)

# Deep-copy `AbstractReduction` so that compiler can treat the all
# reducing function tree nodes as local variables (???).  Aslo, it
# tells compiler that `dest` is a local variable so that it won't
# fetch `dest` via `getproperty` in each iteration.  (This is too much
# magic...  My reasoning of how it works could be completely wrong.
# But at least it should not change the semantics of the function.)
@inline darkritual(x) = x
@inline darkritual(xf::SetIndex) = typeof(xf)(xf.array)
@inline darkritual(rf::R) where {R <: Reduction} =
    R(darkritual(xform(rf)), darkritual(inner(rf)))
@inline darkritual(rf::R) where {R <: Joiner} =
    R(darkritual(inner(rf)))
@inline darkritual(rf::R) where {R <: Splitter} =
    R(darkritual(inner(rf)))

function _prepare_map(xf, dest, src, simd)
    isexpansive(xf) && error("map! only supports non-expanding transducer")
    # TODO: support Dict
    indices = eachindex(dest, src)

    rf = reducingfunction(
        TeeZip(GetIndex{true}(src) |> xf) |> SetIndex{true}(dest),
        (::Vararg) -> nothing,
        simd = simd)

    return rf, indices, dest
end

"""
    copy!(xf::Transducer, dest, src)

Feed `src` to transducer `xf`, storing the result in `dest`.
Collections `dest` and `src` may have the same shape.  Source `src`
must be iterable.  Destination `dest` must implement `empty!` and
`push!`.

See also [`map!`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> copy!(PartitionBy(x -> x ÷ 3) |> Map(sum), Int[], 1:10)
4-element Array{Int64,1}:
  3
 12
 21
 19
```
"""
Base.copy!(xf::Transducer, dest, src) = append!(xf, empty!(dest), src)

function Base.foldl(step, xform::Transducer, itr;
                    kw...)
    mapfoldl(xform, Completing(step), itr; kw...)
end

@inline function Base.foldl(step, foldable::Foldable; init=MissingInit(), kwargs...)
    xf, coll = induction(foldable)
    return unreduced(transduce(xf, Completing(step), init, coll; kwargs...))
end

"""
    foreach(eff, xf::Transducer, reducible; simd)
    foreach(eff, ed::Eduction; simd)

Feed the results of `xf` processing items in `reducible` into a unary
function `eff`.  This is useful when the primary computation at the
bottom is the side-effect.  It is also equivalent to `foreach(eff,
eduction(xf, coll))`.  Note that

```julia
foreach(eduction(xf, coll)) do x
    ...
end
```

can be more efficient than

```julia
for x in eduction(xf, coll)
    ...
end
```

as the former does not have to translate the transducer protocol to
the iterator protocol.

`foreach` supports all constructs in the native `for` loop as well as
the enhancements [^julia_issue_22891] to `break` with a value (`break
D(x)` below) and append the `else` clause (`E(x)` below).

[^julia_issue_22891]: See also: [break with value + loop else clauses
    (JuliaLang/julia#22891)](https://github.com/JuliaLang/julia/issues/22891)

This native `for` loop

```julia
ans = for x in xs
    A(x)
    B(x) && break
    C(x) && break D(x)
else
    E(x)
end
```

can be written as

```julia
ans = foreach(Map(identity), xs) do x
    A(x)
    B(x) && return reduced()
    C(x) && return reduced(D(x))
    x  # required for passing `x` to `E(x)` below
end |> ifunreduced() do x
    E(x)
end
```

See: [`mapfoldl`](@ref), [`reduced`](@ref), [`ifunreduced`](@ref).

!!! compat "Transducers.jl 0.3"

    `foreach` is changed to return what the `do` block (`eff`
    function) returns as-is in version 0.3.  This was required for
    supporting "for-else" (`|> ifunreduced`).  Previously, it only
    supported break-with-value and always applied `unreduced` before
    it returns.

# Examples
```jldoctest
julia> using Transducers

julia> foreach(eduction(Filter(isodd), 1:4)) do input
           @show input
       end
input = 1
input = 3
3

julia> foreach(Filter(!ismissing), [1, missing, 2, 3]) do input
           @show input
           if iseven(input)
               return reduced()
           end
       end
input = 1
input = 2
Reduced(nothing)
```

It is often useful to append [`|> unreduced`](@ref unreduced) to
unwrap `Reduced` in the final result (note that `|>` here is the
standard function application, not the transducer composition).

```jldoctest; setup = :(using Transducers)
julia> foreach(Filter(!ismissing), [1, missing, 2, 3]) do input
           reduced("got \$input")
       end |> unreduced
"got 1"
```

Combination of break-with-value and for-else is useful for triggering
action after (e.g.) some kind of membership testing failed:

```jldoctest; setup = :(using Transducers)
julia> has2(xs) = foreach(Filter(!ismissing), xs) do input
           input == 2 && reduced(true)
       end |> ifunreduced() do input
           @show input
           false
       end;

julia> has2([1, missing, 2, 3])
true

julia> has2([1, missing])
input = false
false
```

However, note the output `input = false` in the last example.  This is
because how `&&` works in Julia

```jldoctest
julia> false && "otherwise"
false
```

Thus, pure membership testing functions like `has2` above can be
written in a more concise manner:

```jldoctest; setup = :(using Transducers)
julia> simpler_has2(xs) = foreach(Filter(!ismissing), xs) do input
           input == 2 && reduced(true)
       end |> unreduced;

julia> simpler_has2([1, missing, 2, 3])
true

julia> simpler_has2([1, missing])
false
```
"""
Base.foreach(eff, xform::Transducer, coll; kwargs...) =
    transduce(xform, SideEffect(eff), nothing, coll; kwargs...)
function Base.foreach(eff, reducible::Reducible; kwargs...)
    xf, coll = induction(reducible)
    return transduce(xf, SideEffect(eff), nothing, coll; kwargs...)
end

"""
    ifunreduced(f, [x])

Equivalent to [`unreduced(x)`](@ref unreduced) if `x` is a
[`Reduced`](@ref); otherwise run `f(x)`.  Return a curried version if
`x` is not provided.

See: [`foreach`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> 1 |> ifunreduced() do x
           println("called with x = ", x)
       end
called with x = 1

julia> reduced(1) |> ifunreduced() do x
           println("called with x = ", x)
       end
1
```

Notice that nothing is printed in the last example.

# Implementation

```julia
ifunreduced(f) = x -> ifunreduced(f, x)
ifunreduced(f, x::Reduced) = unreduced(x)
ifunreduced(f, x) = f(x)
```
"""
ifunreduced(f) = x -> ifunreduced(f, x)
ifunreduced(f, x::Reduced) = unreduced(x)
ifunreduced(f, x) = f(x)


"""
    Channel(xf::Transducer, itr; kwargs...)
    Channel(ed::Eduction; kwargs...)

Pipe items from an iterable `itr` processed by the transducer `xf`
through a channel.  `Channel(xf, itr)` and `Channel(eduction(xf,
itr))` are equivalent.  Note that `itr` itself can be a `Channel`.

Keyword arguments are passed to `Channel(function; kwargs...)`.

# Examples
```jldoctest
julia> using Transducers

julia> ch1 = Channel(Filter(isodd), 1:5);

julia> ch2 = Channel(Map(x -> 2x - 1), ch1);

julia> ed = eduction(Map(x -> 1:x), ch2);

julia> ch3 = Channel(Cat(), ed);

julia> foreach(PartitionBy(isequal(1)), ch3) do input
           @show input
       end;
input = [1, 1]
input = [2, 3, 4, 5]
input = [1]
input = [2, 3, 4, 5, 6, 7, 8, 9]
```
"""
Base.Channel(xform::Transducer, itr; kwargs...) =
    Channel(; kwargs...) do chan
        foreach(x -> put!(chan, x), xform, itr)
        return
    end

Base.Channel(ed::Eduction; kwargs...) =
    Channel(Transducer(ed), ed.coll; kwargs...)


"""
    AdHocFoldable(foldl, [collection = nothing])

Provide a different way to fold `collection` without creating a
wrapper type.

# Arguments
- `foldl::Function`: a function that implements [`__foldl__`](@ref).
- `collection`: a collection passed to the last argument of
  `foldl`.

# Examples
```jldoctest
julia> using Transducers
       using Transducers: @next, complete
       using ArgCheck

julia> function uppertriangle(A::AbstractMatrix)
           @argcheck !Base.has_offset_axes(A)
           return AdHocFoldable(A) do rf, acc, A
               for j in 1:size(A, 2), i in 1:min(j, size(A, 1))
                   acc = @next(rf, acc, @inbounds A[i, j])
               end
               return complete(rf, acc)
           end
       end;

julia> A = reshape(1:6, (3, 2))
3×2 reshape(::UnitRange{Int64}, 3, 2) with eltype Int64:
 1  4
 2  5
 3  6

julia> collect(Map(identity), uppertriangle(A))
3-element Array{Int64,1}:
 1
 4
 5

julia> function circularwindows(xs::AbstractVector, h::Integer)
           @argcheck !Base.has_offset_axes(xs)
           @argcheck h >= 0
           @argcheck 2 * h + 1 <= length(xs)
           return AdHocFoldable(xs) do rf, acc, xs
               buffer = similar(xs, 2 * h + 1)
               @inbounds for i in 1:h
                   buffer[1:h - i + 1] .= @view xs[end - h + i:end]
                   buffer[h - i + 2:end] .= @view xs[1:h + i]
                   acc = @next(rf, acc, buffer)
               end
               for i in h + 1:length(xs) - h
                   acc = @next(rf, acc, @inbounds @view xs[i - h:i + h])
               end
               @inbounds for i in 1:h
                   buffer[1:end - i] .= @view xs[end - 2 * h + i:end]
                   buffer[end - i + 1:end] .= @view xs[1:i]
                   acc = @next(rf, acc, buffer)
               end
               return complete(rf, acc)
           end
       end;

julia> collect(Map(collect), circularwindows(1:9, 2))
9-element Array{Array{Int64,1},1}:
 [8, 9, 1, 2, 3]
 [9, 1, 2, 3, 4]
 [1, 2, 3, 4, 5]
 [2, 3, 4, 5, 6]
 [3, 4, 5, 6, 7]
 [4, 5, 6, 7, 8]
 [5, 6, 7, 8, 9]
 [6, 7, 8, 9, 1]
 [7, 8, 9, 1, 2]

julia> expressions(str::AbstractString; kwargs...) =
           AdHocFoldable(str) do rf, val, str
               pos = 1
               while true
                   expr, pos = Meta.parse(str, pos;
                                          raise = false,
                                          depwarn = false,
                                          kwargs...)
                   expr === nothing && break
                   val = @next(rf, val, expr)
               end
               return complete(rf, val)
           end;

julia> collect(Map(identity), expressions(\"\"\"
       x = 1
       y = 2
       \"\"\"))
2-element Array{Expr,1}:
 :(x = 1)
 :(y = 2)

julia> counting = AdHocFoldable() do rf, acc, _
           i = 0
           while true
               i += 1
               acc = @next(rf, acc, i)
           end
       end;

julia> foreach(counting) do i
           @show i;
           i == 3 && return reduced()
       end;
i = 1
i = 2
i = 3
```
"""
struct AdHocFoldable{F, C} <: Foldable
    f::F
    coll::C
end

AdHocFoldable(f) = AdHocFoldable(f, nothing)

@inline __foldl__(rf, init, foldable::AdHocFoldable) =
    foldable.f(rf, init, foldable.coll)
