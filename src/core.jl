# --- Types

"""
    Reduced

The type signaling transducible processes to abort.

!!! note
    Call [`reduced`](@ref) function for aborting the transducible
    process since [`reduced`](@ref) makes sure `x` is not doubly
    wrapped.  `Reduced` is meant to be used as `x isa Reduced` for
    checking if the result from [`transduce`](@ref) is due to early
    termination.

See [`reduced`](@ref), [`unreduced`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> function step_demo(y, x)
           if x > 5
               return reduced(y)
           else
               return y + x
           end
       end;

julia> result = transduce(Map(identity), Completing(step_demo), 0, 1:10)
Reduced(15)

julia> result isa Reduced
true

julia> unreduced(result)
15

julia> result = transduce(Map(identity), Completing(step_demo), 0, 1:4)
10

julia> result isa Reduced
false

julia> unreduced(result)
10
```
"""
struct Reduced{T}
    value::T
end

Base.:(==)(x::Reduced, y::Reduced) = x.value == y.value

Base.show(io::IO, x::Reduced) = _default_show(io, x)

isreduced(::Reduced) = true
isreduced(::Any) = false

"""
    reduced([x = nothing])

Stop transducible process with the final value `x` (default:
`nothing`).  Return `x` as-is if it already is a `reduced` value.

See [`Reduced`](@ref), [`unreduced`](@ref).

$(_thx_clj("ensure-reduced"))

# Examples
```jldoctest
julia> using Transducers

julia> foldl(Enumerate(), "abcdef"; init=0) do y, (i, x)
           if x == 'd'
               return reduced(y)
           end
           return y + i
       end
6

julia> foreach(Enumerate(), "abc") do (i, x)
           println(i, ' ', x)
           if x == 'b'
               return reduced()
           end
       end;
1 a
2 b
```
"""
reduced(x::Reduced) = x
reduced(x) = Reduced(x)
reduced() = reduced(nothing)

"""
    unreduced(x)

Unwrap `x` if it is a `Reduced`; do nothing otherwise.

See [`Reduced`](@ref), [`reduced`](@ref).

$(_thx_clj("unreduced"))
"""
unreduced(x::Reduced) = x.value
unreduced(x) = x

"""
    @return_if_reduced expr

It transforms the given expression to:

```julia
val = expr
val isa Reduced && return val
val
```

See also [`@next`](@ref).

!!! compat "Transducers.jl 0.3"

    In v0.2, the calling convention was `@return_if_reduced
    complete(rf, val)` and it was transformed to `val isa Reduced &&
    return reduced(complete(rf, unreduced(val)))`.  For the rationale
    behind the change, see [this commit
    message](https://github.com/JuliaFolds/Transducers.jl/commit/74f8961fea97b746cb097b27aa5a5761e9bf4dae).

# Examples
```jldoctest; filter = [r"(var\\")?#[0-9]+#val(\\")?", r"#=.*?=#"]
julia> using Transducers: @return_if_reduced

julia> @macroexpand @return_if_reduced f(x)
quote
    #158#val = f(x)
    #= ... =#
    begin
        #158#val isa Transducers.Reduced && return #158#val
        #= ... =#
        #158#val
    end
end
```
"""
macro return_if_reduced(ex)
    code = :(val isa Reduced && return val; val)
    if ex isa Expr && ex.head == :call && length(ex.args) == 3
        val = esc(ex)
        return quote
            if $(esc(ex.args[1])) === complete
                error("""
                Calling `@return_if_reduced complete(rf, val)` is now an error.
                Please use `@return_if_reduced val`.
                """)
            end
            val = $val
            $code
        end
    end
    val = esc(ex)
    :(val = $val; $code)
end

"""
    @next(rf, state, input)

It is expanded to

```julia
result = next(rf, state, input)
result isa Reduced && return result
result
```

This is usually the best way to call `next` as checking for `Reduced`
is required to support early termination.

See also: [`next`](@ref), [`Reduced`](@ref), [`@return_if_reduced`](@ref).
"""
macro next(rf, state, input)
    quote
        result = next($(esc.((rf, state, input))...))
        result isa Reduced && return result
        result
    end
end


abstract type Transducer end
abstract type AbstractFilter <: Transducer end

struct Composition{XO <: Transducer, XI <: Transducer} <: Transducer
    outer::XO
    inner::XI
end

struct IdentityTransducer <: Transducer end

has(xf::Transducer, T::Type) = xf isa T
has(xf::Composition, T::Type) = has(xf.outer, T) || has(xf.inner, T)

Base.broadcastable(xf::Transducer) = Ref(xf)

"""
    Transducer

The abstract type for transducers.

A transducer `xf` can be used as both iterator transformation
`xf(itr)` and reducing function transformation `xf'(rf)`.

See also [`adjoint`](@ref) for `xf'(rf)`.

!!! compat "Transducers.jl 0.4.XX"
    The call overload `xf(rf)` requires Transducers.jl 0.4.XX or later.

!!! note
    The call overload `xf(rf)` requires Julia 1.3 or later.
    For older Julia versions, use [`eduction`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> xs = Map(inv)(2:2:4)
2-element StepRange{Int64,Int64} |>
    Map(inv)

julia> collect(xs)
2-element Array{Float64,1}:
 0.5
 0.25

julia> rf = Map(inv)'(+)
Reduction(
    Map(inv),
    BottomRF(
        +))

julia> rf(1, 4)  # +(1, inv(4))
1.25
```
"""
Transducer

"""
    AbstractFilter <: Transducer

The abstract type for filter-like transducers.
"""
AbstractFilter

abstract type AbstractReduction{innertype} <: Function end

if VERSION >= v"1.3"  # post https://github.com/JuliaLang/julia/pull/31916
    @inline (rf::AbstractReduction)(state, input) = next(rf, state, input)
end

InnerType(::Type{<:AbstractReduction{T}}) where T = T

ConstructionBase.constructorof(::Type{T}) where {T <: AbstractReduction} = T

"""
    Transducers.inner(rf::R_)

Return the inner reducing function of `rf`.
"""
inner(rf::AbstractReduction) = rf.inner

"""
    Transducers.xform(rf::R_{X}) -> xf :: X

Return the transducer `xf` associated with `rf`.  Returned transducer
`xf` is "atomic"; i.e., it is not a `Composition` transducer type.
"""
xform(rf::AbstractReduction) = rf.xform

has(rf::AbstractReduction, T::Type{<:Transducer}) = has(Transducer(rf), T)

struct BottomRF{F} <: AbstractReduction{F}
    inner::F
end

ensurerf(rf::AbstractReduction) = rf
ensurerf(f) = BottomRF(f)

# Not calling rf.inner(result, input) etc. directly since it can be
# `Completing` etc.
start(rf::BottomRF, result) = start(inner(rf), result)
@inline next(rf::BottomRF, result, input) = next(inner(rf), result, input)
complete(rf::BottomRF, result) = complete(inner(rf), result)
combine(rf::BottomRF, a, b) = combine(inner(rf), a, b)

Transducer(::BottomRF) = IdentityTransducer()

as(rf::T, ::Type{T}) where T = rf
as(rf, T::Type) = as(inner(rf), T)

# In clojure a reduction function is one of signature
# whatever, input -> whatever
#
# The `Reduction` type corresponds to such a function, but keeps extra information:
# * `xform` and `inner` are a decomposition of the reduction function into
#   a transducer `xform` and an inner reduction function `inner`.
#   `inner` can be either a `Reduction` or a function with arity-2 and arity-1 methods
#
struct Reduction{X <: Transducer, I} <: AbstractReduction{I}
    xform::X
    inner::I

    Reduction{X, I}(xf, inner) where {X, I} = new{X, I}(xf, inner)

    Reduction(xf::X, inner::I) where {X <: Transducer, I} =
        if I <: AbstractReduction
            new{X, I}(xf, inner)
        else
            rf = ensurerf(inner)
            new{X, typeof(rf)}(xf, rf)
        end
end

if VERSION < v"1.3"  # pre https://github.com/JuliaLang/julia/pull/31916
    @inline (rf::Reduction)(state, input) = next(rf, state, input)
end

prependxf(rf::AbstractReduction, xf) = Reduction(xf, rf)
setinner(rf::Reduction, inner) = Reduction(xform(rf), inner)

Transducer(rf::Reduction) =
    if inner(rf) isa BottomRF
        xform(rf)
    else
        Composition(xform(rf), Transducer(inner(rf)))
    end

# This is a non-ideal definition as it may not return a `Reduction`.
# Making this less non-ideal requires to replace all call/overloads of
# `Reduction` to `AbstractReduction`.
Reduction(::IdentityTransducer, inner) = ensurerf(inner)

"""
    Transducers.R_{X}

When defining a transducer type `X`, it is often required to dispatch
on type `rf::R_{X}` (Reducing Function) which bundles the current
transducer `xform(rf)::X` and the inner reducing function
`inner(rf)::R_`.
"""
const R_{X} = Reduction{<:X}

@inline function Reduction(xf_::Composition, f)
    xf = _normalize(xf_)
    # @assert !(xf.outer isa Composition)
    return Reduction(xf.outer, Reduction(xf.inner, f))
end

@inline _normalize(xf) = xf
@inline _normalize(xf::Composition{<:Composition}) = xf.outer |> xf.inner

"""
    f ⨟ g
    g ∘ f
    opcompose(f, g)
    compose(g, f)

Composition of transducers.

!!! compat "Transducers.jl 0.4.XX"

    Transducers.jl 0.4.XX or later is required for composing
    transducers with `∘` and other operators and functions derived
    from it.

    Transducers written as `f |> g |> h` in previous versions of
    Transducers.jl can now be written as `f ⨟ g ⨟ h` (in Julia 1.5 or
    later) or `opcompose(f, g, h)`.

!!! note

    "op" in `opcompose` does not stand for _operator_; it stands for
    _opposite_.
"""
@inline Base.:∘(g::Transducer, f::Transducer) = Composition(f, g)
@inline Base.:∘(g::Transducer, f::Composition) = g ∘ f.inner ∘ f.outer
@inline Base.:∘(f::Transducer, ::IdentityTransducer) = f
@inline Base.:∘(::IdentityTransducer, f::Transducer) = f
@inline Base.:∘(::IdentityTransducer, f::Composition) = f  # disambiguation

if VERSION >= v"1.3"
    (xf::Transducer)(itr) = eduction(xf, itr)
else
    Base.:|>(itr, xf::Transducer) = eduction(xf, itr)
end

"""
    ReducingFunctionTransform(xf)

The "true" transducer.
"""
struct ReducingFunctionTransform{T <: Transducer} <: Function
    xf::T
end

"""
    xf'

`xf'(rf₁)` is a shortcut for calling `reducingfunction(xf, rf₁)`.

More precisely, adjoint `xf′` of a transducer `xf` is a _reducing
function transform_ `rf₁ -> rf₂`.  That is to say, `xf'` a function
that maps a reducing function `rf₁` to another reducing function
`rf₂`.

# Examples
```jldoctest
julia> using Transducers

julia> y = Map(inv)'(+)(10, 2)
10.5

julia> y == +(10, inv(2))
true
```
"""
Base.adjoint(xf::Transducer) = ReducingFunctionTransform(xf)
Base.adjoint(rxf::ReducingFunctionTransform) = rxf.xf

(f::ReducingFunctionTransform)(rf; kwargs...) =
    reducingfunction(f.xf, rf; kwargs...)

@inline Base.:∘(f::ReducingFunctionTransform, g::ReducingFunctionTransform) = (g' ∘ f')'

"""
    reform(rf, f)

Reset "bottom" reducing function of `rf` to `f`.
"""
reform(rf::Reduction, f) = Reduction(xform(rf), reform(inner(rf), f))
reform(rf::BottomRF, f) = BottomRF(reform(inner(rf), f))
reform(::Any, f) = f

"""
    Transducers.start(rf::R_{X}, state)

This is an optional interface for a transducer.  Default
implementation just calls `start` of the inner reducing function; i.e.,

```julia
start(rf::Reduction, result) = start(inner(rf), result)
```

If the transducer `X` is stateful, it can "bundle" its private state
with `wrap`:

```julia
start(rf::R_{X}, result) = wrap(rf, PRIVATE_STATE, start(inner(rf), result))
```

where `PRIVATE_STATE` is an initial value for the private state that
can be used inside [`next`](@ref) via [`wrapping`](@ref).

See [`Take`](@ref), [`PartitionBy`](@ref), etc. for real-world examples.

Side notes: There is no related API in Clojure's Transducers.
Transducers.jl uses it to implement stateful transducers using "pure"
functions.  The idea is based on a slightly different approach taken
in C++ Transducer library [atria](https://github.com/AbletonAG/atria).
"""
start(rf, init) = initialize(init, rf)
start(rf::Reduction, result) = start(inner(rf), result)
start(rf::R_{AbstractFilter}, result) = start(inner(rf), result)

"""
    Transducers.next(rf::R_{X}, state, input)

This is the only required interface.  It takes the following form
(if `start` is not defined):

```julia
next(rf::R_{X}, result, input) =
    # code calling next(inner(rf), result, possibly_modified_input)
```

When calling `next`, it is almost always a better idea to use the
macro form [`@next`](@ref).  See the details in its documentation.

See [`Map`](@ref), [`Filter`](@ref), [`Cat`](@ref), etc. for
real-world examples.
"""
@inline next(f, result, input) = f(result, input)

# done(rf, result)

"""
    Transducers.complete(rf::R_{X}, state)

This is an optional interface for a transducer.  If transducer `X` has
some internal state, this is the last chance to "flush" the result.

See [`PartitionBy`](@ref), etc. for real-world examples.

If `start(rf::R_{X}, state)` is defined, `complete` **must** unwarp
`state` before returning `state` to the outer reducing function.

!!! compat "Transducers.jl 0.3"

    In Transducers.jl 0.2, `complete` had a fallback implementation
    to automatically call `unwrap` when `wrap` is called in `start`.
    Relying on this fallback implementation is now deprecated.
"""
complete(f, result) = f(result)
complete(rf::AbstractReduction, result) =
    # Not using dispatch to avoid ambiguity
    if ownsstate(rf, result)
        Base.depwarn(
            string(
                "`complete` for ", typeof(xform(rf)), " is not defined.",
                " Automatic implementation of `complete` method will be",
                " disabled in the future."
            ),
            :complete)
        complete(inner(rf), unwrap(rf, result)[2])
    else
        complete(inner(rf), result)
    end

"""
    Transducers.combine(rf::R_{X}, state_left, state_right)

This is an optional interface for a transducer.  If transducer `X` is
stateful (i.e., [`wrap`](@ref) is used in [`start`](@ref)), it has to
be able to combine the private states to support fold functions that
require an associative reducing function such as [`reduce`](@ref).
Typical implementation takes the following form:

```julia
function combine(rf::R_{X}, a, b)
    #   ,---- `ua` and `ub` are the private state of the transducer `X`
    #  /  ,-- `ira` and `irb` are the states of inner reducing functions
    # /  /
    ua, ira = unwrap(rf, a)
    ub, irb = unwrap(rf, b)
    irc = combine(inner(rf), ira, irb)
    uc = # somehow combine private states `ua` and `ub`
    return wrap(rf, uc, irc)
end
```

See [`ScanEmit`](@ref), etc. for real-world examples.
"""
combine(f, a, b) = f(a, b)
combine(rf::Reduction, a, b) =
    # Not using dispatch to avoid ambiguity
    if ownsstate(rf, a)
        # TODO: make sure this branch is compiled out
        error("Stateful transducer ", xform(rf), " does not support `combine`")
    elseif ownsstate(rf, b)
        error("""
        Some thing went wrong in two ways:
        * `combine(rf, a, b)` is called but type of `a` and `b` are different.
        * `xform(rf) = $(xform(rf))` is stateful and does not support `combine`.
        """)
    else
        combine(inner(rf), a, b)
    end

privatestate(::T, state, result) where {T <: AbstractReduction} =
    privatestate(T, state, result)

struct PrivateState{T, S, R}
    state::S
    result::R

    # Rename constructor to make sure that it is always constructed
    # through the factory function:
    global privatestate(::Type{T}, state::S, result::R) where {
        T <: AbstractReduction,
        S,
        R,
    } =
        new{T, S, R}(state, result)
end
# TODO: make it a tuple-like so that I can return it as-is

ConstructionBase.constructorof(::Type{<:PrivateState{T}}) where T =
    (state, result) -> privatestate(T, state, result)

@inline psstate(ps) = ps.state
@inline psresult(ps) = ps.result
@inline setpsstate(ps, x) = @set ps.state = x
@inline setpsresult(ps, x) = @set ps.result = x

ownsstate(::Any, ::Any) = false
ownsstate(::R, ::PrivateState{T}) where {R, T} = R === T
# Using `result isa PrivateState{typeof(rf)}` makes it impossible to
# compile Extrema examples in ../examples/tutorial_missings.jl (it
# took more than 10 min).  See also:
# https://github.com/JuliaLang/julia/issues/30125

"""
    unwrap(rf, result)

Unwrap [`wrap`](@ref)ed `result` to a private state and inner result.
Following identity holds:

```julia
unwrap(rf, wrap(rf, state, iresult)) == (state, iresult)
```

This is intended to be used only in [`complete`](@ref).  Inside
[`next`](@ref), use [`wrapping`](@ref).
"""
unwrap(::T, ps::PrivateState{T}) where {T} = (psstate(ps), psresult(ps))

unwrap(::T1, ::PrivateState{T2}) where {T1, T2} =
    error("""
    `unwrap(rf1, ps)` is used for
    typeof(rf1) = $T1
    while `ps` is created by wrap(rf2, ...) where
    typeof(rf2) = $T2
    """)

# TODO: better error message with unmatched `T`

"""
    wrap(rf::R_{X}, state, iresult)

Pack private `state` for reducing function `rf` (or rather the
transducer `X`) with the result `iresult` returned from the inner
reducing function `inner(rf)`.  This packed result is typically passed
to the outer reducing function.

This is intended to be used only in [`start`](@ref).  Inside
[`next`](@ref), use [`wrapping`](@ref).

!!! note "Implementation detail"

    If `iresult` is a [`Reduced`](@ref), `wrap` actually _un_wraps all
    internal state `iresult` recursively.  However, this is an
    implementation detail that should not matter when writing
    transducers.

Consider a reducing step constructed as

    rf = Reduction(xf₁ |> xf₂ |> xf₃, f)

where each `xfₙ` is a stateful transducer and hence needs a private
state `stateₙ`.  Then, calling `start(rf, result))` is equivalent to

```julia
wrap(rf,
     state₁,                     # private state for xf₁
     wrap(inner(rf),
          state₂,                # private state for xf₂
          wrap(inner(rf).inner,
               state₃,           # private state for xf₃
               result)))
```

or equivalently

```julia
result₃ = result
result₂ = wrap(inner(inner(rf)), state₃, result₃)
result₁ = wrap(inner(rf),        state₂, result₂)
result₀ = wrap(rf,               state₁, result₁)
```

The inner most step function receives the original `result` as the
first argument while transducible processes such as [`foldl`](@ref)
only sees the outer-most "tree" `result₀` during the reduction.

See [`wrapping`](@ref), [`unwrap`](@ref), and [`start`](@ref).
"""
wrap(rf::T, state, iresult) where {T} = privatestate(rf, state, iresult)
wrap(rf, state, iresult::Reduced) = iresult

"""
    wrapping(f, rf, result)

Function `f` must take two argument `state` and `iresult`, and return
a tuple `(state, iresult)`.  This is intended to be used only in
[`next`](@ref), possibly with a `do` block.

```julia
next(rf::R_{MyTransducer}, result, input) =
    wrapping(rf, result) do my_state, iresult
        # code calling `next(inner(rf), iresult, possibly_modified_input)`
        return my_state, iresult  # possibly modified
    end
```

See [`wrap`](@ref), [`unwrap`](@ref), and [`next`](@ref).
"""
@inline function wrapping(f, rf, result)
    state0, iresult0 = unwrap(rf, result)
    state1, iresult1 = f(state0, iresult0)
    return wrap(rf, state1, iresult1)
end

unwrap_all(ps::PrivateState) = unwrap_all(psresult(ps))
unwrap_all(result) = result
unwrap_all(ps::Reduced) = Reduced(unwrap_all(unreduced(ps)))

# isexpansive(::Any) = true
isexpansive(::Transducer) = true
isexpansive(::AbstractFilter) = false
# isexpansive(rf::Reduction) = isexpansive(xform(rf)) || isexpansive(inner(rf))
isexpansive(xf::Composition) = isexpansive(xf.outer) || isexpansive(xf.inner)
# Should it be a type-level trait?

#=
iscontractive(::Any) = false
iscontractive(::AbstractFilter) = true
iscontractive(rf::Reduction) = iscontractive(xform(rf)) && iscontractive(inner(rf))
=#

struct NoComplete <: Transducer end
next(rf::R_{NoComplete}, result, input) = next(inner(rf), result, input)
complete(::R_{NoComplete}, result) = result  # don't call inner complete

"""
    Completing(function)

Wrap a `function` to add a no-op [`complete`](@ref) protocol.  Use it
when passing a `function` without unary method to [`transduce`](@ref)
etc.

$(_thx_clj("completing"))
"""
struct Completing{F} <: _Function  # Note: not a Transducer
    f::F
end

start(rf::Completing, result) = start(rf.f, result)
@inline next(rf::Completing, result, input)  = next(rf.f, result, input)
complete(::Completing, result) = result
combine(rf::Completing, a, b) = combine(rf.f, a, b)

# Apply `Completing` only on the inner-most reducing function so that
# `complete` on transducers are still called.  This is very ugly as it
# does not return a `Completing` object.  But this is required for
# allowing `foldl(reducingfunction(...), ...)` etc.:
Completing(rf::AbstractReduction) = setinner(rf, Completing(inner(rf)))
Completing(rf::BottomRF) = BottomRF(Completing(rf.inner))
Completing(f::Completing) = f

# Currently, `Completing` is recursive while `skipcomplete` is
# non-recursive.  `Completing` only skips `complete` on the inner-most
# (bottom) reducing function (i.e., _not_ including the
# transducers). `skipcomplete` skips `complete` of the outer-most
# reducing function (i.e., including all transducers).

# TODOs for `Completing` and `skipcomplete`:
# 1. Call `complete` outside `__foldl__`.
# 2. Get rid of current `foldl_nocomplete`, `skipcomplete`, and `NoComplete`.
# 3. Replace what `Complete` currently does with `skipcomplete` factory
#    function and then and deprecate `Complete`.
skipcomplete(rf::Reduction) = Reduction(NoComplete(), rf)
skipcomplete(f) = Completing(f)

# Since `Completing <: Function`, the default `show` is a bit ugly.
function Base.show(io::IO, rf::Completing)
    @nospecialize
    if rf === Completing(rf.f)
        print(io, Completing, '(', rf.f, ')')
    else
        invoke(show, Tuple{IO,Any}, io, rf)
    end
end

struct SideEffect{F}  # Note: not a Transducer
    f::F
end

# Completing(rf::SideEffect) = rf

start(rf::SideEffect, result) = start(rf.f, result)
complete(::SideEffect, result) = result
@inline next(rf::SideEffect, _, input) = rf.f(input)

"""
    right([l, ]r) -> r

It is simply defined as

```julia
right(l, r) = r
right(r) = r
```

This function is meant to be used as `step` argument for
[`foldl`](@ref) etc. for extracting the last output of the
transducers.

!!! compat "Transducers.jl 0.3"

    Initial value must be manually specified.  In 0.2, it was
    automatically set to `nothing`.

# Examples
```jldoctest
julia> using Transducers

julia> foldl(right, Take(5), 1:10)
5

julia> foldl(right, Drop(5), 1:3; init=0)  # using `init` as the default value
0
```
"""
right(l, r) = r
right(r) = r

InitialValues.@def right

identityof(::typeof(right), ::Any) = nothing
# This is just a right identity but `right` is useful for left-fold
# context anyway so I guess it's fine.

abstract type Reducible end
abstract type Foldable <: Reducible end
asfoldable(x) = x

"""
    initvalue(initializer::AbstractInitializer) -> init
    initvalue(init) -> init

Materialize the initial value if the input is an `AbstractInitializer`.
Return the input as-is if not.
"""
initvalue(x) = x
_initvalue(rf::Reduction) = initvalue(xform(rf).init)

# A better name for `AbstractInitializer` is `op`-agnostic or something.
abstract type AbstractInitializer end

# For `DefaultInit` and `OptInit`
struct InitOf{IV <: SpecificInitialValue} end
(::InitOf{IV})(::OP) where {IV, OP} = IV{OP}()

# For `Broadcasting`:
Broadcast.broadcastable(f::AbstractInitializer) = Ref(f)
Broadcast.broadcastable(f::InitOf) = Ref(f)

"""
    initialize(initializer, op) -> init
    initialize(init, _) -> init

Return an initial value for `op`.  Throw an error if `initializer`
(e.g., `Init`) creates unknown initial value.

# Examples
```jldoctest; filter = r"(InitialValues\\.)?Init"
julia> using Transducers
       using Transducers: initialize

julia> initialize(Init, +)
Init(+)

julia> initialize(123, +)
123

julia> unknown_op(x, y) = x + 2y;

julia> initialize(Init, unknown_op)
ERROR: IdentityNotDefinedError: `init = Init` is specified but the identity element `Init(op)` is not defined for
    op = unknown_op
[...]
```
"""
initialize(init, op) = init
initialize(::typeof(Init), op) = check_init(Init(op), Init, op)
initialize(f::InitOf, op) = check_init(f(op), f, op)
initialize(init::AbstractInitializer, _) = initvalue(init)

@assert Base.issingletontype(typeof(Init))

function check_init(init::SpecificInitialValue, f, op)
    InitialValues.isknown(init) || throw(IdentityNotDefinedError(op, f))
    return init
end

"""
    OnInit(f)

Call a callable `f` to create an initial value.

See also [`CopyInit`](@ref).

`OnInit` or `CopyInit` must be used whenever using in-place reduction
with [`reduce`](@ref) etc.

# Examples
```jldoctest OnInit
julia> using Transducers

julia> xf1 = Scan(push!, [])
Scan(push!, Any[])

julia> foldl(right, xf1, 1:3)
3-element Array{Any,1}:
 1
 2
 3

julia> xf1
Scan(push!, Any[1, 2, 3])
```

Notice that the array is stored in `xf1` and mutated in-place.  As a
result, second run of `foldl` contains the results from the first
run:

```jldoctest OnInit
julia> foldl(right, xf1, 10:11)
5-element Array{Any,1}:
  1
  2
  3
 10
 11
```

This may not be desired.  To avoid this behavior, create an `OnInit`
object which takes a factory function to create a new initial value.

```jldoctest OnInit; filter = r"#+[0-9]+(\\(\\))?"
julia> xf2 = Scan(push!, OnInit(() -> []))
Scan(push!, OnInit(##9#10()))

julia> foldl(right, xf2, 1:3)
3-element Array{Any,1}:
 1
 2
 3

julia> foldl(right, xf2, [10.0, 11.0])
2-element Array{Any,1}:
 10.0
 11.0
```

Keyword argument `init` for transducible processes also accept an
`OnInit`:

```jldoctest OnInit
julia> foldl(push!, Map(identity), "abc"; init=OnInit(() -> []))
3-element Array{Any,1}:
 'a'
 'b'
 'c'
```

To create a copy of a mutable object, [`CopyInit`](@ref) is easier to
use.

However, more powerful and generic pattern is to use `push!!` from
BangBang.jl and initialize `init` with `Union{}[]` so that it
automatically finds the minimal element type.

```jldoctest OnInit
julia> using BangBang

julia> foldl(push!!, Map(identity), "abc"; init=Union{}[])
3-element Array{Char,1}:
 'a'
 'b'
 'c'
```
"""
struct OnInit{F} <: AbstractInitializer
    f::F
end

initvalue(init::OnInit) = init.f()

Base.show(io::IO, init::OnInit) = _default_show(io, init)

"""
    CopyInit(value)

This is equivalent to `OnInit(() -> deepcopy(value))`.

!!! compat "Transducers.jl 0.3"

    New in version 0.3.

# Examples
```jldoctest
julia> using Transducers

julia> init = CopyInit([]);

julia> foldl(push!, Map(identity), 1:3; init=init)
3-element Array{Any,1}:
 1
 2
 3

julia> foldl(push!, Map(identity), 1:3; init=init)  # `init` can be reused
3-element Array{Any,1}:
 1
 2
 3
```
"""
struct CopyInit{T} <: AbstractInitializer
    value::T
end

initvalue(init::CopyInit) = deepcopy(init.value)

Base.show(io::IO, init::CopyInit) = _default_show(io, init)

@inline foldlargs(op, x) = x
@inline foldlargs(op, x1, x2, xs...) =
    foldlargs(op,
              @next(op, x1, x2),
              xs...)

"""
    @default_finaltype(xf::Transducer, coll)

Infer the type of the object that would be fed into the second
argument `input` of the bottom reducing function `rf(acc, input)`.

See: `Base.@default_eltype`
"""
macro default_finaltype(xf, coll)
    quote
        # `eltype(coll)` does not work when `coll` is an iterator;
        # that's why we are using `Base.@default_eltype`:
        intype = Base.@default_eltype($(esc(coll)))
        Core.Compiler.return_type(
            _getoutput,
            Tuple{typeof($(esc(xf))), intype},
        ) |> _real_state_type
    end
end

# # How `@default_finaltype` works
#
# When `xf` has a filter-like transducer, the inference would say that
# the output of `next(reducingfunction(xf, right), ..., x)` is
# `Union{Nothing, THE_DESIRED_TYPE}` because `nothing` is the default
# "identity" of `right`.  So, we set the initial value of `acc` as a
# dummy singleton `_FakeState()` and strip it off from the inferred
# `Union{_FakeState, THE_DESIRED_TYPE}` to get `THE_DESIRED_TYPE`.
#
# Note that using `_FakeState` is important for supporting cases like
# `Union{Nothing, Int}` being the correct output type of `xf`.

struct _FakeState end

function _getoutput(xf, x)
    rf = reducingfunction(xf, right)
    return unreduced(complete(rf, next(rf, start(rf, _FakeState()), x)))
end

_real_state_type(T) = T
_real_state_type(::Type{Union{T, _FakeState}}) where {T} = @isdefined(T) ? T : Any


"""
    DefaultInit(op)

`DefaultInit` is like `InitialValues.Init` but **strictly** internal
to Transducers.jl.  It is used for checking if the bottom reducing
function is never called.
"""
DefaultInit
struct DefaultInitOf{OP} <: SpecificInitialValue{OP} end
const DefaultInit = InitOf{DefaultInitOf}()

struct OptInitOf{OP} <: SpecificInitialValue{OP} end
const OptInit = InitOf{OptInitOf}()
# It seems that compiler can infer more when passing around a
# `Function` than a `Type` (since a `Function` is a singleton?).
# That's why `OptInit` is defined as a factory.

InferableInit{OP} = Union{DefaultInitOf{OP}, OptInitOf{OP}}

_nonidtype(::Any) = nothing
_nonidtype(::Type{Union{S, T}}) where {T, S <: InferableInit} = T

# Defining `_asmonoid` internally as the resulting reducing function
# is not really a monoid (only the bottom reducing function becomes a
# monoid).
# TODO: better name for `_asmonoid`
@inline _asmonoid(rf) = asmonoid(rf)
@inline _asmonoid(rf::Reduction) = Reduction(xform(rf), _asmonoid(inner(rf)))
@inline _asmonoid(rf::BottomRF) = BottomRF(_asmonoid(inner(rf)))
@inline _asmonoid(rf::Completing) = Completing(_asmonoid(rf.f))

struct EmptyResultError <: Exception
    rf
end

function Base.showerror(io::IO, e::EmptyResultError)
    println(
        io,
        "EmptyResultError: ",
        "Reducing function `", _realbottomrf(e.rf), "` is never called. ")
    print(
        io,
        "The input collection is empty or the items are all filtered out ",
        "by some transducer(s). ",
        "It is recommended to specify `init` to avoid this kind of errors.")
    # TODO: improve error message
end

_realbottomrf(op) = op
_realbottomrf(rf::AbstractReduction) = _realbottomrf(as(rf, BottomRF).inner)
_realbottomrf(rf::Completing) = rf.f

struct IdentityNotDefinedError <: Exception
    op
    idfactory
end

function Base.showerror(io::IO, e::IdentityNotDefinedError)
    Init = e.idfactory
    op = e.op
    print(io, "IdentityNotDefinedError: ")
    print(io, strip("""
    `init = $Init` is specified but the identity element `Init(op)` is not defined for
        op = $op
    Note that `op` must be a well known binary operations like `+` or `*`.
    See InitialValues.jl documentation for more information.
    """))
end
