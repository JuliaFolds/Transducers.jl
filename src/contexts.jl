# --- Transducing contexts

Base.foldl(rf::Reduction, init, coll) = unreduced(foldld(rf, init, coll))
foldld(rf::Reduction, init, coll) = __foldl__(rf, start(rf, init), coll)

function __foldl__(rf, init, coll)
    ret = iterate(coll)
    ret === nothing && return init

    # TODO: benchmark this with simple_foldl.

    # Some Transducers like PartitionBy does a special type-unstable
    # thing in the first iteration.  Let's try to make the main loop
    # type-stable by hoisting it out.  It won't work when they are
    # wrapped by filter-like Transducers but it may be a good
    # optimization to cover a good amount of cases anyway.
    x, state = ret
    val = next(rf, init, x)
    while (ret = iterate(coll, state)) !== nothing
        x, state = ret
        val = next(rf, val, x)
        isreduced(val) && return val
    end
    return val
end

# function simple_foldl(rf, val, coll)
#     for x in coll
#         val = next(rf, val, x)
#         isreduced(val) && return val[]
#     end
#     return val
# end

"""
    transduce(xf, f, init, iter)

Compose transducer `xf` with reducing step function `f` and
reduce `iter` using it.

This API is modeled after [`transduce` in Clojure](
https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/transduce).

# Arguments
- `xf::Transducer`: A transducer.
- `f`: A callable which accepts 1 and 2 arguments.  If it only
  accepts 2 arguments, wrap it by [`Completing`](@ref) to add
  [`complete`](@ref) protocol.
- `init`: An initial value fed to the first argument to reducing step
  function `f`.
- `iter`: An iterable.
"""
function transduce(xform::Transducer, f, init, coll)
    rf = Reduction(xform, f, eltype(coll))
    return transduce(rf, init, coll)
end

# TODO: should it be an internal?
transduce(rf::Reduction, init, coll) = complete(rf, foldl(rf, init, coll))

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

This API is modeled after [`eduction` in Clojure](
https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/eduction).
"""
eduction(xform, coll) = Eduction(xform, coll)
# Exporting `Eduction` could also work.  But `Base` has, e.g.,
# `skipmissing` so maybe this is better for more uniform API.

"""
    append!(xf::Transducer, dest, src)

This API is modeled after [`into` in Clojure](
https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/into).
"""
Base.append!(xf::Transducer, to, from) = transduce(xf, push!, to, from)

function Base.collect(xf::Transducer, coll)
    rf = Reduction(xf, push!, eltype(coll))
    to = finaltype(rf)[]
    return transduce(rf, to, coll)
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
        TeeZip(Map(i -> src[i]) |> xf),
        Completing((dest, (i, x)) -> (dest[i] = x; dest)),
        eltype(indices))
    transduce(rf, dest, indices)
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
