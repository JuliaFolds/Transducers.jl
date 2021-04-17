# Non-transducer reducing function combinators

# Some common definitions for TeeRF and ProductRF
abstract type AbstractMultiCastingRF{N} <: _Function end
# TOOD: Use `AbstractMultiCastingRF <: AbstractReduction` so that
# extra `BottomRF` wrapper can be removed.

start(rf::AbstractMultiCastingRF, init) = map(f -> start(f, init), rf.fs)

start(rf::AbstractMultiCastingRF{N}, init::NTuple{N,Any}) where {N} =
    map(start, rf.fs, init)
start(rf::AbstractMultiCastingRF, init::Tuple) = error(
    "`start($rf, init)` received an incompatible accumulator `init` of length ",
    length(init),
    ".\n",
    "It requires a $(length(rf.fs))-tuple instead.\n",
    "init = $init",
)

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

!!! compat "Transducers.jl 0.4.32"

    New in version 0.4.32.

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
julia> filtering_max = Filter(isodd)'(max);

julia> foldl(TeeRF(min, filtering_max), Map(identity), [5, 2, 6, 8, 3])
(2, 5)

julia> foldl(TeeRF(min, filtering_max), Map(identity), 2:2:8)
ERROR: EmptyResultError: ...

julia> foldl(TeeRF(min, filtering_max), Map(identity), 2:2:8; init = Init)
(2, InitialValue(max))
```
"""
struct TeeRF{N,T<:NTuple{N,Any}} <: AbstractMultiCastingRF{N}
    fs::T
    TeeRF{N,T}(fs) where {N,T} = new{N,T}(fs)
end

TeeRF{N}(fs::NTuple{N,Any}) where {N} = TeeRF{N,typeof(fs)}(fs)
TeeRF(fs::NTuple{N,Any}) where {N} = TeeRF{N}(fs)
TeeRF(f, fs...) = TeeRF((f, fs...))

@inline next(rf::TeeRF{N}, accs::NTuple{N,Any}, x) where {N} =
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

!!! compat "Transducers.jl 0.4.32"

    New in version 0.4.32.

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
struct ProductRF{N,T<:NTuple{N,Any}} <: AbstractMultiCastingRF{N}
    fs::T
    ProductRF{N,T}(fs) where {N,T} = new{N,T}(fs)
end

ProductRF{N}(fs::NTuple{N,Any}) where {N} = ProductRF{N,typeof(fs)}(fs)
ProductRF(fs::NTuple{N,Any}) where {N} = ProductRF{N}(fs)
ProductRF(f, fs...) = ProductRF((f, fs...))

@inline next(rf::ProductRF{N}, accs::NTuple{N,Any}, xs) where {N} =
    map(next, rf.fs, accs, xs)
@inline (rf::ProductRF)(accs, x) = next(rf, accs, x)


"""
    AdHocRF(next; oninit, start = identity, complete = identity, combine = next)

Define an ad-hoc reducing function `rf`.

!!! note

    Use [`wheninit`](@ref) etc. instead of this constructor.

# Arguments
- `next`: binary function

# Keyword Arguments
- `oninit`: nullary function that generates an initial value for `next`
- `start`: unary function that pre-process the initial value for `next`
- `complete`: unary function that post-process the accumulator
- `combine`: (approximately) associative binary function for combining
  multiple results of `next` (before post-processed by `complete`).

# Examples
```jldoctest
julia> using Transducers
       using Transducers: AdHocRF

julia> rf = AdHocRF(push!, combine = append!);

julia> foldxt(rf, Map(identity), 1:4; basesize = 1, init = OnInit(() -> []))
4-element Vector{Any}:
 1
 2
 3
 4
```
"""
struct AdHocRF{OnInit,Start,Next,Complete,Combine} <: _Function
    oninit::OnInit
    start::Start
    next::Next
    complete::Complete
    combine::Combine

    AdHocRF{OnInit,Start,Next,Complete,Combine}(
        oninit,
        start,
        next,
        complete,
        combine,
    ) where {OnInit,Start,Next,Complete,Combine} =
        new{OnInit,Start,Next,Complete,Combine}(oninit, start, next, complete, combine)
end

AdHocRF(oninit, start, op, complete, combine) =
    AdHocRF{_typeof(oninit),_typeof(start),_typeof(op),_typeof(complete),_typeof(combine)}(
        oninit,
        start,
        op,
        complete,
        combine,
    )

AdHocRF(op; oninit = nothing, start = identity, complete = identity, combine = nothing) =
    AdHocRF(oninit, start, op, complete, combine)

AdHocRF(op::AdHocRF; kwargs...) = setproperties(op, kwargs.data)

@inline (rf::AdHocRF)(acc, x) = rf.next(acc, x)

@inline start(rf::AdHocRF, init::Union{InitOf,InitialValues.InitialValue}) =
    if rf.oninit === nothing
        rf.start(initialize(init, rf.next))
    else
        # No concrete `init` is given and `oninit`is defined.
        rf.start(rf.oninit())
    end
@inline start(rf::AdHocRF, init) = rf.start(initialize(init, rf.next))
@inline next(rf::AdHocRF, acc, x) = rf.next(acc, x)
@inline complete(rf::AdHocRF, acc) = rf.complete(acc)
@inline combine(rf::AdHocRF, a, b) = something(rf.combine, rf.next)(a, b)

_asmonoid(rf::AdHocRF) = @set rf.next = _asmonoid(rf.next)
Completing(rf::AdHocRF) = rf

wheninit(oninit, op) = AdHocRF(op; oninit = oninit)
whenstart(start, op) = AdHocRF(op; start = start)
whencomplete(complete, op) = AdHocRF(op; complete = complete)
whencombine(combine, op) = AdHocRF(op; combine = combine)

wheninit(oninit) = op -> wheninit(oninit, op)
whenstart(start) = op -> whenstart(start, op)
whencomplete(complete) = op -> whencomplete(complete, op)
whencombine(combine) = op -> whencombine(combine, op)

"""
    wheninit(oninit, rf) -> rf′
    wheninit(oninit) -> rf -> rf′
    whenstart(start, rf) -> rf′
    whenstart(start) -> rf -> rf′
    whencomplete(complete, rf) -> rf′
    whencomplete(complete) -> rf -> rf′
    whencombine(combine, rf) -> rf′
    whencombine(combine) -> rf -> rf′

Add initialization/completion/merging phase to arbitrary reducing
function.

The functions passed to those combinators are used as follows in
`foldl`:

```julia
init′ = oninit()  # if oninit is given; otherwise standard `init`-preprocessing
acc = start(init′)
for x in collection
    acc += rf(acc, x)
end
result = acc
return complete(result)
```

In `foldxt`, a collection is split in multiple parts and then above
`foldl` except for `complete` is run on them, yielding multiple
`result`s which are combined by repeatedly calling `combine(result_1,
result_2)`.  Note that this allows non-associative function for `next`
while `combine` *must* be associative.

See also [`next`](@ref), [`start`](@ref), [`complete`](@ref), and
[`combine`](@ref).

# Arguments
- `rf`: reducing function
- `oninit`: nullary function that generates an initial value for `rf`
- `start`: unary function that pre-process the initial value for `rf`
- `complete`: unary function that post-process the accumulator
- `combine`: (approximately) associative binary function for combining
  multiple results of `rf` (before post-processed by `complete`).

# Extended help
## Examples

An example for using non-associative reducing function in `foldxt`:

```jldoctest wheninit
julia> using Transducers

julia> collector! = push! |> whencombine(append!) |> wheninit(() -> []);

julia> foldxt(collector!, Filter(isodd), 1:5; basesize = 1)
3-element Vector{Any}:
 1
 3
 5
```

More "tightly" typed vector can returned by using BangBang.jl interface:

```jldoctest wheninit
julia> collector!! = push!! |> whencombine(append!!) |> wheninit(Vector{Union{}});

julia> foldxt(collector!!, Filter(isodd), 1:5; basesize = 1)
3-element Vector{Int64}:
 1
 3
 5
```

Online averaging algorithm can be implemented, e.g., by:

```jldoctest wheninit
julia> averaging = function add_average((sum, count), x)
           (sum + x, count + 1)
       end |> wheninit() do
           (Init(+), 0)
       end |> whencombine() do (sum1, count1), (sum2, count2)
           (sum1 + sum2), (count1 + count2)
       end |> whencomplete() do (sum, count)
           sum / count
       end;

julia> foldl(averaging, Filter(isodd), 1:5)
3.0

julia> foldxt(averaging, Filter(isodd), 1:50; basesize = 1)
25.0
```

An alternative implementation is to use [`Map`](@ref) to construct a
singleton solution and then merge it into the accumulated solution:

```jldoctest wheninit
julia> averaging2 = function merge_average((sum1, count1), (sum2, count2))
           (sum1 + sum2, count1 + count2)
       end |> whencomplete() do (sum, count)
           sum / count
       end |> Map() do x
           (x, 1)
       end';  # `'` here is important

julia> foldl(averaging2, Filter(isodd), 1:5)
3.0

julia> foldxt(averaging2, Filter(isodd), 1:50; basesize = 1)
25.0
```
"""
(wheninit, whenstart, whencomplete, whencombine)
