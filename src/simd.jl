"""
    UseSIMD{ivdep}()

Tell the reducible to run the inner reducing function using `@simd`.
The reducible can support it using `@simd_if`.
"""
struct UseSIMD{ivdep} <: Transducer end
outtype(::UseSIMD, intype) = intype
next(rf::R_{UseSIMD}, result, input) = next(inner(rf), result, input)

# Make sure UseSIMD is the outer-most transducer when UseSIMD is used
# via Cat.
skipcomplete(rf::R_{UseSIMD}) =
    Reduction(xform(rf)::UseSIMD,
              skipcomplete(inner(rf)),
              InType(rf))

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

julia> maybe_usesimd(eduction(Map(identity), 1:1).rf, false)
Reduction{▶ Int64}(
    Map(identity),
    BottomRF{▶ Int64}(
        Completing{typeof(push!)}(push!)))

julia> maybe_usesimd(eduction(Map(identity), 1:1).rf, true)
Reduction{▶ Int64}(
    Transducers.UseSIMD{false}(),
    Reduction{▶ Int64}(
        Map(identity),
        BottomRF{▶ Int64}(
            Completing{typeof(push!)}(push!))))

julia> maybe_usesimd(eduction(Cat(), 1:1).rf, true)
Reduction{▶ Int64}(
    Cat(),
    Reduction{▶ Int64}(
        Transducers.UseSIMD{false}(),
        BottomRF{▶ Int64}(
            Completing{typeof(push!)}(push!))))

julia> maybe_usesimd(eduction(Map(sin) |> Cat() |> Map(cos), 1:1).rf, :ivdep)
Reduction{▶ Int64}(
    Map(sin),
    Reduction{▶ Float64}(
        Cat(),
        Reduction{▶ Float64}(
            Transducers.UseSIMD{true}(),
            Reduction{▶ Float64}(
                Map(cos),
                BottomRF{▶ Float64}(
                    Completing{typeof(push!)}(push!))))))

julia> maybe_usesimd(eduction(Map(sin) |> Cat() |> Map(cos) |> Cat() |> Map(tan), 1:1).rf, true)
Reduction{▶ Int64}(
    Map(sin),
    Reduction{▶ Float64}(
        Cat(),
        Reduction{▶ Float64}(
            Map(cos),
            Reduction{▶ Float64}(
                Cat(),
                Reduction{▶ Float64}(
                    Transducers.UseSIMD{false}(),
                    Reduction{▶ Float64}(
                        Map(tan),
                        BottomRF{▶ Float64}(
                            Completing{typeof(push!)}(push!))))))))
```
"""
maybe_usesimd(rf::AbstractReduction, simd::Union{Bool,Symbol}) =
    if simd === true
        usesimd(rf, UseSIMD{false}())
    elseif simd === :ivdep
        usesimd(rf, UseSIMD{true}())
    elseif simd === false
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
