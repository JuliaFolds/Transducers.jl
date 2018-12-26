# --- Transducing contexts

function __foldl__(rf, init, coll)
    ret = iterate(coll)
    ret === nothing && return complete(rf, init)

    # TODO: benchmark this with simple_foldl.

    # Some Transducers like PartitionBy does a special type-unstable
    # thing in the first iteration.  Let's try to make the main loop
    # type-stable by hoisting it out.  It won't work when they are
    # wrapped by filter-like Transducers but it may be a good
    # optimization to cover a good amount of cases anyway.
    x, state = ret
    val = next(rf, init, x)
    val isa Reduced && return Reduced(complete(rf, unreduced(val)))
    while (ret = iterate(coll, state)) !== nothing
        x, state = ret
        val = next(rf, val, x)
        val isa Reduced && return Reduced(complete(rf, unreduced(val)))
    end
    return complete(rf, val)
end

# TODO: use IndexStyle
@inline function __foldl__(rf, init, arr::AbstractArray)
    isempty(arr) && return complete(rf, init)
    val = next(rf, init, @inbounds arr[firstindex(arr)])
    val isa Reduced && return Reduced(complete(rf, unreduced(val)))
    for i in firstindex(arr) + 1:lastindex(arr)
        val = next(rf, val, @inbounds arr[i])
        val isa Reduced && return Reduced(complete(rf, unreduced(val)))
    end
    return complete(rf, val)
end

function __simple_foldl__(rf, val, itr)
    for x in itr
        val = next(rf, val, x)
        isreduced(val) && return val
    end
    return complete(rf, val)
end

"""
    simple_transduce(step, xform, init, coll)

Simplified version of [`transduce`](@ref).  For simple transducers Julia
may be able to emit a good code.  This function exists only for
performance tuning.
"""
function simple_transduce(f, xform, init, coll)
    rf = Reduction(xform, f, eltype(coll))
    return __simple_foldl__(rf, start(rf, init), coll)
end

"""
    mapfoldl(xf, step, init, itr) :: T
    transduce(step, xf, init, itr) :: Union{T, Reduced{T}}

Compose transducer `xf` with reducing step function `step` and
reduce `iter` using it.

!!! warning
    The order of the first two arguments are different in `mapfoldl`
    and `transduce`.  The order of argument for `mapfoldl` is chosen
    so that it is compatible with standard `mapfoldl`.  On the other
    hand, `transduce` takes `step` function as the first argument to
    allow using it with a `do` block:

    ```
    transduce(xf, init, itr) do state, input
        # computation for combining `state` and `input`
    end
    ```

    Note also that `transduce` differs from `mapfoldl` as `Reduced{T}`
    is returned if the transducer `xf` or `step` aborts the reduction.

The name `transduce` is taken from $(_cljref("transduce")) although
the order of arguments is different.  Actually, `mapfoldl` is closer
to the Clojure's version.

# Arguments
- `xf::Transducer`: A transducer.
- `step`: A callable which accepts 1 and 2 arguments.  If it only
  accepts 2 arguments, wrap it by [`Completing`](@ref) to add
  [`complete`](@ref) protocol.
- `init`: An initial value fed to the first argument to reducing step
  function `step`.
- `itr`: An iterable.
"""
(transduce, mapfoldl)

function transduce(f, xform::Transducer, init, coll)
    rf = Reduction(xform, f, eltype(coll))
    return transduce(rf, init, coll)
end

# TODO: should it be an internal?
@inline transduce(rf::Reduction, init, coll) =
    __foldl__(rf, start(rf, init), coll)
# Inlining `transduce` and `__foldl__` were essential for the
# performance for `map!` to be comparable with the native loop.
# See: ../benchmark/bench_filter_map_map!.jl

Base.mapfoldl(xform::Transducer, f, init, itr) =
    unreduced(transduce(f, xform, init, itr))

struct Eduction{F, C}
    rf::F
    coll::C
end

Eduction(xform::Transducer, coll) =
    Eduction(Reduction(xform, push!, ieltype(coll)), coll)

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
* Reducible (TODO); i.e., it can be handled by [`transduce`](@ref) efficiently.

This API is modeled after $(_cljref("eduction")).
"""
eduction(xform, coll) = Eduction(xform, coll)
# Exporting `Eduction` could also work.  But `Base` has, e.g.,
# `skipmissing` so maybe this is better for more uniform API.

"""
    append!(xf::Transducer, dest, src)

This API is modeled after $(_cljref("into")).
"""
Base.append!(xf::Transducer, to, from) = transduce(push!, xf, to, from)

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
"""
function Base.map!(xf::Transducer, dest::AbstractArray, src::AbstractArray)
    # TODO: check that `xf` is non-expansive
    # TODO: support Dict
    indices = eachindex(dest, src)
    rf = Reduction(
        TeeZip(GetIndex{true}(src) |> xf) |> SetIndex{true}(dest),
        (x, _...) -> x,  # :: Nothing
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
"""
Base.copy!(xf::Transducer, dest, src) = append!(xf, empty!(dest), src)
