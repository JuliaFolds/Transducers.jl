# --- Types

struct Reduced{T}
    value::T
end

Base.:(==)(x::Reduced, y::Reduced) = x.value == y.value
Base.:(==)(x::Reduced, ::Any) = false

isreduced(::Reduced) = true
isreduced(::Any) = false

ensure_reduced(x::Reduced) = x
ensure_reduced(x) = Reduced(x)

unreduced(x::Reduced) = x.value
unreduced(x) = x

"""
    @return_if_reduced complete(rf, val)

It transforms the given expression to:

```julia
val isa Reduced && return ensure_reduced(complete(rf, unreduced(val)))
```

That is to say, if `val` is `Reduced`, unpack it, call `complete`,
re-pack into `Reduced`, and then finally return it.

# Examples
```jldoctest:
julia> using Transducers: @return_if_reduced

julia> @macroexpand @return_if_reduced complete(rf, val)
:(val isa Transducers.Reduced && return (Transducers.ensure_reduced)(complete(rf, (Transducers.unreduced)(val))))
```
"""
macro return_if_reduced(ex)
    if !(ex.head == :call && length(ex.args) == 3)
        error(
            "`@return_if_reduced` only accepts an expression of the form",
            " `complete(rf, val)`.",
            " Given:\n",
            ex,
        )
    end
    complete, rf, val = esc.(ex.args)
    :($val isa Reduced && return ensure_reduced($complete($rf, unreduced($val))))
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

"""
    Transducer

The abstract type for transducers.
"""
Transducer

"""
    AbstractFilter <: Transducer

The abstract type for filter-like transducers.  [`outtype`](@ref) is
appropriately defined for child types.
"""
AbstractFilter

struct TypedTransducer{intype, X <: Transducer}
    xform::X
end
TypedTransducer{intype}(xform::X) where {intype, X} =
    TypedTransducer{intype, X}(xform)

Setfield.constructor_of(::Type{T}) where {T <: TypedTransducer} = T

InType(::TypedTransducer{intype}) where intype = intype

# In clojure a reduction function is one of signature
# whatever, input -> whatever
#
# The `Reduction` type corresponds to such a function, but keeps extra information:
# * InType records the type of input
# * `xform` and `inner` are a decomposition of the reduction function into
#   a transducer `xform` and an inner reduction function `inner`.
#   `inner` can be either a `Reduction` or a function with arity-2 and arity-1 methods
#
struct Reduction{intype, T, F}
    xforms::T
    bottom::F
end

Reduction(xforms, bottom) =
    Reduction{InType(xforms[1]), typeof(xforms), typeof(bottom)}(xforms, bottom)

InType(::T) where T = InType(T)
InType(::Type{<:Reduction{intype}}) where {intype} = intype
InType(T::Type) = throw(MethodError(InType, (T,)))

Setfield.constructor_of(::Type{T}) where {T <: Reduction} = T

inner(rf::Reduction) =
    if length(rf.xforms) > 1
        Reduction(Base.tail(rf.xforms), rf.bottom)
    else
        rf.bottom
    end

xform(rf::Reduction) = rf.xforms[1].xform

Transducer(rf::Reduction) =
    if inner(rf) isa Reduction
        Composition(xform(rf), Transducer(inner(rf)))
    else
        xform(rf)
    end

"""
    Transducers.R_{X}

When defining a transducer type `X`, it is often required to dispatch
on type `rf::R_{X}` (Reducing Function) which bundles the current
transducer `xform(rf)::X` and the inner reducing function
`inner(rf)::R_`.
"""
const R_{X} = Reduction{<:Any, <:Tuple{<:TypedTransducer{<:Any, <:X}, Vararg}}

@inline Reduction{intype}(xf, inner::Reduction) where intype =
    Reduction((TypedTransducer{intype}(xf), inner.xforms...), inner.bottom)

@inline Reduction{intype}(xf, inner) where intype =
    Reduction((TypedTransducer{intype}(xf),), inner)

@inline Reduction(xf, inner, ::Type{intype}) where intype =
    Reduction{intype}(xf, inner)

@inline function Reduction(xf_::Composition, f, intype::Type)
    xf = _normalize(xf_)
    # @assert !(xf.outer isa Composition)
    return Reduction(
        xf.outer,
        Reduction(xf.inner, f, outtype(xf.outer, intype)),
        intype)
end

@inline _normalize(xf) = xf
@inline _normalize(xf::Composition{<:Composition}) =
    _normalize(xf.outer.outer |> _normalize(xf.outer.inner |> xf.inner))

outtype(xf::Composition, intype) = outtype(xf.inner, outtype(xf.outer, intype))
# TeeZip needs it

# Not sure if this a good idea... (But it's easier to type)
@inline Base.:|>(f::Transducer, g::Transducer) = _normalize(Composition(f, g))
# Base.∘(f::Transducer, g::Transducer) = Composition(f, g)
# Base.∘(f::Composition, g::Transducer) = f.outer ∘ (f.inner ∘ g)
@inline Base.:|>(::IdentityTransducer, f::Transducer) = f
@inline Base.:|>(f::Transducer, ::IdentityTransducer) = f

"""
    Transducers.start(rf::R_{X}, state)

This is an optional interface for a transducer.  Default
implementation just calls `start` of the inner reducing function; i.e.,

```julia
start(rf::Reduction, result) = start(inner(rf), result)
```

If the transducer `X` is stateful, it can "bundle" its private state
with `state` (so that `next` function can be "pure").

```julia
start(rf::R_{X}, result) = wrap(rf, PRIVATE_STATE, start(inner(rf), result))
```

See [`Take`](@ref), [`PartitionBy`](@ref), etc. for real-world examples.

Side notes: There is no related API in Clojure's Transducers.
Transducers.jl uses it to implement stateful transducers using "pure"
functions.  The idea is based on a slightly different approach taken
in C++ Transducer library [atria](https://github.com/AbletonAG/atria).
"""
start(::Any, result) = result
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

See [`Map`](@ref), [`Filter`](@ref), [`Cat`](@ref), etc. for
real-world examples.
"""
next(f, result, input) = f(result, input)

# done(rf, result)

"""
    Transducers.complete(rf::R_{X}, state)

This is an optional interface for a transducer.  If transducer `X` has
some internal state, this is the last chance to "flush" the result.

See [`PartitionBy`](@ref), etc. for real-world examples.

If **both** `complete(rf::R_{X}, state)` **and** `start(rf::R_{X},
state)` are defined, `complete` **must** unwarp `state` before
returning `state` to the outer reducing function.  If `complete` is
not defined for `R_{X}`, this happens automatically.
"""
complete(f, result) = f(result)
complete(rf::Reduction, result) =
    # Not using dispatch to avoid ambiguity
    if result isa PrivateState{typeof(rf)}
        complete(inner(rf), unwrap(rf, result)[2])
    else
        complete(inner(rf), result)
    end

combine(f, a, b) = f(a, b)
combine(rf::Reduction, a, b) =
    # Not using dispatch to avoid ambiguity
    if a isa PrivateState{typeof(rf)}
        # TODO: make sure this branch is compiled out
        error("Stateful transducer ", xform(rf), " does not support `combine`")
    elseif b isa PrivateState{typeof(rf)}
        error("""
        Some thing went wrong in two ways:
        * `combine(rf, a, b)` is called but type of `a` and `b` are different.
        * `xform(rf) = $(xform(rf))` is stateful and does not support `combine`.
        """)
    else
        combine(inner(rf), a, b)
    end

struct PrivateState{T, S, R}
    state::S
    result::R
end
# TODO: make it a tuple-like so that I can return it as-is

PrivateState(rf::Reduction, state, result) =
    PrivateState{typeof(rf), typeof(state), typeof(result)}(state, result)

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
unwrap(::T, ps::PrivateState{T}) where {T} = (ps.state, ps.result)

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

Consider a reducing step constructed as

    rf = Reduction(xf₁ |> xf₂ |> xf₃, f, intype)

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
first argument while transducible processes such as [`mapfoldl`](@ref)
only sees the outer-most "tree" `result₀` during the reduction.  The
whole tree is [`unwrap`](@ref)ed during the [`complete`](@ref) phase.

See [`wrapping`](@ref), [`unwrap`](@ref), and [`start`](@ref).
"""
wrap(rf::T, state, iresult) where {T} = PrivateState(rf, state, iresult)
wrap(rf, state, iresult::Reduced) =
    Reduced(PrivateState(rf, state, unreduced(iresult)))

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

unwrap_all(ps::PrivateState) = unwrap_all(ps.result)
unwrap_all(result) = result
unwrap_all(ps::Reduced) = Reduced(unwrap_all(unreduced(ps)))

"""
    outtype(xf::Transducer, intype)

Output item type for the transducer `xf` when the input type is `intype`.
"""
outtype(::Any, ::Any) = Any
outtype(::AbstractFilter, intype) = intype

finaltype(rf::Reduction) =
    if inner(rf) isa Reduction
        finaltype(inner(rf))
    else
        outtype(xform(rf), InType(rf))
    end

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
outtype(::NoComplete, intype) = intype
next(rf::R_{NoComplete}, result, input) = next(inner(rf), result, input)
complete(::R_{NoComplete}, result) = result  # don't call inner complete

"""
    Completing(function)

Wrap a `function` to add a no-op [`complete`](@ref) protocol.  Use it
when passing a `function` without 1-argument arity to
[`transduce`](@ref) etc.

$(_thx_clj("completing"))
"""
struct Completing{F}  # Note: not a Transducer
    f::F
end

start(rf::Completing, result) = start(rf.f, result)
next(rf::Completing, result, input)  = next(rf.f, result, input)
complete(::Completing, result) = result
combine(rf::Completing, a, b) = combine(rf.f, a, b)

# If I expose `Reduction` as a user-interface, I should export
# `skipcomplete` instead of the struct `Completing`.
skipcomplete(rf::Reduction) = Reduction(NoComplete(), rf, InType(rf))
skipcomplete(f) = Completing(f)
# skipcomplete(f) = Reduction(NoComplete(), f, Any)
# TODO: get rid of `Completing` struct.  I need to make sure it's
# possible to refine `InType` from `Any` when it's re-composed.

struct SideEffect{F}  # Note: not a Transducer
    f::F
end

# Completing(rf::SideEffect) = rf

start(rf::SideEffect, result) = start(rf.f, result)
complete(::SideEffect, result) = result
function next(rf::SideEffect, result, input)
    rf.f(input)
    return result
end

"""
    right([l, ]r) -> r

It is simply defined as

```julia
right(l, r) = r
right(r) = r
```

This function is meant to be used as `step` argument for
[`mapfoldl`](@ref) etc. for extracting the last output of the
transducers.  Note that `init` for `right` is set to `nothing` if not
provided.

# Examples
```jldoctest
julia> using Transducers

julia> mapfoldl(Take(5), right, 1:10)
5

julia> mapfoldl(Drop(5), right, 1:3) === nothing
true

julia> mapfoldl(Drop(5), right, 1:3; init=0)  # using `init` as the default value
0
```
"""
right(l, r) = r
right(r) = r

identityof(::typeof(right), ::Any) = nothing
# This is just a right identity but `right` is useful for left-fold
# context anyway so I guess it's fine.


"""
    Initializer(f)

Wrap a factory function to create an initial value for transducible
processes (e.g., [`mapfoldl`](@ref)) and "stateful" transducers (e.g.,
[`Scan`](@ref)).  Factory function `f` takes the input type to the
transducer or the reducing function.

`Initializer` must be used whenever using in-place reduction with
[`mapreduce`](@ref).

# Examples
```jldoctest Initializer
julia> using Transducers

julia> xf1 = Scan(push!, [])
Scan(push!, Any[])

julia> mapfoldl(xf1, right, 1:3)
3-element Array{Any,1}:
 1
 2
 3

julia> xf1
Scan(push!, Any[1, 2, 3])
```

Notice that the array is stored in `xf1` and mutated in-place.  As a
result, second run of `mapfoldl` contains the results from the first
run:

```jldoctest Initializer
julia> mapfoldl(xf1, right, 10:11)
5-element Array{Any,1}:
  1
  2
  3
 10
 11
```

This may not be desired.  To avoid this behavior, create an
`Initializer` object which takes a factory function to create a new
initial value.

```jldoctest Initializer; filter = r"#+[0-9]+"
julia> xf2 = Scan(push!, Initializer(T -> T[]))
Scan(push!, Initializer(##9#10()))

julia> mapfoldl(xf2, right, 1:3)
3-element Array{Int64,1}:
 1
 2
 3

julia> mapfoldl(xf2, right, [10.0, 11.0])
2-element Array{Float64,1}:
 10.0
 11.0
```

Keyword argument `init` for transducible processes also accept an
`Initializer`:

```jldoctest Initializer
julia> mapfoldl(Map(identity), push!, "abc"; init=Initializer(T -> T[]))
3-element Array{Char,1}:
 'a'
 'b'
 'c'
```
"""
struct Initializer{F}
    f::F
end

initvalue(x, ::Any) = x
initvalue(init::Initializer, intype) = init.f(intype)

_initvalue(rf::Reduction) = initvalue(xform(rf).init, InType(rf))

inittypeof(::T, ::Type) where T = T
function inittypeof(init::Initializer, intype::Type)
    # Maybe I should just call it?  But that would be a bit of waste
    # when `init.f` allocates...
    T = Base.promote_op(init.f, Type{intype})
    isconcretetype(T) && return T
    return typeof(init.f(intype))  # T==Union{} hits this code pass
end

function Base.show(io::IO, init::Initializer)
    print(io, "Initializer(")
    show(io, init.f)
    print(io, ')')
end
