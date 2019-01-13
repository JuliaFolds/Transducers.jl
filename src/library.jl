_experimental_warning = """
!!! warning
    This API is experimental.  Backward incompatible change, including
    the removal of this API, is more likely to occur than other parts
    of this package.
"""

_shared_vector_warning = """
!!! warning
    The vector passed to the inner reducing function is valid only
    during its _immediate_ reduction step.  It must be reduced
    immediately _or_ copied.
"""

_shared_notes_unfold = """
Note that input is ignored.  To use the input in the downstream
reduction steps, use [`Zip`](@ref).
"""

_use_initializer = """
An [`Initializer`](@ref) object can be passed to `init` for creating
a dedicated (possibly mutable) state for each fold.
"""

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/map
# https://clojuredocs.org/clojure.core/map
"""
    Map(f)

Apply unary function `f` to each input and pass the result to the
inner reducing step.

$(_thx_clj("map"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Map(x -> 2x), 1:3)
3-element Array{Int64,1}:
 2
 4
 6
```
"""
struct Map{F} <: Transducer
    f::F
end

isexpansive(::Map) = false
outtype(xf::Map, intype) = Union{Base.return_types(xf.f, (intype,))...}
next(rf::R_{Map}, result, input) = next(rf.inner, result, rf.xform.f(input))

"""
    MapSplat(f)

Like `Map(f)` but calls `f(input...)` for each `input` and then pass
the result to the inner reducing step.

# Examples
```jldoctest
julia> using Transducers

julia> collect(MapSplat(*), zip(1:3, 10:10:30))
3-element Array{Int64,1}:
 10
 40
 90
```
"""
struct MapSplat{F} <: Transducer
    f::F
end

isexpansive(::MapSplat) = false
outtype(xf::MapSplat, intype) = Union{Base.return_types(xf.f, intype)...}
next(rf::R_{MapSplat}, result, input) =
    next(rf.inner, result, rf.xform.f(input...))

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/replace
# https://clojuredocs.org/clojure.core/replace
"""
    Replace(assoc)

Replace each input with the value in the associative container `assoc`
(e.g., a dictionary, array, string) if it matches with a key/index.
Otherwise output the input as-is.

$(_thx_clj("replace"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Replace(Dict('a' => 'A')), "abc")
3-element Array{Char,1}:
 'A'
 'b'
 'c'

julia> collect(Replace([:a, :b, :c]), 0:4)
5-element Array{Union{Int64, Symbol},1}:
 0
  :a
  :b
  :c
 4

julia> collect(Replace("abc"), 0:4)
5-element Array{Union{Char, Int64},1}:
 0
  'a'
  'b'
  'c'
 4
```
"""
struct Replace{D} <: Transducer
    d::D  # dictionary-like object
end

isexpansive(::Replace) = false
outtype(xf::Replace, intype) = Union{intype, avaltype(xf.d)}
next(rf::R_{Replace}, result, input) =
    next(rf.inner, result, get(rf.xform.d, input, input))

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/cat
# https://clojuredocs.org/clojure.core/cat
"""
    Cat()

Concatenate/flatten nested iterators.

$(_thx_clj("cat"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Cat(), [[1, 2], [3], [4, 5]]) == 1:5
true
```
"""
struct Cat <: Transducer
end

outtype(::Cat, intype) = ieltype(intype)

# Inner transducer has to be started once the input is known.  That's
# why `start` for `Cat` has to bail out immediately; i.e., it's not a
# bug that `start(rf.inner, iresult)` is not called here:
start(rf::R_{Cat}, result) = wrap(rf, Unseen(), result)

next(rf::R_{Cat}, result, input) =
    wrapping(rf, result) do istate0, iresult
        if istate0 isa Unseen
            istate1 = start(rf.inner, iresult)
        else
            istate1 = istate0
        end
        istate2 = foldl_nocomplete(rf.inner, istate1, input)
        istate2, istate2
    end

function combine(rf::R_{Cat}, a, b)
    ua, ira = unwrap(rf, a)
    ub, irb = unwrap(rf, b)
    if ua isa Unseen
        return wrap(rf, ub, irb)
    elseif ub isa Unseen
        return wrap(rf, ua, ira)
    else
        uc = combine(rf.inner, ua, ub)
        return wrap(rf, uc, uc)
    end
end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/mapcat
# https://clojuredocs.org/clojure.core/mapcat
"""
    MapCat(f)

Concatenate output of `f` which is expected to return an iterable.

$(_thx_clj("mapcat"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(MapCat(x -> 1:x), 1:3)
6-element Array{Int64,1}:
 1
 1
 2
 1
 2
 3
```
"""
const MapCat = Composition{<:Map, <:Cat}

MapCat(f) = Map(f) |> Cat()

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/filter
# https://clojuredocs.org/clojure.core/filter
"""
    Filter(pred)

Skip items for which `pred` is evaluated to `false`.

$(_thx_clj("filter"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Filter(iseven), 1:3)
1-element Array{Int64,1}:
 2
```
"""
struct Filter{P} <: AbstractFilter
    pred::P
end

next(rf::R_{Filter}, result, input) =
    rf.xform.pred(input) ? next(rf.inner, result, input) : result

"""
    NotA(T)

Skip items of type `T`.  Unlike `Filter(!ismissing)`, downstream
transducers can have a correct type information for `NotA(Missing)`.

See also: [`OfType`](@ref)

# Examples
```jldoctest
julia> using Transducers

julia> collect(NotA(Missing), [1, missing, 2])
2-element Array{Int64,1}:
 1
 2

julia> collect(Filter(!ismissing), [1, missing, 2])  # see the eltype below
2-element Array{Union{Missing, Int64},1}:
 1
 2
```
"""
struct NotA{T} <: AbstractFilter end
NotA(T::Type) = NotA{T}()

outtype(::NotA{T}, intype) where T = Core.Compiler.typesubtract(intype, T)

next(rf::R_{NotA{T}}, result, input) where T =
    input isa T ? result : next(rf.inner, result, input)

# **Side notes**.  Although in principle `NotA(Missing)` can yields a
# better performance than `Filter(!ismissing)` (by providing more type
# information to the compiler), it seems `Filter(!ismissing)` is
# enough for a small example.  See:
# https://discourse.julialang.org/t/19159/11
#
# So, the main benefit of `NotA` over `Filter` is `outtype`.

"""
    OfType(T)

Include only items of type `T`.

See also: [`NotA`](@ref)

# Examples
```jldoctest
julia> using Transducers

julia> collect(OfType(Int), [1, missing, 2])
2-element Array{Int64,1}:
 1
 2

julia> collect(Filter(!ismissing), [1, missing, 2])  # see the eltype below
2-element Array{Union{Missing, Int64},1}:
 1
 2
```
"""
struct OfType{T} <: AbstractFilter end
OfType(T::Type) = OfType{T}()

outtype(::OfType{T}, _intype) where T = T

next(rf::R_{OfType{T}}, result, input) where T =
    input isa T ? next(rf.inner, result, input) : result

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/take
# https://clojuredocs.org/clojure.core/take
"""
    Take(n)

Take `n` items from the input sequence.

$(_thx_clj("take"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Take(2), 1:10)
2-element Array{Int64,1}:
 1
 2

julia> collect(Take(5), 1:2)
2-element Array{Int64,1}:
 1
 2
```
"""
struct Take <: AbstractFilter
    n::Int

    function Take(n)
        @argcheck n >= 0
        return new(n)
    end
end

start(rf::R_{Take}, result) = wrap(rf, rf.xform.n, start(rf.inner, result))

next(rf::R_{Take}, result, input) =
    wrapping(rf, result) do n, iresult
        if n > 0
            iresult = next(rf.inner, iresult, input)
            n -= 1
        end
        if n <= 0
            iresult = ensure_reduced(iresult)
        end
        return n, iresult
    end

"""
    TakeLast(n)

Take last `n` items from the input sequence.

# Examples
```jldoctest
julia> using Transducers

julia> collect(TakeLast(2), 1:10)
2-element Array{Int64,1}:
  9
 10

julia> collect(TakeLast(5), 1:2)
2-element Array{Int64,1}:
 1
 2
```
"""
struct TakeLast <: AbstractFilter
    n::Int

    function TakeLast(n)
        @argcheck n >= 0
        return new(n)
    end
end

function start(rf::R_{TakeLast}, result)
    n = rf.xform.n
    return wrap(rf, (-n, Vector{InType(rf)}(undef, n)), start(rf.inner, result))
end

next(rf::R_{TakeLast}, result, input) =
    wrapping(rf, result) do (c, buffer), iresult
        c += 1
        n = length(buffer)
        if c <= 0
            buffer[c + n] = input
            (c, buffer), iresult
        else
            buffer[c] = input
            (c < n ? c : 0, buffer), iresult
        end
    end

function complete(rf::R_{TakeLast}, result)
    (c, buffer), iresult = unwrap(rf, result)
    if c <= 0  # buffer is not full (or c is just wrapping)
        for i in 1:(c + length(buffer))
            iresult = next(rf.inner, iresult, @inbounds buffer[i])
            @return_if_reduced complete(rf.inner, iresult)
        end
    else
        for i in c+1:length(buffer)
            iresult = next(rf.inner, iresult, @inbounds buffer[i])
            @return_if_reduced complete(rf.inner, iresult)
        end
        for i in 1:c
            iresult = next(rf.inner, iresult, @inbounds buffer[i])
            @return_if_reduced complete(rf.inner, iresult)
        end
    end
    return complete(rf.inner, iresult)
end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/take-while
# https://clojuredocs.org/clojure.core/take-while
"""
    TakeWhile(pred)

Take items while `pred` returns `true`.  Abort the reduction when
`pred` returns `false` for the first time.

$(_thx_clj("take-while"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(TakeWhile(x -> x < 3), [1, 2, 3, 1, 2])
2-element Array{Int64,1}:
 1
 2
```
"""
struct TakeWhile{P} <: AbstractFilter
    pred::P
end

next(rf::R_{TakeWhile}, result, input) =
    rf.xform.pred(input) ? next(rf.inner, result, input) : ensure_reduced(result)

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/take-nth
# https://clojuredocs.org/clojure.core/take-nth
"""
    TakeNth(n)

Output every `n` item to the inner reducing step.

$(_thx_clj("take-nth"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(TakeNth(3), 1:9)
3-element Array{Int64,1}:
 1
 4
 7
```
"""
struct TakeNth <: AbstractFilter
    n::Int

    function TakeNth(n)
        @argcheck n > 0
        return new(n)
    end
end

start(rf::R_{TakeNth}, result) = wrap(rf, rf.xform.n, start(rf.inner, result))

next(rf::R_{TakeNth}, result, input) =
    wrapping(rf, result) do c, iresult
        if c == rf.xform.n
            iresult = next(rf.inner, iresult, input)
            c = 1
        else
            c += 1
        end
        return c, iresult
    end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/drop
# https://clojuredocs.org/clojure.core/drop
"""
    Drop(n)

Drop first `n` items.

$(_thx_clj("drop"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Drop(3), 1:5)
2-element Array{Int64,1}:
 4
 5
```
"""
struct Drop <: AbstractFilter
    n::Int

    function Drop(n)
        @argcheck n >= 0
        return new(n)
    end
end

start(rf::R_{Drop}, result) = wrap(rf, 0, start(rf.inner, result))

next(rf::R_{Drop}, result, input) =
    wrapping(rf, result) do c, iresult
        if c >= rf.xform.n
            c, next(rf.inner, iresult, input)
        else
            c += 1
            c, iresult
        end
    end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/drop-last
# https://clojuredocs.org/clojure.core/drop-last
"""
    DropLast(n)

Drop last `n` items.

$(_thx_clj("drop-last"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(DropLast(2), 1:5)
3-element Array{Int64,1}:
 1
 2
 3

julia> collect(DropLast(2), 1:1)
0-element Array{Int64,1}

julia> collect(DropLast(2), 1:0)
0-element Array{Int64,1}
```
"""
struct DropLast <: AbstractFilter
    n::Int

    function DropLast(n)
        @argcheck n >= 0
        return new(n)
    end
end

function start(rf::R_{DropLast}, result)
    n = rf.xform.n + 1
    return wrap(rf, (-n, Vector{InType(rf)}(undef, n)), start(rf.inner, result))
end

next(rf::R_{DropLast}, result, input) =
    wrapping(rf, result) do (c, buffer), iresult
        c += 1
        n = length(buffer)
        if c <= 0
            buffer[c + n] = input
            if c == 0
                (c, buffer), next(rf.inner, iresult, buffer[1])
            else
                (c, buffer), iresult
            end
        elseif c >= n
            buffer[c] = input
            (0, buffer), next(rf.inner, iresult, buffer[1])
        else
            buffer[c] = input
            (c, buffer), next(rf.inner, iresult, buffer[c + 1])
        end
    end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/drop-while
# https://clojuredocs.org/clojure.core/drop-while
"""
    DropWhile(pred)

Drop items while `pred` returns `true` consecutively.  It becomes a
no-op after `pred` returns a `false`.

$(_thx_clj("drop-while"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(DropWhile(x -> x < 3), [1:5; 1:2])
5-element Array{Int64,1}:
 3
 4
 5
 1
 2
```
"""
struct DropWhile{F} <: AbstractFilter
    pred::F
end

start(rf::R_{DropWhile}, result) = wrap(rf, true, start(rf.inner, result))

next(rf::R_{DropWhile}, result, input) =
    wrapping(rf, result) do dropping, iresult
        if dropping
            dropping = rf.xform.pred(input)
            dropping && return (dropping, iresult)
        end
        dropping, next(rf.inner, iresult, input)
    end

"""
    FlagFirst()

Output `(isfirst, input)` where `isfirst::Bool` is `true` only for the
first iteration and `input` is the original input.

See also:
[`IterTools.flagfirst`](https://juliacollections.github.io/IterTools.jl/latest/#flagfirst(xs)-1)


# Examples
```jldoctest
julia> using Transducers

julia> collect(FlagFirst(), 1:3)
3-element Array{Tuple{Bool,Int64},1}:
 ($_true_str, 1)
 ($_false_str, 2)
 ($_false_str, 3)
```
"""
struct FlagFirst <: Transducer end

isexpansive(::FlagFirst) = false
outtype(::FlagFirst, intype) = Tuple{Bool,intype}

start(rf::R_{FlagFirst}, result) = wrap(rf, true, start(rf.inner, result))

next(rf::R_{FlagFirst}, result, input) =
    wrapping(rf, result) do isfirst, iresult
        false, next(rf.inner, iresult, (isfirst, input))
    end

# https://docs.julialang.org/en/v1/base/iterators/#Base.Iterators.partition
# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/partition-all
# https://clojuredocs.org/clojure.core/partition-all
"""
    Partition(size, step = size, flush = false)
    Partition(size; step = size, flush = false)

Sliding window of width `size` and interval `step`.

$_shared_vector_warning

$(_thx_clj("partition-all"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Partition(3) |> Map(copy), 1:8)
2-element Array{Array{Int64,1},1}:
 [1, 2, 3]
 [4, 5, 6]

julia> collect(Partition(3; flush=true) |> Map(copy), 1:8)
3-element Array{Array{Int64,1},1}:
 [1, 2, 3]
 [4, 5, 6]
 [7, 8]

julia> collect(Partition(3; step=1) |> Map(copy), 1:8)
6-element Array{Array{Int64,1},1}:
 [1, 2, 3]
 [2, 3, 4]
 [3, 4, 5]
 [4, 5, 6]
 [5, 6, 7]
 [6, 7, 8]
```
"""
struct Partition <: Transducer
    size::Int
    step::Int
    flush::Bool

    function Partition(size, step, flush)
        @argcheck size > 0
        @argcheck step > 0
        return new(size, step, flush)
    end
end

Partition(size, step; flush = false) = Partition(size; step = step, flush = flush)
Partition(size; step = size, flush = false) = Partition(size, step, flush)

isexpansive(::Partition) = false
outtype(::Partition, intype) = DenseSubVector{intype}

function start(rf::R_{Partition}, result)
    buf = Vector{InType(rf)}()
    sizehint!(buf, rf.xform.size)
    return wrap(rf, (0, 0, buf), start(rf.inner, result))
end

function next(rf::R_{Partition}, result, input)
    wrapping(rf, result) do (i, s, buf), iresult
        _window_next(rf, i, s, buf, iresult, input)
    end
end

function _window_next(rf, i, s, buf, iresult, input)
    i += 1
    @assert 1 <= i <= rf.xform.size
    len = length(buf)
    if s == 0 && len < rf.xform.size
        push!(buf, input)
        if i == rf.xform.size
            # This is the first time `length(buf) == rf.xform.size` is
            # true.
            iinput = (@view buf[1:end]) :: DenseSubVector
            # Do not use `@view buf[:]` to make the indices
            # `UnitRange` instead of `OneTo`.
            @assert i == rf.xform.size
            i = 0
            s = rf.xform.step
            iresult = next(rf.inner, iresult, iinput)
            # Throw away buf[1] which is just consumed by the downstream:
            deleteat!(buf, 1)
        end
        return (i, s, buf), iresult
    elseif len < 2 * rf.xform.size - 1
        push!(buf, input)
    else
        # TODO: optimize for size < step case
        buf[i + rf.xform.size - 1] = input
    end
    if i == rf.xform.size
        # Wrapping the window.  Next window will be i=1.
        # Copy tail to head.
        copyto!(buf,
                1,                  # destination offset
                buf,
                rf.xform.size + 1,  # source offset
                rf.xform.size - 1)  # size
    end
    s -= 1
    @assert 0 <= s < rf.xform.step
    if s == 0
        s = rf.xform.step
        iinput = @view buf[i:i + rf.xform.size - 1] # unsafe_view? @inbounds?
        iinput :: DenseSubVector
        iresult = next(rf.inner, iresult, iinput)
    end
    if i == rf.xform.size
        i = 0
    end
    return (i, s, buf), iresult
end

function complete(rf::R_{Partition}, result)
    (i, s, buf), iresult = unwrap(rf, result)
    if rf.xform.flush && s != rf.xform.step
        iinput = @view buf[i:i + rf.xform.size - 1] # unsafe_view? @inbounds?
        iinput = @view iinput[s + 1:end]
        iinput :: DenseSubVector
        iresult = next(rf.inner, iresult, iinput)
        @return_if_reduced complete(rf.inner, iresult)
    end
    return complete(rf.inner, iresult)
end

# TODO: implement SVector version of Partition

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/partition-by
# https://clojuredocs.org/clojure.core/partition-by
"""
    PartitionBy(f)

Group input sequence into chunks in which `f` returns a same value
consecutively.

$_shared_vector_warning

$(_thx_clj("partition-by"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(PartitionBy(x -> (x + 1) ÷ 3) |> Map(copy), 1:9)
4-element Array{Array{Int64,1},1}:
 [1]
 [2, 3, 4]
 [5, 6, 7]
 [8, 9]
```
"""
struct PartitionBy{F} <: Transducer
    f::F
end

struct Unseen end

isexpansive(::PartitionBy) = false
outtype(::PartitionBy, intype) = Vector{intype}

function start(rf::R_{PartitionBy}, result)
    iinput = InType(rf)[]
    return wrap(rf, (iinput, Unseen()), start(rf.inner, result))
end

@inline function next(rf::R_{PartitionBy}, result, input)
    wrapping(rf, result) do (iinput, pval), iresult
        val = rf.xform.f(input)
        if pval isa Unseen || val == pval
            push!(iinput, input)
        else
            iresult = next(rf.inner, iresult, iinput)
            empty!(iinput)
            isreduced(iresult) || push!(iinput, input)
        end
        return (iinput, val), iresult
    end
end

function complete(rf::R_{PartitionBy}, ps)
    (iinput, _), iresult = unwrap(rf, ps)
    if !isempty(iinput)
        iresult = next(rf.inner, iresult, iinput)
        @return_if_reduced complete(rf.inner, iresult)
    end
    return complete(rf.inner, iresult)
end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/keep
# https://clojuredocs.org/clojure.core/keep
"""
    Keep(f)

Pass non-`nothing` output of `f` to the inner reducing step.

$(_thx_clj("keep"))

# Examples
```jldoctest
julia> using Transducers

julia> xf = Keep() do x
           if x < 3
               x + 1
           end
       end;

julia> collect(xf, 1:5)
2-element Array{Int64,1}:
 2
 3
```
"""
struct Keep{F} <: Transducer
    f::F
end

isexpansive(::Keep) = false
outtype(xf::Keep, intype) =
    Core.Compiler.typesubtract(Union{Base.return_types(xf.f, (intype,))...},
                               Nothing)

function next(rf::R_{Keep}, result, input)
    iinput = rf.xform.f(input)
    return iinput === nothing ? result : next(rf.inner, result, iinput)
end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/distinct
# https://clojuredocs.org/clojure.core/distinct
"""
    Distinct()

Pass only unseen item to the inner reducing step.

$(_thx_clj("distinct"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Distinct(), [1, 1, 2, 1, 3, 3, 2])
3-element Array{Int64,1}:
 1
 2
 3
```
"""
struct Distinct <: AbstractFilter
end

function start(rf::R_{Distinct}, result)
    seen = Set(InType(rf)[])
    return wrap(rf, seen, start(rf.inner, result))
end

function next(rf::R_{Distinct}, result, input)
    wrapping(rf, result) do seen, iresult
        if input in seen
            return seen, iresult
        else
            push!(seen, input)
            return seen, next(rf.inner, iresult, input)
        end
    end
end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/interpose
# https://clojuredocs.org/clojure.core/interpose
"""
    Interpose(sep)

Interleave input items with a `sep`.

$(_thx_clj("interpose"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Interpose(missing), 1:3)
5-element Array{Union{Missing, Int64},1}:
 1
  missing
 2
  missing
 3
```
"""
struct Interpose{T} <: Transducer
    sep::T
end

outtype(xf::Interpose, intype) = Union{typeof(xf.sep), intype}

start(rf::R_{Interpose}, result) = wrap(rf, Val(true), start(rf.inner, result))

next(rf::R_{Interpose}, result, input) =
    wrapping(rf, result) do isfirst, iresult
        if isfirst isa Val{false}
            iresult = next(rf.inner, iresult, rf.xform.sep)
        end
        return Val(false), next(rf.inner, iresult, input)
    end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/dedupe
# https://clojuredocs.org/clojure.core/dedupe
"""
    Dedupe()

De-duplicate _consecutive_ items.

$(_thx_clj("dedupe"))

# Examples
```jldoctest
julia> using Transducers

julia> collect(Dedupe(), [1, 1, 2, 1, 3, 3, 2])
5-element Array{Int64,1}:
 1
 2
 1
 3
 2
```
"""
struct Dedupe <: AbstractFilter
end

start(rf::R_{Dedupe}, result) = wrap(rf, Unseen(), start(rf.inner, result))

next(rf::R_{Dedupe}, result, input) =
    wrapping(rf, result) do prev, iresult
        if prev isa Unseen || prev != input
            return input, next(rf.inner, iresult, input)
        else
            return input, iresult
        end
    end

"""
    Scan(f, [init])

Accumulate input with binary function `f` and pass the accumulated
result so far to the inner reduction step.

The inner reducing step receives the sequence `y₁, y₂, y₃, ..., yₙ, ...`
when the sequence `x₁, x₂, x₃, ..., xₙ, ...` is fed to `Scan(f)`.

    y₁ = f(init, x₁)
    y₂ = f(y₁, x₂)
    y₃ = f(y₂, x₃)
    ...
    yₙ = f(yₙ₋₁, xₙ)

This is a generalized version of the
[_prefix sum_](https://en.wikipedia.org/wiki/Prefix_sum) also known as
_cumulative sum_, _inclusive scan_, or _scan_.

Note that the associativity of `f` is not required when the transducer
is used in a process that gurantee an order, such as [`mapfoldl`](@ref).

Unless `f` is a function with known identity element such as `+`, `*`,
`min`, `max`, and `append!`, the initial state `init` must be
provided.

$_use_initializer

See also: [`ScanEmit`](@ref), [`Iterated`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> collect(Scan(*), 1:3)
3-element Array{Int64,1}:
 1
 2
 6

julia> collect(Map(x -> x + im) |> Scan(*), 1:3)
3-element Array{Complex{Int64},1}:
 1 + 1im
 1 + 3im
 0 + 10im

julia> collect(Scan(*, 10), 1:3)
3-element Array{Int64,1}:
 10
 20
 60
```
"""
struct Scan{F, T} <: Transducer
    f::F
    init::T
end

Scan(f) = Scan(f, nothing)

_lefttype(xf::Scan{<:Any, Nothing}, intype) = typeof(identityof(xf.f, intype))
_lefttype(xf::Scan, intype) = inittypeof(xf.init, intype)

# Maybe this is fine:
# outtype(xf::Scan, intype) = Union{_lefttype(xf, intype), intype}

isexpansive(::Scan) = false
outtype(xf::Scan, intype) =
    _type_scan_fixedpoint(xf.f, _lefttype(xf, intype), intype)

function _type_scan_fixedpoint(f, A, X, limit = 10)
    for _ in 1:limit
        Y = Union{A,Base.return_types(f, (A, X))...}
        A === Y && return Y
        A = Y
    end
    return Any
end

function start(rf::R_{Scan}, result)
    if rf.xform.init === nothing
        init = identityof(rf.xform.f, InType(rf))
    else
        init = _initvalue(rf)
    end
    return wrap(rf, init, start(rf.inner, result))
end

function next(rf::R_{Scan}, result, input)
    wrapping(rf, result) do acc, iresult
        acc = rf.xform.f(acc, input)
        return acc, next(rf.inner, iresult, acc)
    end
end

"""
    ScanEmit(f, init[, onlast])

Accumulate input `x` with a function `f` with the call signature
`(u, x) -> (y, u)` and pass the result `y` to the inner reduction step.

The inner reducing step receives the sequence `y₁, y₂, y₃, ..., yₙ,
...` computed as follows

    u₀ = init
    y₁, u₁ = f(u₀, x₁)
    y₂, u₂ = f(u₁, x₂)
    y₃, u₃ = f(u₂, x₃)
    ...
    yₙ, uₙ = f(uₙ₋₁, xₙ)
    ...
    yₒₒ = onlast(uₒₒ)

when the sequence `x₁, x₂, x₃, ..., xₙ, ...` is fed to `ScanEmit(f)`.

$_use_initializer

See also: [`ScanEmit`](@ref), [`Iterated`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> collect(ScanEmit(tuple, 0), 1:3)
3-element Array{Int64,1}:
 0
 1
 2
```
"""
struct ScanEmit{F, T, L} <: Transducer
    f::F
    init::T
    onlast::L
end

ScanEmit(f, init) = ScanEmit(f, init, nothing)

isexpansive(xf::ScanEmit) = xf.onlast === nothing

function outtype(xf::ScanEmit, intype)
    U = _type_scan_fixedpoint((u, x) -> xf.f(u, x)[2],
                              inittypeof(xf.init, intype),
                              intype)
    Y = Base._return_type((u, x) -> xf.f(u, x)[1], Tuple{U, intype})
    if xf.onlast === nothing
        return Y
    end
    return Union{Y, Base._return_type(xf.onlast, Tuple{U})}
end

start(rf::R_{ScanEmit}, result) =
    wrap(rf, _initvalue(rf), start(rf.inner, result))

function next(rf::R_{ScanEmit}, result, input)
    wrapping(rf, result) do u0, iresult
        y1, u1 = rf.xform.f(u0, input)
        return u1, next(rf.inner, iresult, y1)
    end
end

function complete(rf::R_{ScanEmit}, result)
    u, iresult = unwrap(rf, result)
    if rf.xform.onlast !== nothing
        iresult = next(rf.inner, iresult, rf.xform.onlast(u))
        @return_if_reduced complete(rf.inner, iresult)
    end
    return complete(rf.inner, iresult)
end

function combine(rf::R_{ScanEmit}, a, b)
    ua, ira = unwrap(rf, a)
    ub, irb = unwrap(rf, b)
    irc = combine(rf.inner, ira, irb)
    yc, uc = rf.xform.f(ua, ub)
    irc = next(rf.inner, irc, yc)
    return wrap(rf, uc, irc)
end

"""
    Iterated(f, init[, T::Type])

Generate a sequence `init`, `f(init)`, `f(f(init))`, `f(f(f(init)))`,
and so on.

$(_shared_notes_unfold)

Use the third argument `T` to specify the output type of `f`.

$_use_initializer

See also: [`Scan`](@ref), [`ScanEmit`](@ref).

The idea is taken from
[`IterTools.iterated`](https://juliacollections.github.io/IterTools.jl/latest/#IterTools.iterated)

# Examples
```jldoctest
julia> using Transducers

julia> collect(Iterated(x -> 2x, 1), 1:5)
5-element Array{Int64,1}:
  1
  2
  4
  8
 16

julia> collect(Zip(Map(identity), Iterated(x -> 2x, 1)), 1:5)
5-element Array{Tuple{Int64,Int64},1}:
 (1, 1)
 (2, 2)
 (3, 4)
 (4, 8)
 (5, 16)
```
"""
struct Iterated{F, T} <: Transducer
    f::F
    init::T

    Iterated(f::F, init, T::Type) where F = new{F, T}(f, init)
end

Iterated(f, init::T) where T = Iterated(f, init, _type_fixedpoint(f, T))

function _type_fixedpoint(f, X, limit = 10)
    for _ in 1:limit
        Y = Union{X, Base.return_types(f, (X,))...}
        X === Y && return Y
        X = Y
    end
    return Any
end

isexpansive(::Iterated) = false
outtype(xf::Iterated{<:Any, T}, ::Any) where T = T
start(rf::R_{Iterated}, result) =
    wrap(rf, _initvalue(rf), start(rf.inner, result))
next(rf::R_{Iterated}, result, ::Any) =
    wrapping(rf, result) do istate, iresult
        return rf.xform.f(istate), next(rf.inner, iresult, istate)
    end

"""
    Count([start[, step]])

Generate a sequence `start`, `start + step`, `start + step + step`,
and so on.

$(_shared_notes_unfold)

`start` defaults to 1 and `step` defaults to `oneunit(start)`.

See also:
[`Iterators.countfrom`](https://docs.julialang.org/en/v1/base/iterators/).
[`Enumerate`](@ref)

# Examples
```jldoctest
julia> using Transducers

julia> collect(Zip(Map(identity), Count()), -3:-1)
3-element Array{Tuple{Int64,Int64},1}:
 (-3, 1)
 (-2, 2)
 (-1, 3)

julia> using Dates

julia> collect(Zip(Map(identity), Count(Day(1))) |> Map(xs -> *(xs...)), 1:3)
3-element Array{Day,1}:
 1 day
 4 days
 9 days
```
"""
struct Count{T} <: Transducer
    start::T
    step::T
end

Count(start = 1) = Count(start, oneunit(start))

isexpansive(::Count) = false
outtype(xf::Count{T}, ::Any) where T = T
start(rf::R_{Count}, result) = wrap(rf, rf.xform.start, start(rf.inner, result))
next(rf::R_{Count}, result, ::Any) =
    wrapping(rf, result) do istate, iresult
        return istate + rf.xform.step, next(rf.inner, iresult, istate)
    end

"""
    TeeZip(xform::Transducer)

Branch input into two "flows", inject one into `xform` and then merge
the output of `xform` with the original input.

$_experimental_warning

To illustrate how it works, consider the following usage

```
xf0 |> TeeZip(xf1) |> xf2
```

where `xf0`, `xf1`, and `xf2` are some transducers.  Schematically,
the output `yn` from `xfn` flows as follows:

```text
xf0      xf1                       xf2
---- y0 ------ y1 ---.-- (y0, y1) ----->
      |              |
       `-------------'
    "Tee"          "Zip"
```

# Examples
```jldoctest
julia> using Transducers
       using Transducers: TeeZip

julia> collect(TeeZip(Filter(isodd) |> Map(x -> x + 1)), 1:5)
3-element Array{Tuple{Int64,Int64},1}:
 (1, 2)
 (3, 4)
 (5, 6)
```
"""
struct TeeZip{T} <: Transducer
    xform::T
end
# The idea is to insert an object `Joiner` to the bottom of
# `Reduction` dynamically which calls to the rest of inner reductions
# after the value is zipped (joined).

# Consider a transducer:
#
#     Map(identity) |>
#         TeeZip(
#             Count() |> Filter(isodd)
#         ) |>
#         MapSplat(*)
#
# Applying this transducer to a reducing function `rf` produces
#
#     Reduction(
#         identity,
#         Splitter(
#             Reduction(
#                 Count(),
#                 Reduction(
#                     Filter(isodd),
#                     Joiner(
#                         Reduction(
#                             MapSplat(*),
#                             rf),
#                         value)))))
#
# where `value` is the placeholder for the output value of the
# transducer (here `Map(identity)`) outer to `TeeZip`.

struct Splitter{R, L} <: AbstractReduction
    inner::R
    lens::L
end

struct Joiner{F, T, intype} <: AbstractReduction
    inner::F  # original inner reduction
    value::T  # original input

    function Joiner{F,T,intype}(inner, value = MissingInit()) where {F,T,intype}
        if inner isa AbstractReduction && InType(inner) !== intype
            error("""
            `intype` specified for `Joiner` and inner reducing function
            does not match.
                intype = $intype
                InType(inner) = $(InType(inner))
            """)
        end
        if value isa MissingInit
            return new{F,T,intype}(inner)
        else
            return new{F,T,intype}(inner, value)
        end
    end
end

# TODO: move intype to the type parameter of AbstractReduction
InType(::Type{<:Splitter{Reduction{X, I, intype}}}) where {X, I, intype} =
    intype
InType(::Type{<:Joiner{F, T, intype}}) where {F, T, intype} =
    intype

finaltype(rf::Splitter) = finaltype(rf.inner)
finaltype(rf::Joiner{<:AbstractReduction}) = finaltype(rf.inner)
finaltype(rf::Joiner) = InType(rf)

Setfield.constructor_of(::Type{T}) where {T <: Joiner} = T

# It's ugly that `Reduction` returns a non-`Reduction` type!  TODO: fix it
function Reduction(xf::Composition{<:TeeZip}, f, intype::Type)
    rf, lens = _teezip_rf(xf.outer.xform, intype, (xf.inner, f, intype))
    return Splitter(rf, lens)
end

function Reduction(xf::TeeZip, f, intype::Type)
    # TODO: Don't use Map(identity) here.  (ATM, required for correct
    # InType.)
    rf, lens = _teezip_rf(xf.xform, intype, (nothing, f, intype))
    return Splitter(rf, lens)
end

# Construct reducing function and lens to `Joiner`'s `value` field in
# parallel.  In principle, this should make it possible to use nested
# `TeeZip`.  But this doesn't work ATM since `@lens _.inner` is
# hard-coded.
function _teezip_rf(xf::Composition, intype, downstream)
    intype_inner = outtype(xf.outer, intype)
    rf_inner, lens_inner = _teezip_rf(xf.inner, intype_inner, downstream)
    rf = Reduction(xf.outer, rf_inner, intype)
    if has(xf.outer, TeeZip)
        error("Nested TeeZip is currently not supported.")
    end
    return (rf, (@lens _.inner) ∘ lens_inner)
end

function _teezip_rf(xf, intype, downstream)
    xf_ds, f, intype_orig = downstream
    intype_ds = Tuple{intype_orig, outtype(xf, intype)}
    if xf_ds === nothing
        rf_ds = f
    else
        rf_ds = Reduction(xf_ds, f, intype_ds)
    end
    joiner = Joiner{typeof(rf_ds), intype_orig, intype_ds}(rf_ds)
    rf = Reduction(xf, joiner, intype)
    return (rf, @lens _.inner.value)
end

start(rf::Splitter, result) = start(rf.inner, result)
next(rf::Splitter, result, input) =
    next(set(rf.inner, rf.lens, input), result, input)
complete(rf::Splitter, result) = complete(rf.inner, result)

start(rf::Joiner, result) = start(rf.inner, result)
next(rf::Joiner, result, input) = next(rf.inner, result, (rf.value, input))
complete(rf::Joiner, result) = complete(rf.inner, result)

isexpansive(xf::TeeZip) = isexpansive(xf.xform)
outtype(xf::TeeZip, intype) = Tuple{intype, outtype(xf.xform, intype)}

function Transducer(rf::Splitter)
    xf_split, xf_ds = _rf_to_teezip(rf.inner)
    return TeeZip(xf_split) |> xf_ds
end

function _rf_to_teezip(rf::Reduction{<:Transducer, <:Joiner})
    if rf.inner.inner isa AbstractReduction
        xf = Transducer(rf.inner.inner)
    else
        xf = IdentityTransducer()
    end
    return rf.xform, xf
end

function _rf_to_teezip(rf::Reduction)
    xf_split, xf_ds = _rf_to_teezip(rf.inner)
    return rf.xform |> xf_split, xf_ds
end


# add joint
# Base.adjoint(xf::Transducer) = TeeZip(xf)

"""
    Zip(xforms...)

Zip outputs of transducers `xforms` in a tuple and pass it to the
inner reduction step.

!!! warning
    Head transducers drive tail transducers.  Be careful when using it
    with transducers other than [`Map`](@ref), especially the
    contractive ones like [`PartitionBy`](@ref) and the expansive ones
    like [`MapCat`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> collect(Zip(Map(identity), Map(x -> 10x), Map(x -> 100x)), 1:3)
3-element Array{Tuple{Int64,Int64,Int64},1}:
 (1, 10, 100)
 (2, 20, 200)
 (3, 30, 300)
```
"""
Zip(xforms...) =
    Map(_zip_init) |> _Zip(xforms...) |> Map(last)
# TODO: add `lower(xf)` mechanism so that constructing Zip does not
# immidiately create a complex composite transducer.

_Zip() = IdentityTransducer()
_Zip(xf1, xforms...) =
    TeeZip(Map(first) |> xf1) |> Map(_zip_between) |> _Zip(xforms...)

_zip_init(y0) = (y0, ())
_zip_between(((y0, ys), yn)) = (y0, (ys..., yn))

"""
    GetIndex(array)
    GetIndex{inbounds}(array)

Transform an integer input `i` to `array[i]`.

$_experimental_warning

# Examples
```jldoctest
julia> using Transducers
       using Transducers: GetIndex

julia> collect(GetIndex(1:10), [2, 3, 4])
3-element Array{Int64,1}:
 2
 3
 4

julia> collect(GetIndex{true}(1:10), [2, 3, 4])
3-element Array{Int64,1}:
 2
 3
 4
```
"""
struct GetIndex{inbounds, A} <: Transducer
    array::A
end

GetIndex{inbounds}(array::A) where {inbounds, A} = GetIndex{inbounds, A}(array)
GetIndex(array) = GetIndex{false}(array)

isexpansive(::GetIndex) = false
outtype(xf::GetIndex, ::Type{<:Integer}) = eltype(xf.array)
outtype(::GetIndex, T) =
    error("Unexpected non-integer input type for GetIndex:\n", T)

next(rf::R_{GetIndex{true}}, result, input) =
    next(rf.inner, result, @inbounds rf.xform.array[input])
next(rf::R_{GetIndex{false}}, result, input) =
    next(rf.inner, result, rf.xform.array[input])

Base.:(==)(xf1::GetIndex{inbounds,A},
           xf2::GetIndex{inbounds,A}) where {inbounds,A} =
    xf1.array == xf2.array

"""
    SetIndex(array)
    SetIndex{inbounds}(array)

Perform `array[i] = v` for each input pair `(i, v)`.

$_experimental_warning

# Examples
```jldoctest
julia> using Transducers
       using Transducers: SetIndex

julia> ys = zeros(3);

julia> mapfoldl(SetIndex(ys), first ∘ tuple, [(1, 11.1), (3, 33.3)], init=nothing)

julia> ys
3-element Array{Float64,1}:
 11.1
  0.0
 33.3
```
"""
struct SetIndex{inbounds, A} <: Transducer
    array::A
end

SetIndex{inbounds}(array::A) where {inbounds, A} = SetIndex{inbounds, A}(array)
SetIndex(array) = SetIndex{false}(array)

isexpansive(::SetIndex) = false
outtype(xf::SetIndex, ::Type{<:Integer}) = eltype(xf.array)
outtype(::SetIndex, T) =
    error("Unexpected non-integer input type for SetIndex:\n", T)

next(rf::R_{SetIndex{true}}, result, input::NTuple{2, Any}) =
    next(rf.inner, result, (@inbounds rf.xform.array[input[1]] = input[2];))
next(rf::R_{SetIndex{false}}, result, input::NTuple{2, Any}) =
    next(rf.inner, result, (rf.xform.array[input[1]] = input[2];))
# Index is `input[1]` due to `TeeZip`'s definition.  Is it better to
# flip, to be compatible with `Base.setindex!`?

Base.:(==)(xf1::SetIndex{inbounds,A},
           xf2::SetIndex{inbounds,A}) where {inbounds,A} =
    xf1.array == xf2.array


"""
    Inject(iterator)

Inject the output from `iterator` to the stream processed by the inner
reduction step.

$_experimental_warning

# Examples
```jldoctest
julia> using Transducers
       using Transducers: Inject

julia> collect(Inject(Iterators.cycle("hello")), 1:8)
8-element Array{Tuple{Int64,Char},1}:
 (1, 'h')
 (2, 'e')
 (3, 'l')
 (4, 'l')
 (5, 'o')
 (6, 'h')
 (7, 'e')
 (8, 'l')

julia> collect(Inject(Iterators.repeated([1 2])), 1:4)
4-element Array{Tuple{Int64,Array{Int64,2}},1}:
 (1, [1 2])
 (2, [1 2])
 (3, [1 2])
 (4, [1 2])

julia> collect(Inject(Iterators.product(1:2, 3:5)), 1:100)
6-element Array{Tuple{Int64,Tuple{Int64,Int64}},1}:
 (1, (1, 3))
 (2, (2, 3))
 (3, (1, 4))
 (4, (2, 4))
 (5, (1, 5))
 (6, (2, 5))
```
"""
struct Inject{T} <: Transducer
    iterator::T
end

isexpansive(::Inject) = false
outtype(xf::Inject, intype) = Tuple{intype, ieltype(xf.iterator)}
start(rf::R_{Inject}, result) =
    wrap(rf, iterate(rf.xform.iterator), start(rf.inner, result))
next(rf::R_{Inject}, result, input) =
    wrapping(rf, result) do istate, iresult
        istate === nothing && return istate, ensure_reduced(iresult)
        y, s = istate
        iresult2 = next(rf.inner, iresult, (input, y))
        return iterate(rf.xform.iterator, s), iresult2
    end


"""
    Enumerate([start[, step]])

Transducer variant of `Base.enumerate`. The `start` and `step` arguments
are optional and have the same meaning as in [`Count`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> collect(Enumerate(), ["A", "B", "C"])
3-element Array{Tuple{Int64,String},1}:
 (1, "A")
 (2, "B")
 (3, "C")

julia> start=2; step=3;

julia> collect(Enumerate(start, step), ["A", "B", "C"])
3-element Array{Tuple{Int64,String},1}:
 (2, "A")
 (5, "B")
 (8, "C")

```
"""
struct Enumerate{T} <: Transducer
    start::T
    step::T
end

Enumerate(start = 1) = Enumerate(start, oneunit(start))

isexpansive(::Enumerate) = false
outtype(xf::Enumerate{T}, intype) where {T} = Tuple{T, intype}
start(rf::R_{Enumerate}, result) =
    wrap(rf, rf.xform.start, start(rf.inner, result))
next(rf::R_{Enumerate}, result, input) =
    wrapping(rf, result) do i, iresult
        iresult2 = next(rf.inner, iresult, (i, input))
        i + rf.xform.step, iresult2
    end
