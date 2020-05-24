# Non-transducer reducing function combinators

# Some common definitions for TeeRF and ProductRF
abstract type AbstractMultiCastingRF <: _Function end
# TOOD: Use `AbstractMultiCastingRF <: AbstractReduction` so that
# extra `BottomRF` wrapper can be removed.

start(rf::AbstractMultiCastingRF, init) = map(f -> start(f, init), rf.fs)

# Trying to detect bugs by narrowing method signatures when defining
# `next` for concrete reducing functions. Otherwise, it falls back to
# this method; e.g., foldl(TeeRF(min, max), [5, 2, 6, 8, 3])
next(rf::AbstractMultiCastingRF, accs, x) = error(
    "$rf received an incompatible accumulator of type $(typeof(accs))\n",
    "It requires a $(length(rf.fs))-tuple.\n",
    "Accumulator (first argument): $(accs)\n",
    "Input (second argument): $x",
)

@inline function complete(rf::AbstractMultiCastingRF, accs)
    results = map((f, a) -> complete(f, a), rf.fs, accs)
    if any(r -> r isa DefaultInitOf, results)  # is `any` too strict?
        return DefaultInitOf{typeof(rf)}()
    end
    return results
end

@inline combine(rf::AbstractMultiCastingRF, lefts, rights) =
    map((f, l, r) -> combine(f, l, r), rf.fs, lefts, rights)

# # Something like these are needed for `AbstractMultiCastingRF <: AbstractReduction`:
# Transducer(::AbstractMultiCastingRF) = IdentityTransducer()
# has(rf::AbstractMultiCastingRF, ::Type{<:Transducer}) = false  # should be multicast?
# _realbottomrf(rf::AbstractMultiCastingRF) = rf
# _show_impl(io, m, rf::AbstractMultiCastingRF) = invoke(Base.show, Tuple{IO,Any}, io, rf)

# Adjoining init has to happen at "leafs":
_asmonoid(rf::AbstractMultiCastingRF) =
    ConstructionBase.constructorof(typeof(rf))(map(_asmonoid, rf.fs)::Tuple)

# See: [[./core.jl::TODOs for `Completing` and `skipcomplete`]]
Completing(rf::AbstractMultiCastingRF) =
    ConstructionBase.constructorof(typeof(rf))(map(Completing, rf.fs)::Tuple)

function Base.show(io::IO, rf::AbstractMultiCastingRF)
    @nospecialize
    T = ConstructionBase.constructorof(typeof(rf))
    if rf === T(rf.fs)
        print(io, T, rf.fs)
    else
        invoke(show, Tuple{IO,Any}, io, rf)
    end
end

"""
    TeeRF(reducing_functions::Tuple)
    TeeRF(reducing_functions...)

Combine multiple reducing functions into a new reducing function that
"multicast" the input to multiple reducing functions.

Roughly speaking, `TeeRF(op₁, op₂, ..., opₙ)` is equivalent to

```julia
((a₁, a₂, ..., aₙ), x) -> (op₁(a₁, x), op₂(a₂, x), ..., opₙ(aₙ, x))
```

For [`combine`](@ref), it behaves like [`ProductRF`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> extrema′(xs, xf = Map(identity)) = foldl(TeeRF(min, max), xf, xs);

julia> extrema′([5, 2, 6, 8, 3])
(2, 8)
```

Note that the input is considered empty unless _all_ reducing
functions call their bottom reducing functions.  Specify `init` to
obain results even when the input collection is empty or all filtered
out.

```jldoctest; setup = :(using Transducers), filter = r"EmptyResultError: .*"
julia> filtering_max = reducingfunction(Filter(isodd), max);

julia> foldl(TeeRF(min, filtering_max), Map(identity), [5, 2, 6, 8, 3])
(2, 5)

julia> foldl(TeeRF(min, filtering_max), Map(identity), 2:2:8)
ERROR: EmptyResultError: ...

julia> foldl(TeeRF(min, filtering_max), Map(identity), 2:2:8; init = Init)
(2, Init(max))
```
"""
struct TeeRF{T<:Tuple} <: AbstractMultiCastingRF
    fs::T
    TeeRF{T}(fs) where {T} = new{T}(fs)
end

TeeRF(fs::Tuple) = TeeRF{typeof(fs)}(fs)
TeeRF(f, fs...) = TeeRF((f, fs...))

@inline next(rf::TeeRF{<:NTuple{N,Any}}, accs::NTuple{N,Any}, x) where {N} =
    map((f, a) -> next(f, a, x), rf.fs, accs)
@inline (rf::TeeRF)(accs, x) = next(rf, accs, x)

"""
    ProductRF(reducing_functions::Tuple)
    ProductRF(reducing_functions...)

Combine `N` reducing functions into a new reducing function that work
on `N`-tuple.  The `i`-th reducing function recieves the `i`-th
element of the input tuple.

Roughly speaking, `ProductRF(op₁, op₂, ..., opₙ)` is equivalent to

```julia
((a₁, a₂, ..., aₙ), (b₁, b₂, ..., bₙ)) -> (op₁(a₁, b₁), op₂(a₂, b₂), ..., opₙ(aₙ, bₙ))
```

# Examples

Like [`TeeRF`](@ref), `ProductRF` can be used to drive multiple reducing
functions.  `ProductRF` is more "low-level" in the sense that `TeeRF`
can be defined in terms of `ProductRF` (other direction is much harder):

```jldoctest
julia> using Transducers

julia> TeeRF′(fs...) = reducingfunction(
           Map(x -> ntuple(_ -> x, length(fs))),
           ProductRF(fs...),
       );

julia> foldl(TeeRF′(min, max), Map(identity), [5, 2, 6, 8, 3])
(2, 8)
```

`ProductRF` may be useful for handling pre-existing stream whose item
type is already a tuple:

```julia; setup = (using Transducers)
julia> foldl(ProductRF(&, +), Map(x -> (isodd(x), x)), [5, 2, 6, 8, 3])
(false, 24)

julia> foldl(TeeRF(reducingfunction(Map(isodd), &), +), Map(identity), [5, 2, 6, 8, 3])
(false, 24)
```
"""
struct ProductRF{T<:Tuple} <: AbstractMultiCastingRF
    fs::T
    ProductRF{T}(fs) where {T} = new{T}(fs)
end

ProductRF(fs::Tuple) = ProductRF{typeof(fs)}(fs)
ProductRF(f, fs...) = ProductRF((f, fs...))

# Default `start` is defined by AbstractMultiCastingRF
function start(rf::ProductRF, inits::Tuple)
    _check_multirf_inits(rf.fs, inits)
    return map((f, i) -> start(f, i), rf.fs, inits)
end

_check_multirf_inits(::NTuple{N,Any}, ::NTuple{N,Any}) where {N} = nothing
function _check_multirf_inits(fs, inits)
    @nospecialize
    throw(ArgumentError("incompatible length of tuple is provided"))
end

@inline next(rf::ProductRF{<:NTuple{N,Any}}, accs::NTuple{N,Any}, xs) where {N} =
    map(next, rf.fs, accs, xs)
@inline (rf::ProductRF)(accs, x) = next(rf, accs, x)

"""
    BroadcastRF(reducing_function)

Broadcast "vector" input to reducing function on "scalars".

Roughly speaking, `BroadcastRF(op)` is equivalent to

```julia
(a, b) -> op.(a, b)
```

However, it has a better memory usage and better initial value
handling.

If the input is an array, the array created at the first iteration is
reused if it can hold the element types of subsequent iterations.
Otherwise, the array type is widen as needed.

If `init` passed to the fold function is a lazy "initializer" object
such as [`OnInit`](@ref), it is initialized independently for each
item in the first input array.  This makes using `BroadcastRF` for
(possibly) in-place functions safe.

# Examples
```jldoctest
julia> using Transducers

julia> foldl(BroadcastRF(+), Map(identity), [[1, 2], [3, 4], 5])
2-element Array{Int64,1}:
  9
 11

julia> foldl(BroadcastRF(+), Map(identity), [(0,), [1], [2.0], [3 + 0im]])
1-element Array{Complex{Float64},1}:
 6.0 + 0.0im

julia> foldl(BroadcastRF(BroadcastRF(*)), Map(identity),
             [[[1], [10, 100]], [[2], [20, 200]], [[3], [30, 300]]])
2-element Array{Array{Int64,1},1}:
 [6]
 [6000, 6000000]

julia> rf = BroadcastRF((a, b) -> a .+= b);

julia> foldl(rf, Map(identity), [[[1], [2, 3]], [[4, 5], 6]];
             init = Ref([0, 0]))
2-element Array{Array{Int64,1},1}:
 [13, 15]
 [13, 15]

julia> foldl(rf, Map(identity), [[[1], [2, 3]], [[4, 5], 6]];
             init = OnInit(() -> [0, 0]))
2-element Array{Array{Int64,1},1}:
 [5, 6]
 [8, 9]
```
"""
struct BroadcastRF{F} <: _Function
    f::F
end

struct LazyInit{I}
    init::I
end

# Defer calling inner `start`. This is for broadcasting `init` to the
# shape of the first item:
start(rf::BroadcastRF, init) = LazyInit(init)

@inline next(rf::BroadcastRF, acc::LazyInit, xs) = next.(rf.f, start.(rf.f, acc.init), xs)
@inline function next(rf::BroadcastRF, accs, xs)
    @! accs .= next.(rf.f, accs, xs)
    return accs
end
@inline (rf::BroadcastRF)(accs, xs) = next(rf, accs, xs)

complete(rf::BroadcastRF, ::LazyInit{typeof(DefaultInit)}) = DefaultInitOf{typeof(rf)}()

# Is this the right thing to do?
@inline complete(rf::BroadcastRF, acc::LazyInit) = start.(rf.f, acc.init)

@inline function complete(rf::BroadcastRF, accs)
    @! accs .= complete.(rf.f, accs)
    if any(r -> r isa DefaultInitOf, accs)  # is `any` too strict?
        return DefaultInitOf{typeof(rf)}()
    end
    return accs
end

combine(::BroadcastRF, ::LazyInit, accs) = accs
combine(::BroadcastRF, accs, ::LazyInit) = accs
combine(::BroadcastRF, accs::LazyInit, ::LazyInit) = accs
@inline function combine(rf::BroadcastRF, lefts, rights)
    @! lefts .= combine.(rf.f, lefts, rights)
    return lefts
end

# Adjoining init has to happen at "leafs":
_asmonoid(rf::BroadcastRF) = BroadcastRF(_asmonoid.(rf.f))

# See: [[./core.jl::TODOs for `Completing` and `skipcomplete`]]
Completing(rf::BroadcastRF) = BroadcastRF(Completing.(rf.f))

function Base.show(io::IO, rf::BroadcastRF)
    @nospecialize
    T = ConstructionBase.constructorof(typeof(rf))
    if rf === T(rf.f)
        print(io, T, '(', rf.f, ')')
    else
        invoke(show, Tuple{IO,Any}, io, rf)
    end
end
