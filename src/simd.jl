"""
    UseSIMD{ivdep}()

Tell the reducible to run the inner reducing function using `@simd`.
The reducible can support it using `@simd_if`.
"""
struct UseSIMD{ivdep} <: Transducer end
next(rf::R_{UseSIMD}, result, input) = next(inner(rf), result, input)

# Keep `UseSIMD` as the outer-most transducer when appropriate:
reducingfunction(xf::Transducer, step::R_{UseSIMD}) =
    usesimd(Reduction(xf, inner(step)), xform(step))

# Make sure UseSIMD is the outer-most transducer when UseSIMD is used
# via Cat.
skipcomplete(rf::R_{UseSIMD}) =
    Reduction(xform(rf)::UseSIMD, skipcomplete(inner(rf)))

isivdep(::UseSIMD{ivdep}) where ivdep = ivdep
isivdep(rf::Reduction) = isivdep(xform(rf))

_name_of_transducer_type(xf::UseSIMD) = prefixed_type_name(xf)

"""
    @simd_if rf for ... end

Wrap `for`-loop with `@simd` if the outer most transducer of the
reducing function `rf` is `UseSIMD`.
"""
macro simd_if(rf, loop)
    # Aggressively using `$` since `esc(loop)` did not work with
    # `@simd` macro.
    ex = quote
        if $rf isa $R_{$UseSIMD}
            if $isivdep($rf)
                $Base.@simd ivdep $loop
            else
                $Base.@simd $loop
            end
        else
            $loop
        end
    end
    return esc(ex)
end

const SIMDFlag = Union{Bool, Symbol, Val{true}, Val{false}, Val{:ivdep}}

"""
    maybe_usesimd(xform, simd)

Insert `UseSIMD` to `xform` if appropriate.

# Arguments
- `xform::Transducer`
- `simd`: `false`, `true`, or `:ivdep`.

# Examples
```jldoctest
julia> using Transducers
       using Transducers: maybe_usesimd

julia> maybe_usesimd(reducingfunction(Map(identity), right), false)
Reduction(
    Map(identity),
    BottomRF(
        Transducers.right))

julia> maybe_usesimd(reducingfunction(Map(identity), right), true)
Reduction(
    Transducers.UseSIMD{false}(),
    Reduction(
        Map(identity),
        BottomRF(
            Transducers.right)))

julia> maybe_usesimd(reducingfunction(Cat(), right), true)
Reduction(
    Cat(),
    Reduction(
        Transducers.UseSIMD{false}(),
        BottomRF(
            Transducers.right)))

julia> maybe_usesimd(opcompose(Map(sin), Cat(), Map(cos))'(right), :ivdep)
Reduction(
    Map(sin),
    Reduction(
        Cat(),
        Reduction(
            Transducers.UseSIMD{true}(),
            Reduction(
                Map(cos),
                BottomRF(
                    Transducers.right)))))

julia> maybe_usesimd(
           opcompose(Map(sin), Cat(), Map(cos), Cat(), Map(tan))'(right),
           true,
       )
Reduction(
    Map(sin),
    Reduction(
        Cat(),
        Reduction(
            Map(cos),
            Reduction(
                Cat(),
                Reduction(
                    Transducers.UseSIMD{false}(),
                    Reduction(
                        Map(tan),
                        BottomRF(
                            Transducers.right)))))))
```
"""
maybe_usesimd(rf::AbstractReduction, simd::SIMDFlag) =
    if has(rf, UseSIMD)
        # An optimization; shortcut everything if SIMD is already
        # enabled.
        rf
    elseif simd === Val(true) || simd === true
        usesimd(rf, UseSIMD{false}())
    elseif simd === Val(:ivdep) || simd === :ivdep
        usesimd(rf, UseSIMD{true}())
    elseif simd === Val(false) || simd === false
        rf
    else
        error("Unknown `simd` argument: ", simd)
    end

"""
    usesimd(rf::Reduction, xfsimd::UseSIMD)

Wrap the inner-most loop of reducing function `rf` with `xfsimd`.
`xfsimd` is inserted after the inner-most `Cat` if `rf` includes
`Cat`.
"""
function usesimd(rf0::AbstractReduction, xfsimd::UseSIMD)
    rf, used = _usesimd(rf0, xfsimd)
    if used
        return rf
    else
        return prependxf(rf, xfsimd)
    end
end

_usesimd(rf::BottomRF, ::Any) = rf, false

function _usesimd(rf::AbstractReduction, xfsimd)
    rf_inner, used = _usesimd(inner(rf), xfsimd)
    return setinner(rf, rf_inner), used
end

function _usesimd(rf::R_{Cat}, xfsimd)
    rf_inner, used = _usesimd(inner(rf), xfsimd)
    if used
        return setinner(rf, rf_inner), true
    else
        return setinner(rf, prependxf(rf_inner, xfsimd)), true
    end
end
