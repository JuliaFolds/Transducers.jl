# --- Transducible processes

"""
    __foldl__(rf, init, reducible::T, _complete = complete)

Left fold a `reducible` with reducing function `rf` and initial value
`init`.

See also: [`@return_if_reduced`](@ref).
"""
__foldl__

nocomplete(_, result) = result

function __foldl__(rf, init, coll, _complete = complete)
    ret = iterate(coll)
    ret === nothing && return _complete(rf, init)

    # Some Transducers like PartitionBy does a special type-unstable
    # thing in the first iteration.  Let's try to make the main loop
    # type-stable by hoisting it out.  It won't work when they are
    # wrapped by filter-like Transducers but it may be a good
    # optimization to cover a good amount of cases anyway.
    x, state = ret
    val = next(rf, init, x)
    @return_if_reduced _complete(rf, val)
    while (ret = iterate(coll, state)) !== nothing
        x, state = ret
        val = next(rf, val, x)
        @return_if_reduced _complete(rf, val)
    end
    return _complete(rf, val)
end

# TODO: use IndexStyle
@inline function __foldl__(rf, init, arr::AbstractArray, _complete = complete)
    isempty(arr) && return _complete(rf, init)
    val = next(rf, init, @inbounds arr[firstindex(arr)])
    @return_if_reduced _complete(rf, val)
    for i in firstindex(arr) + 1:lastindex(arr)
        val = next(rf, val, @inbounds arr[i])
        @return_if_reduced _complete(rf, val)
    end
    return _complete(rf, val)
end

function __simple_foldl__(rf, val, itr)
    for x in itr
        val = next(rf, val, x)
        @return_if_reduced complete(rf, val)
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
    return __simple_foldl__(rf, start(rf, init), coll)
end

"""
    mapfoldl(xf, step, itr; init) :: T
    transduce(xf, step, init, itr) :: Union{T, Reduced{T}}

Compose transducer `xf` with reducing step function `step` and reduce
`itr` using it.

!!! warning
    `transduce` differs from `mapfoldl` as `Reduced{T}` is returned if
    the transducer `xf` or `step` aborts the reduction.

This API is modeled after $(_cljref("transduce")).

# Arguments
- `xf::Transducer`: A transducer.
- `step`: A callable which accepts 1 and 2 arguments.  If it only
  accepts 2 arguments, wrap it by [`Completing`](@ref) to add
  [`complete`](@ref) protocol.
- `init`: An initial value fed to the first argument to reducing step
  function `step`.
- `itr`: An iterable.

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
    mapfoldl(xf, step, itr; init) :: T
    transduce(xf, step, init, itr) :: Union{T, Reduced{T}}

See [`mapfoldl`](@ref).
"""
transduce

function transduce(xform::Transducer, f, init, coll)
    rf = Reduction(xform, f, eltype(coll))
    return transduce(rf, init, coll)
end

# TODO: should it be an internal?
@inline transduce(rf::Reduction, init, coll) =
    __foldl__(rf, start(rf, init), coll)
# Inlining `transduce` and `__foldl__` were essential for the
# performance for `map!` to be comparable with the native loop.
# See: ../benchmark/bench_filter_map_map!.jl

function mapfoldl_init(xform, step, itr)
    T = outtype(xform, ieltype(itr))
    Base.reduce_empty(step, T)
end

function Base.mapfoldl(xform::Transducer, step, itr;
                       init=mapfoldl_init(xform, step, itr))
    unreduced(transduce(xform, step, init, itr))
end

struct Eduction{F, C}
    rf::F
    coll::C
end

Eduction(xform::Transducer, coll) =
    Eduction(Reduction(xform, push!, ieltype(coll)), coll)

Transducer(ed::Eduction) = Transducer(ed.rf)

transduce(xform::Transducer, f, init, ed::Eduction) =
    transduce(Transducer(ed) |> xform, f, init, ed.coll)

Base.IteratorSize(::Type{<:Eduction}) = Base.SizeUnknown()
Base.IteratorEltype(::Type{<:Eduction}) = Base.EltypeUnknown()

function Base.iterate(ts::Eduction, state = nothing)
    if state === nothing
        cret = iterate(ts.coll)
        cret === nothing && return nothing
        input, cstate = cret

        buffer = finaltype(ts.rf)[]
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
# Exporting `Eduction` could also work.  But `Base` has, e.g.,
# `skipmissing` so maybe this is better for more uniform API.

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
Base.append!(xf::Transducer, to, from) = transduce(xf, push!, to, from)

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
    rf = Reduction(xf, push!, eltype(coll))
    to = finaltype(rf)[]
    return unreduced(transduce(rf, to, coll))
end
# Base.collect(xf, coll) = append!([], xf, coll)

"""
    map!(xf::Transducer, dest, src)

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
function Base.map!(xf::Transducer, dest::AbstractArray, src::AbstractArray)
    # TODO: check that `xf` is non-expansive
    # TODO: support Dict
    indices = eachindex(dest, src)

    #=
    rf = Reduction(
        TeeZip(GetIndex{true}(src) |> xf) |> SetIndex{true}(dest),
        (x, _...) -> x,  # :: Nothing
        eltype(indices))
    =#

    # Following code is (almost) equivalent to the one commented out
    # above.  However, it turned out this is much friendlier to
    # Julia's type system.  The only difference is that I manually set
    # the output type of `TeeZip` to `Tuple{eltype(indices),Any}`.
    # Actual `outtype` may do a better job but the second argument is
    # not used by `SetIndex`.  By not using `TeeZip`'s `outtype`,
    # this avoids type instability.
    rf = Reduction(
        TeeZip(GetIndex{true}(src) |> xf),
        Reduction(SetIndex{true}(dest),
                  (x, _...) -> x,  # :: Nothing
                  Tuple{eltype(indices),Any}),
        eltype(indices))

    transduce(rf, nothing, indices)
    return dest
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
    foldl(step, xf::Transducer, itr; init)
    foldl(step, ed::Eduction; init)

The first form is a shorthand for `mapfoldl(xf, Completing(step), itr; init)`. It is intended to be used with `do` block.  It is also
equivalent to `foldl(step, eduction(xf, itr); init)`.

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
                    init=mapfoldl_init(xform, step, itr))
    mapfoldl(xform, Completing(step), itr, init=init)
end

function Base.foldl(step, ed::Eduction; kw...)
    foldl(step, Transducer(ed), ed.coll; kw...)
end

"""
    foreach(eff, xf::Transducer, itr)
    foreach(eff, ed::Eduction)

Feed the results of `xf` processing items in `itr` into a unary
function `eff` which is used primary for a side-effect.  It is
equivalent to `foreach(eff, eduction(xf, coll))`.  Note that

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

# Examples
```jldoctest
julia> using Transducers

julia> foreach(eduction(Filter(isodd), 1:4)) do input
           @show input
       end
input = 1
input = 3
```
"""
Base.foreach(eff, xform::Transducer, coll) =
    transduce(xform, SideEffect(eff), nothing, coll)
Base.foreach(eff, ed::Eduction) = foreach(eff, Transducer(ed), ed.coll)


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
       end
input = [1, 1]
input = [2, 3, 4, 5]
input = [1]
input = [2, 3, 4, 5, 6, 7, 8, 9]
```
"""
Base.Channel(xform::Transducer, itr;
             ctype = outtype(xform, ieltype(itr)),
             kwargs...) =
    Channel(; ctype = ctype, kwargs...) do chan
        foreach(x -> put!(chan, x), xform, itr)
        return
    end

Base.Channel(xform::Transducer, ed::Eduction; kwargs...) =
    Channel(Transducer(ed) |> xform, ed.coll; kwargs...)

Base.Channel(ed::Eduction; kwargs...) =
    Channel(Transducer(ed), ed.coll; kwargs...)
