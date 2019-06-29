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

One way to solve this issue is to use [`CopyInit`](@ref) or
[`Initializer`](@ref).

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
@inline reducingfunction(xf::Transducer, step; kwargs...) =
    _reducingfunction(xf, step, NOTYPE; kwargs...)

@inline _reducingfunction(xf::Transducer, step, intype::Typeish; simd=false) =
    maybe_usesimd(Reduction(xf, step, intype), simd)

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
        val = next(rf, val, x)
        @return_if_reduced val
    end
    return complete(rf, val)
end
```

although in this case default ` __foldl__` can handle `MyType` and
thus there is no need for defining it.  In general, defining
`__foldl__` is useful only when there is a better way to go over items
in `reducible` than `Base.iterate`.

See also: [`@return_if_reduced`](@ref).
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
    val = next(rf, init, x)
    @return_if_reduced val
    return _foldl_iter(rf, val, coll, state, FOLDL_RECURSION_LIMIT)
end

@inline function _foldl_iter(rf, val::T, iter, state, counter) where T
    while (ret = iterate(iter, state)) !== nothing
        x, state = ret
        y = next(rf, val, x)
        @return_if_reduced y
        counter === Val(0) || y isa T ||
            return _foldl_iter(rf, y, iter, state, _dec(counter))
        val = y
    end
    return complete(rf, val)
end

# TODO: use IndexStyle
@inline function __foldl__(rf, init, arr::Union{AbstractArray, Broadcasted})
    isempty(arr) && return complete(rf, init)
    idxs = eachindex(arr)
    val = next(rf, init, @inbounds arr[idxs[firstindex(idxs)]])
    @return_if_reduced val
    @simd_if rf for k in firstindex(idxs) + 1:lastindex(idxs)
        i = @inbounds idxs[k]
        val = next(rf, val, @inbounds arr[i])
        @return_if_reduced val
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
        val = next(rf, init, _getvalues(firstindex(idxs), zs.is...))
        @return_if_reduced val
        @simd_if rf for i in firstindex(idxs) + 1:lastindex(idxs)
            val = next(rf, val, _getvalues(i, zs.is...))
            @return_if_reduced val
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
        val_ = next(rf, val, (input, outer...))
        @return_if_reduced val_
        val = val_
    end
    return val
end

function __simple_foldl__(rf, val, itr)
    for x in itr
        val = next(rf, val, x)
        @return_if_reduced val
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
    rf = Reduction(xform, f, eltype(coll))
    return __simple_foldl__(rf, _start_init(rf, init), coll)
end

"""
    foldl_nocomplete(rf, init, coll)

Call [`__foldl__`](@ref) without calling [`complete`](@ref).
"""
foldl_nocomplete(rf, init, coll) = __foldl__(skipcomplete(rf), init, coll)

"""
    mapfoldl(xf, step, reducible; init, simd) :: T
    transduce(xf, step, init, reducible; simd) :: Union{T, Reduced{T}}

Compose transducer `xf` with reducing step function `step` and reduce
`itr` using it.

!!! note
    `transduce` differs from `mapfoldl` as `Reduced{T}` is returned if
    the transducer `xf` or `step` aborts the reduction.

This API is modeled after $(_cljref("transduce")).

# Arguments
- `xf::Transducer`: A transducer.
- `step`: A callable which accepts 1 and 2 arguments.  If it only
  accepts 2 arguments, wrap it with [`Completing`](@ref) to "add"
  1-argument form (i.e., [`complete`](@ref) protocol).
- `reducible`: A reducible object (array, dictionary, any iterator, etc.).
- `init`: An initial value fed to the first argument to reducing step
  function `step`.
- `simd`: If `true` or `:ivdep`, enable SIMD using `Base.@simd`.  If
  `:ivdep`, use `@simd ivdep for ... end` variant.  Read Julia manual
  of `Base.@simd` to understand when it is appropriate to use this
  option.  For example, `simd = :ivdep` _must not_ be used with stateful
  transducer like [`Scan`](@ref).  This option has no effect if
  `false` (default).

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

"""
    transduce(xf, step, init, reducible) :: Union{T, Reduced{T}}

See [`mapfoldl`](@ref).
"""
transduce

function transduce(xform::Transducer, f, init, coll; kwargs...)
    rf = Reduction(xform, f, ieltype(coll))
    return transduce(rf, init, coll; kwargs...)
end

struct MissingInit end

provide_init(rf::AbstractReduction, init) = initvalue(init, FinalType(rf))
function provide_init(rf::AbstractReduction, ::MissingInit)
    T = FinalType(rf)
    op = as(rf, BottomRF).inner
    return identityof(op, T)
end

# Materialize initial value and then call start.
_start_init(rf, init) = start(rf, provide_init(rf, init))

# TODO: should it be an internal?
@inline function transduce(rf0::AbstractReduction, init, coll; simd=false)
    # Inlining `transduce` and `__foldl__` were essential for the
    # `darkritual` below to work.
    rf = maybe_usesimd(rf0, simd)
    return __foldl__(rf, _start_init(rf, init), coll)
end

function Base.mapfoldl(xform::Transducer, step, itr;
                       simd = false,
                       init = MissingInit())
    unreduced(transduce(xform, step, init, itr; simd=simd))
end

"""
    mapreduce(xf, step, reducible; init, simd) :: T

Possibly parallel version of [`mapfoldl`](@ref).  The "bottom"
reduction function `step(::T, ::T) :: T` must be associative and
`init` must be its identity element.

Transducers composing `xf` must be stateless and non-terminating
(e.g., [`Map`](@ref), [`Filter`](@ref), [`Cat`](@ref), etc.) except
for [`ScanEmit`](@ref).  Note that [`Scan`](@ref) is not supported
(although possible in theory).

See [`mapfoldl`](@ref).
"""
Base.mapreduce

function __reduce__(rf, init, arr::AbstractArray;
                    nthreads = max(1, min(length(arr), Threads.nthreads())))
    if nthreads == 1
        return __foldl__(rf, _start_init(rf, init), arr)
    else
        w = length(arr) ÷ nthreads
        results = Vector{Any}(undef, nthreads)
        Threads.@threads for i in 1:nthreads
            if i == nthreads
                chunk = @view arr[(i - 1) * w + 1:end]
            else
                chunk = @view arr[(i - 1) * w + 1:i * w]
            end
            results[i] = foldl_nocomplete(rf, _start_init(rf, init), chunk)
        end
        # It can be done in `log2(n)` for loops but it's not clear if
        # `combine` is compute-intensive enough so that launching
        # threads is worth enough.  Let's merge the `results`
        # sequentially for now.
        c = foldl(results) do a, b
            combine(rf, a, b)
        end
        return complete(rf, c)
    end
end

# AbstractArray for disambiguation
function Base.mapreduce(xform::Transducer, step, itr::AbstractArray;
                        init = MissingInit(),
                        simd = false,
                        kwargs...)
    rf = _reducingfunction(xform, step, eltype(itr); simd=simd)
    return unreduced(__reduce__(rf, init, itr; kwargs...))
end

struct Eduction{F, C}
    rf::F
    coll::C
end

Eduction(xform::Transducer, coll) =
    Eduction(Reduction(xform, Completing(push!), ieltype(coll)), coll)

Transducer(ed::Eduction) = Transducer(ed.rf)

transduce(xform::Transducer, f, init, ed::Eduction) =
    transduce(Transducer(ed) |> xform, f, init, ed.coll)

Base.IteratorSize(::Type{<:Eduction}) = Base.SizeUnknown()

Base.IteratorEltype(::Type{<:Eduction}) = Base.HasEltype()
Base.eltype(::Type{<:Eduction{F}}) where F = FinalType(F)

function Base.iterate(ts::Eduction, state = nothing)
    if state === nothing
        cret = iterate(ts.coll)
        cret === nothing && return nothing
        input, cstate = cret

        buffer = FinalType(ts.rf)[]
        result = start(ts.rf, buffer)

        cdone = false
        rdone = false
        @goto step
        # Assuming the initial `result` can never be `Reduced`.
    else
        cstate, cdone, result, buffer, rdone = state
    end
    if !cdone && !rdone
        while isempty(buffer)
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
                result = complete(ts.rf, unreduced(result))
                break
            end
        end
    end
    isempty(buffer) && return nothing
    y = popfirst!(buffer)
    next_state = (cstate, cdone, result, buffer, rdone)
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
    setinput(ed::Eduction, coll)

Set input collection of eduction `ed` to `coll`.  This is efficient
than re-creating an `Eduction` with a new `coll` if `eltype` of old
and new input collections are the same.

# Examples
```jldoctest setinput
julia> using Transducers

julia> ed = eduction(Map(x -> 2x), Float64[]);
```

Here, we created an `Eduction` with input container whose `eltype` is
`Float64`.  It can be used later with different container.

```jldoctest setinput
julia> using Test

julia> xs = ones(2, 3);

julia> foldl(+, @inferred setinput(ed, xs))
12.0
```

Note that we changed the container type from `Vector` to `Matrix`
while using the same `eltype`.  In this case, `setinput` is inferrable
and thus can be compiled away.  It is also possible to set container
with different `eltype` although not inferrable in this case:

```jldoctest setinput; filter = r"Transducers\\.Eduction.*"
julia> xs = ones(Int, 2, 3);

julia> foldl(+, setinput(ed, xs))
12

julia> foldl(+, @inferred setinput(ed, xs))
ERROR: return type Transducers.Eduction{...} does not match inferred return type ...
[...]
```
"""
setinput(ed::Eduction, coll) =
    _setinput(eltype(ed.coll), eltype(coll), ed, coll)

_setinput(::Type{T}, ::Type{T}, ed, coll) where T = @set ed.coll = coll
_setinput(::Type, ::Type, ed, coll) = eduction(Transducer(ed), coll)

"""
    append!(xf::Transducer, dest, src)

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
    transduce(xf, Completing(push!), to, from)

"""
    collect(xf::Transducer, itr)

Process an iterable `itr` using a transducer `xf` and collect the result
into a `Vector`.

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
    rf = Reduction(xf, Completing(push!), eltype(coll))
    to = FinalType(rf)[]
    return unreduced(transduce(rf, to, coll))
end
# Base.collect(xf, coll) = append!([], xf, coll)

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
                   simd = false)
    _map!(_prepare_map(xf, dest, src, simd)...)
    return dest
end

_map!(rf, coll, dest) = transduce(darkritual(rf, dest), nothing, coll)

# Deep-copy `AbstractReduction` so that compiler can treat the all
# reducing function tree nodes as local variables (???).  Aslo, it
# tells compiler that `dest` is a local variable so that it won't
# fetch `dest` via `getproperty` in each iteration.  (This is too much
# magic...  My reasoning of how it works could be completely wrong.
# But at least it should not change the semantics of the function.)
@inline darkritual(rf::R, dest) where {R <: Reduction} =
    if !(inner(rf) isa BottomRF)
        R(xform(rf), darkritual(inner(rf), dest))
    else
        @assert xform(rf).array === dest
        xf = typeof(xform(rf))(dest) :: SetIndex
        R(xf, inner(rf))
    end
@inline darkritual(rf::R, dest) where {R <: Joiner} =
    R(darkritual(inner(rf), dest), rf.value)
@inline darkritual(rf::R, dest) where {R <: Splitter} =
    R(darkritual(inner(rf), dest), rf.lens)

function _prepare_map(xf, dest, src, simd)
    isexpansive(xf) && error("map! only supports non-expanding transducer")
    # TODO: support Dict
    indices = eachindex(dest, src)

    rf = _reducingfunction(
        TeeZip(GetIndex{true}(src) |> xf) |> SetIndex{true}(dest),
        (::Vararg) -> nothing,
        eltype(indices);
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

"""
    foldl(step, xf::Transducer, reducible; init, simd)
    foldl(step, ed::Eduction; init, simd)

The first form is a shorthand for `mapfoldl(xf, Completing(step),
reducible)`.  It is intended to be used with a `do` block.  It is also
equivalent to `foldl(step, eduction(xf, itr))`.

`foldl(step, ed)` is useful when calling transducers in a tight loop
where setup cost for `foldl(step, xf, reducible)`, `mapfoldl(xf, step,
reducible)`, etc. is not negligible.  See [`setinput`](@ref) for how
to reset input collection of an `Eduction`.

See: [`mapfoldl`](@ref).

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
function Base.foldl(step, xform::Transducer, itr;
                    kw...)
    mapfoldl(xform, Completing(step), itr; kw...)
end

@inline Base.foldl(step, ed::Eduction; init=MissingInit(), kwargs...) =
    unreduced(transduce(reform(ed.rf, Completing(step)), init, ed.coll;
                        kwargs...))

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
Base.foreach(eff, ed::Eduction; kwargs...) =
    transduce(reform(ed.rf, SideEffect(eff)), nothing, ed.coll;
              kwargs...)

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
`ctype` is inferred from `xf` if not specified.

# Examples
```jldoctest
julia> using Transducers

julia> ch1 = Channel(Filter(isodd), 1:5);

julia> ch2 = Channel(Map(x -> 2x - 1), ch1);

julia> ed = eduction(Map(x -> 1:x), ch2);

julia> ch3 = Channel(Cat(), ed);

julia> typeof(ch1) === typeof(ch2) === typeof(ch3) === Channel{Int}
true

julia> foreach(PartitionBy(isequal(1)), ch3) do input
           @show input
       end;
input = [1, 1]
input = [2, 3, 4, 5]
input = [1]
input = [2, 3, 4, 5, 6, 7, 8, 9]
```
"""
Base.Channel(xform::Transducer, itr;
             ctype::Type = _chan_ctype(xform, itr),
             kwargs...) =
    Channel(; ctype = ctype, kwargs...) do chan
        foreach(x -> put!(chan, x), xform, itr)
        return
    end

function _chan_ctype(xform, itr)
    ctype = outtype(xform, ieltype(itr))
    if ctype === Union{}
        error("""
$_non_executable_transducer_msg
Use `mapfoldl` etc. with `init` argument to run the transducer
forcefully and find out which one causes the problem.
""")
    end
    return ctype
end

Base.Channel(xform::Transducer, ed::Eduction; kwargs...) =
    Channel(Transducer(ed) |> xform, ed.coll; kwargs...)

Base.Channel(ed::Eduction; kwargs...) =
    Channel(Transducer(ed), ed.coll; kwargs...)
