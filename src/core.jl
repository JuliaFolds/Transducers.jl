# --- Types

struct Reduced{T}
    value::T
end

isreduced(::Reduced) = true
isreduced(::Any) = false

ensure_reduced(x::Reduced) = x
ensure_reduced(x) = Reduced(x)

unreduced(x::Reduced) = x.value
unreduced(x) = x

abstract type Transducer end
abstract type AbstractFilter <: Transducer end

struct Composition{XO <: Transducer, XI <: Transducer} <: Transducer
    outer::XO
    inner::XI
end

struct Reduction{X <: Transducer, I, InType}
    xform::X
    inner::I  # Transducer or a function with arity-2 and -1 methods
end

InType(::T) where T = InType(T)
InType(::Type{Reduction{X, I, intype}}) where {X, I, intype} = intype
InType(T::Type) = throw(MethodError(InType, (T,)))

const R_{X, InType} = Reduction{<:X}

@inline Reduction(xf::X, inner::I, ::Type{InType}) where {X, I, InType} =
    Reduction{X, I, InType}(xf, inner)

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

# outtype(xf::Composition, intype) = outtype(xf.inner, outtype(xf.outer, intype))

# Not sure if this a good idea... (But it's easier to type)
@inline Base.:|>(f::Transducer, g::Transducer) = _normalize(Composition(f, g))
# Base.∘(f::Transducer, g::Transducer) = Composition(f, g)
# Base.∘(f::Composition, g::Transducer) = f.outer ∘ (f.inner ∘ g)

start(::Any, result) = result
start(rf::Reduction, result) = start(rf.inner, result)
start(rf::R_{AbstractFilter}, result) = start(rf.inner, result)

next(f, result, input) = f(result, input)

# done(rf, result)

complete(f, result) = f(result)
complete(rf::Reduction, result) =
    # Not using dispatch to avoid ambiguity
    if result isa PrivateState{typeof(rf)}
        # TODO: make a test case that this is crucial:
        complete(rf.inner, unwrap(rf, result)[2])
    else
        complete(rf.inner, result)
    end

struct PrivateState{T, S, R}
    state::S
    result::R
end
# TODO: make it a tuple-like so that I can return it as-is

PrivateState(rf::Reduction, state, result) =
    PrivateState{typeof(rf), typeof(state), typeof(result)}(state, result)

unwrap(::T, ps::PrivateState{T}) where {T} = (ps.state, ps.result)

unwrap(::T1, ::PrivateState{T2}) where {T1, T2} =
    error("""
    `unwrap(rf1, ps)` is used for
    typeof(rf1) = $T1
    while `ps` is created by wrap(rf2, ...) where
    typeof(rf2) = $T2
    """)

# TODO: better error message with unmatched `T`

wrap(rf::T, state, iresult) where {T} = PrivateState(rf, state, iresult)
wrap(rf, state, iresult::Reduced) =
    Reduced(PrivateState(rf, state, unreduced(iresult)))

@inline function wrapping(f, rf, result)
    state0, iresult0 = unwrap(rf, result)
    state1, iresult1 = f(state0, iresult0)
    return wrap(rf, state1, iresult1)
end
# TODO: Should `wrapping` happen automatically in `next`?  That is to
# say, how about let `__next__(rf, iresult, state, input)` be the
# interface function and `next(rf, result, input)` be the calling API.

unwrap_all(ps::PrivateState) = unwrap_all(ps.result)
unwrap_all(result) = result
unwrap_all(ps::Reduced) = Reduced(unwrap_all(unreduced(ps)))

outtype(::Any, ::Any) = Any
outtype(::AbstractFilter, intype) = intype

finaltype(rf::Reduction{<:Transducer, <:Reduction}) = finaltype(rf.inner)
finaltype(rf::Reduction) = outtype(rf.xform, InType(rf))

struct Completing{F}  # Note: not a Transducer
    f::F
end

start(rf::Completing, result) = start(rf.f, result)
next(rf::Completing, result, input)  = next(rf.f, result, input)
complete(::Completing, result) = result
