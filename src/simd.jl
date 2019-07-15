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

maybeignore(rf, acc) = isivdep(rf) ? nothing : acc

_name_of_transducer_type(xf::UseSIMD) = prefixed_type_name(xf)

findaccumulators(::Any) = []
findaccumulators(ex::Expr) =
    if ex.head === :macrocall && ex.args[1] === Symbol("@next!")
        @argcheck length(ex.args) === 5
        rf, acc, input = ex.args[3:end]
        return Any[acc::Symbol]
    else
        return mapfoldl(findaccumulators, append!, ex.args; init=[])
    end

ivdepcompat(acc, x) = x
function ivdepcompat(acc, ex::Expr)
    # TODO: detect Transducers.@next etc.
    if (
        (ex.head === :macrocall && ex.args[1] === Symbol("@next")) ||
        (ex.head === :call && ex.args[1] === :next)
    )
        error("Use `@next!` inside `@simd_if`.")
    elseif ex.head === :macrocall && ex.args[1] === Symbol("@next!")
        @argcheck length(ex.args) === 5
        rf, acc′, input = ex.args[3:end]
        # No loop-carried memory dependencies are allowed.
        # However, to support `TeeZip`, `acc` must still be
        # supplied:
        return quote
            $next($rf, $acc, $input)
            nothing
        end
    else
        return Expr(ex.head, ivdepcompat.(Ref(acc), ex.args)...)
    end
end

"""
    @simd_if rf for ... end

Wrap `for`-loop with `@simd` if the outer most transducer of the
reducing function `rf` is `UseSIMD`.

The [`next`](@ref) must be called via `@next!` macro.  `@simd_if`
appropriately choose to not use `result isa Reduced && return result`
when SIMD is enabled.  It also makes sure that the state returned
by `next` is ignored when `ivdep` is specified.
"""
macro simd_if(rf, loop)
    accs = findaccumulators(loop)
    if length(accs) == 0
        error(
            "No call of the form `@next!(rf, acc, input)` is found.\n",
            "`@next(rf, acc, input)` and `next(rf, acc, input)` are not",
            " supported inside `@simd_if`."
        )
    elseif length(accs) > 1
        error("Multiple `@next!(rf, acc, input)` statements found.")
    end
    acc, = accs
    @gensym acc0
    # Aggressively using `$` since `esc(loop)` did not work with
    # `@simd` macro.
    ex = quote
        if $rf isa $R_{$UseSIMD}
            if $isivdep($rf)
                $acc0 = $acc  # must not change during the loop
                $Base.@simd ivdep $(ivdepcompat(acc0, loop))
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
    check_no_ivdep(::SIMDFlag)
    check_no_ivdep(; simd=Val(false), kwargs...)
"""
@inline check_no_ivdep(simd) = simd
@inline check_no_ivdep(simd::Symbol) =
    simd == :ivdep ? check_no_ivdep(Val(:ivdep)) : simd
@noinline check_no_ivdep(::Val{:ivdep}) =
    throw(ArgumentError(string(
        "`simd=:ivdep` must not be used for generic `foldl` or `reduce`.",
        " Please use `foreach`."
    )))
check_no_ivdep(; simd=Val(false), _...) = check_no_ivdep(simd)

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
Reduction{▶ NOTYPE}(
    Map(identity),
    BottomRF{▶ NOTYPE}(
        Transducers.right))

julia> maybe_usesimd(reducingfunction(Map(identity), right), true)
Reduction{▶ NOTYPE}(
    Transducers.UseSIMD{false}(),
    Reduction{▶ NOTYPE}(
        Map(identity),
        BottomRF{▶ NOTYPE}(
            Transducers.right)))

julia> maybe_usesimd(reducingfunction(Cat(), right), true)
Reduction{▶ NOTYPE}(
    Cat(),
    Reduction{▶ NOTYPE}(
        Transducers.UseSIMD{false}(),
        BottomRF{▶ NOTYPE}(
            Transducers.right)))

julia> maybe_usesimd(reducingfunction(Map(sin) |> Cat() |> Map(cos), right), :ivdep)
Reduction{▶ NOTYPE}(
    Map(sin),
    Reduction{▶ NOTYPE}(
        Cat(),
        Reduction{▶ NOTYPE}(
            Transducers.UseSIMD{true}(),
            Reduction{▶ NOTYPE}(
                Map(cos),
                BottomRF{▶ NOTYPE}(
                    Transducers.right)))))

julia> maybe_usesimd(
           reducingfunction(
               Map(sin) |> Cat() |> Map(cos) |> Cat() |> Map(tan),
               right,
           ),
           true,
       )
Reduction{▶ NOTYPE}(
    Map(sin),
    Reduction{▶ NOTYPE}(
        Cat(),
        Reduction{▶ NOTYPE}(
            Map(cos),
            Reduction{▶ NOTYPE}(
                Cat(),
                Reduction{▶ NOTYPE}(
                    Transducers.UseSIMD{false}(),
                    Reduction{▶ NOTYPE}(
                        Map(tan),
                        BottomRF{▶ NOTYPE}(
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
