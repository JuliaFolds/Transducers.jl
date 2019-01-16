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

julia> maybe_usesimd(Map(identity), false)
Map(identity)

julia> maybe_usesimd(Map(identity), true)
Transducers.UseSIMD{false}() |>
    Map(identity)

julia> maybe_usesimd(Cat(), true)
Cat() |>
    Transducers.UseSIMD{false}()

julia> maybe_usesimd(Map(sin) |> Cat() |> Map(cos), :ivdep)
Map(sin) |>
    Cat() |>
    Transducers.UseSIMD{true}() |>
    Map(cos)

julia> maybe_usesimd(Map(sin) |> Cat() |> Map(cos) |> Cat() |> Map(tan), true)
Map(sin) |>
    Cat() |>
    Map(cos) |>
    Cat() |>
    Transducers.UseSIMD{false}() |>
    Map(tan)
```
"""
maybe_usesimd(xform::Transducer, simd::Union{Bool,Symbol}) =
    if simd === true
        usesimd(xform, UseSIMD{false}())
    elseif simd === :ivdep
        usesimd(xform, UseSIMD{true}())
    elseif simd === false
        xform
    else
        error("Unknown `simd` argument: ", simd)
    end

"""
    usesimd(xform::Transducer, xfsimd::UseSIMD)

Wrap the inner-most loop of Transducer `xform` with `UseSIMD{ivdep}`.
It's almost equivalent to `UseSIMD{ivdep}() |> xform` except that
`UseSIMD{ivdep}()` is inserted after the inner-most `Cat` if `xform`
includes `Cat`.
"""
function usesimd(xform::Transducer, xfsimd::UseSIMD)
    xf, used = _usesimd(xform, xfsimd)
    if used
        return xf
    else
        return xfsimd |> xf
    end
end

_usesimd(xf, ::Any) = xf, false
_usesimd(xf::Cat, xfsimd) = xf |> xfsimd, true

function _usesimd(xf::Composition, xfsimd)
    inner, used = _usesimd(xf.inner, xfsimd)
    return xf.outer |> inner, used
end

function _usesimd(xf::Composition{<:Cat}, xfsimd)
    inner, used = _usesimd(xf.inner, xfsimd)
    if used
        return xf.outer |> inner, true
    else
        return xf.outer |> xfsimd |> inner, true
    end
end
