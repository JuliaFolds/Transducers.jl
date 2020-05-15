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
Pass [`OnInit`](@ref) or [`CopyInit`](@ref) object to `init` for creating
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

Map(::Type{T}) where T = Map{Type{T}}(T)  # specialization workaround

isexpansive(::Map) = false
next(rf::R_{Map}, result, input) = next(inner(rf), result, xform(rf).f(input))

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

MapSplat(::Type{T}) where T = MapSplat{Type{T}}(T)  # specialization workaround

isexpansive(::MapSplat) = false
next(rf::R_{MapSplat}, result, input) =
    next(inner(rf), result, xform(rf).f(input...))

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
5-element Array{Any,1}:
 0
  :a
  :b
  :c
 4

julia> collect(Replace("abc"), 0:4)
5-element Array{Any,1}:
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
next(rf::R_{Replace}, result, input) =
    next(inner(rf), result, get(xform(rf).d, input, input))

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

@inline next(rf::R_{Cat}, result, input) = foldl_nocomplete(inner(rf), result, input)

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

"""
    TCat(basesize::Integer)

Threaded version of [`Cat`](@ref) (concatenate/flatten).

To use this transducer, all the downstream (inner) transducers must be
stateless (or of type [`ScanEmit`](@ref)) and the reducing function
must be associative.  See also: [Parallel processing tutorial](@ref
tutorial-parallel).

Note that the upstream (outer) transducers need not to be stateless as
long as it is called with non-parallel reduction such as
[`foldl`](@ref) and [`collect`](@ref).

# Examples
```jldoctest
julia> using Transducers

julia> tcollect(Map(x -> 1:x) |> TCat(1), 1:3)
6-element Array{Int64,1}:
 1
 1
 2
 1
 2
 3

julia> collect(Scan(+) |> Map(x -> 1:x) |> TCat(1), 1:3)
10-element Array{Int64,1}:
 1
 1
 2
 3
 1
 2
 3
 4
 5
 6
```
"""
struct TCat <: Transducer
    basesize::Int
    function TCat(basesize::Integer)
        @argcheck basesize > 0
        return new(Int(basesize))
    end
end

# Do not recurse into `start(inner(rf), ...)`; it's called via transduce
start(rf::R_{TCat}, init) = wrap(rf, init, Unseen())

function complete(rf::R_{TCat}, result)
    init, iresult = unwrap(rf, result)
    iresult isa Unseen && return init  # `next` never called
    return complete(inner(rf), iresult)
end

next(rf::R_{TCat}, result, input) =
    wrapping(rf, result) do init, acc
        subresult = _transduce_assoc_nocomplete(
            inner(rf),
            init,
            input,
            xform(rf).basesize,
        )
        subresult isa Reduced && return init, subresult
        acc isa Unseen && return init, subresult
        return init, combine(inner(rf), acc, subresult)
    end

function combine(rf::R_{TCat}, a, b)
    ua, ira = unwrap(rf, a)
    ira isa Unseen && return b  # this handles `irb isa Unseen` as well
    ub, irb = unwrap(rf, b)
    # @assert ua == ub  # == init
    irc = combine(inner(rf), ira, irb)
    return wrap(rf, ua, irc)
end

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
    xform(rf).pred(input) ? next(inner(rf), result, input) : result

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
```
"""
struct NotA{T} <: AbstractFilter end
NotA(T::Type) = NotA{T}()

next(rf::R_{NotA{T}}, result, input) where T =
    input isa T ? result : next(inner(rf), result, input)

# **Side notes**.  Although in principle `NotA(Missing)` can yields a
# better performance than `Filter(!ismissing)` (by providing more type
# information to the compiler), it seems `Filter(!ismissing)` is
# enough for a small example.  See:
# https://discourse.julialang.org/t/19159/11

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
```
"""
struct OfType{T} <: AbstractFilter end
OfType(T::Type) = OfType{T}()

@inline next(rf::R_{OfType{T}}, result, input) where T =
    _next_oftype(T, inner(rf), result, input)

# Following implementation yields semantically correct results for all
# cases.  However, as of writing (Julia 1.2.0-DEV), it seems those
# specializations are valuable for type-stability and performance.
# Hopefully compiler becomes smarter so that I can get rid of the code
# below.
@inline _next_oftype(T, inner, result, input) =
    input isa T ? next(inner, result, input) : result

# Workaround StackOverflowError in Julia 1.0
# https://travis-ci.com/tkf/Transducers.jl/jobs/171732596
if VERSION >= v"1.1-"

@inline _next_oftype(T, inner, result, input::Tuple) =
    _next_oftype_t(T, inner, result, (), input...)

# Following specialization is required for improving performance of
# ../benchmark/bench_missing_dot.jl.  Note that a mere type-stability
# of `transduce(rf, 0.0, zip(xs, ys))` can actually be achieved by the
# function `_next_oftype_t` below for generic tuple.  I don't know why
# the following manual expansion is better than `_next_oftype_t` when
# both are type stable.
@inline function _next_oftype(::Type{T}, inner, result,
                              (i1, i2)::Tuple{Any, Any}) where {T <: Tuple}
    if i1 isa nthtype(Val(1), T)
        if i2 isa nthtype(Val(2), T)
            return next(inner, result, (i1, i2))
        end
    end
    return result
end

@inline _next_oftype_t(::Type, inner, result, filtered::Tuple) =
    next(inner, result, filtered)

@inline function _next_oftype_t(
        ::Type{T}, inner, result, filtered::Tuple,
        i1, input...) where {T <: Tuple}
    if i1 isa nthtype(Val(1), T)
        return _next_oftype_t(
            Base.tuple_type_tail(T),
            inner,
            result,
            (filtered..., i1),
            input...)
    end
    return result
end
# Not using `Base.tail(input)` for a Tuple-of-(possibly)-Union seems
# to be a nice strategy for achieving type-stability.

end  # if

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

start(rf::R_{Take}, result) = wrap(rf, xform(rf).n, start(inner(rf), result))
complete(rf::R_{Take}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{Take}, result, input) =
    wrapping(rf, result) do n, iresult
        if n > 0
            iresult = next(inner(rf), iresult, input)
            n -= 1
        end
        if n <= 0
            iresult = reduced(complete(inner(rf), iresult))
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
    n = xform(rf).n
    return wrap(rf, (-n, Union{}[]), start(inner(rf), result))
end

next(rf::R_{TakeLast}, result, input) =
    wrapping(rf, result) do (c, buffer0), iresult
        c += 1
        n = xform(rf).n
        if c <= 0
            buffer = push!!(buffer0, input)
            (c, buffer), iresult
        else
            @assert length(buffer0) == n
            buffer = setindex!!(buffer0, input, c)
            (c < n ? c : 0, buffer), iresult
        end
    end

function complete(rf::R_{TakeLast}, result)
    (c, buffer), iresult = unwrap(rf, result)
    if c <= 0  # buffer is not full (or c is just wrapping)
        for i in 1:length(buffer)
            iresult = @next(inner(rf), iresult, @inbounds buffer[i])
        end
    else
        for i in c+1:length(buffer)
            iresult = @next(inner(rf), iresult, @inbounds buffer[i])
        end
        for i in 1:c
            iresult = @next(inner(rf), iresult, @inbounds buffer[i])
        end
    end
    return complete(inner(rf), iresult)
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
    if xform(rf).pred(input)
        next(inner(rf), result, input)
    else
        reduced(complete(inner(rf), result))
    end

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

start(rf::R_{TakeNth}, result) = wrap(rf, xform(rf).n, start(inner(rf), result))
complete(rf::R_{TakeNth}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{TakeNth}, result, input) =
    wrapping(rf, result) do c, iresult
        if c == xform(rf).n
            iresult = next(inner(rf), iresult, input)
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

start(rf::R_{Drop}, result) = wrap(rf, 0, start(inner(rf), result))
complete(rf::R_{Drop}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{Drop}, result, input) =
    wrapping(rf, result) do c, iresult
        if c >= xform(rf).n
            c, next(inner(rf), iresult, input)
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

julia> collect(DropLast(2), 1:1) == []
true

julia> collect(DropLast(2), 1:0) == []
true
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
    n = xform(rf).n + 1
    return wrap(rf, (-n, Union{}[]), start(inner(rf), result))
end

complete(rf::R_{DropLast}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{DropLast}, result, input) =
    wrapping(rf, result) do (c, buffer0), iresult
        c += 1
        n = xform(rf).n + 1
        if c <= 0
            buffer = push!!(buffer0, input)
            if c == 0
                @assert length(buffer) == n
                (c, buffer), next(inner(rf), iresult, buffer[1])
            else
                (c, buffer), iresult
            end
        elseif c >= n
            buffer = setindex!!(buffer0, input, c)
            (0, buffer), next(inner(rf), iresult, buffer[1])
        else
            buffer = setindex!!(buffer0, input, c)
            (c, buffer), next(inner(rf), iresult, buffer[c + 1])
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

start(rf::R_{DropWhile}, result) = wrap(rf, true, start(inner(rf), result))
complete(rf::R_{DropWhile}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{DropWhile}, result, input) =
    wrapping(rf, result) do dropping, iresult
        if dropping
            dropping = xform(rf).pred(input)
            dropping && return (dropping, iresult)
        end
        dropping, next(inner(rf), iresult, input)
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

start(rf::R_{FlagFirst}, result) = wrap(rf, true, start(inner(rf), result))
complete(rf::R_{FlagFirst}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{FlagFirst}, result, input) =
    wrapping(rf, result) do isfirst, iresult
        false, next(inner(rf), iresult, (isfirst, input))
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

function start(rf::R_{Partition}, result)
    buf = Union{}[]
    return wrap(rf, (0, 0, buf), start(inner(rf), result))
end

function next(rf::R_{Partition}, result, input)
    wrapping(rf, result) do (i, s, buf), iresult
        _window_next(rf, i, s, buf, iresult, input)
    end
end

function _window_next(rf, i, s, buf0, iresult, input)
    i += 1
    @assert 1 <= i <= xform(rf).size
    len = length(buf0)
    if s == 0 && len < xform(rf).size
        buf = push!!(buf0, input)
        if i == xform(rf).size
            # This is the first time `length(buf) == xform(rf).size` is
            # true.
            iinput = (@view buf[1:end]) :: DenseSubVector
            # Do not use `@view buf[:]` to make the indices
            # `UnitRange` instead of `OneTo`.
            @assert i == xform(rf).size
            i = 0
            s = xform(rf).step
            iresult = next(inner(rf), iresult, iinput)
            # Throw away buf[1] which is just consumed by the downstream:
            deleteat!(buf, 1)
        end
        return (i, s, buf), iresult
    elseif len < 2 * xform(rf).size - 1
        buf = push!!(buf0, input)
    else
        # TODO: optimize for size < step case
        buf = setindex!!(buf0, input, i + xform(rf).size - 1)
    end
    if i == xform(rf).size
        # Wrapping the window.  Next window will be i=1.
        # Copy tail to head.
        copyto!(buf,
                1,                  # destination offset
                buf,
                xform(rf).size + 1,  # source offset
                xform(rf).size - 1)  # size
    end
    s -= 1
    @assert 0 <= s < xform(rf).step
    if s == 0
        s = xform(rf).step
        iinput = @view buf[i:i + xform(rf).size - 1] # unsafe_view? @inbounds?
        iinput :: DenseSubVector
        iresult = next(inner(rf), iresult, iinput)
    end
    if i == xform(rf).size
        i = 0
    end
    return (i, s, buf), iresult
end

function complete(rf::R_{Partition}, result)
    (i, s, buf), iresult = unwrap(rf, result)
    if xform(rf).flush && s != xform(rf).step
        iinput = @view buf[i:i + xform(rf).size - 1] # unsafe_view? @inbounds?
        iinput = @view iinput[s + 1:end]
        iinput :: DenseSubVector
        iresult = @next(inner(rf), iresult, iinput)
    end
    return complete(inner(rf), iresult)
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

function start(rf::R_{PartitionBy}, result)
    iinput = Union{}[]
    return wrap(rf, (iinput, Unseen()), start(inner(rf), result))
end

@inline function next(rf::R_{PartitionBy}, result, input)
    wrapping(rf, result) do (iinput, pval), iresult
        val = xform(rf).f(input)
        if pval isa Unseen || val == pval
            iinput = push!!(iinput, input)
        else
            iresult = next(inner(rf), iresult, iinput)
            iinput = empty!!(iinput)
            if !isreduced(iresult)
                iinput = push!!(iinput, input)
            end
        end
        return (iinput, val), iresult
    end
end

function complete(rf::R_{PartitionBy}, ps)
    (iinput, _), iresult = unwrap(rf, ps)
    if !isempty(iinput)
        iresult = @next(inner(rf), iresult, iinput)
    end
    return complete(inner(rf), iresult)
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

function next(rf::R_{Keep}, result, input)
    iinput = xform(rf).f(input)
    return iinput === nothing ? result : next(inner(rf), result, iinput)
end

# https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/distinct
# https://clojuredocs.org/clojure.core/distinct
"""
    Unique(by = identity)

Pass only unseen item to the inner reducing step.

The item is distinguished by the output of function `by` when given.

$(_thx_clj("distinct"))

!!! compat "Transducers.jl 0.4.2"

    New in version 0.4.2.

# Examples
```jldoctest
julia> using Transducers

julia> collect(Unique(), [1, 1, 2, -1, 3, 3, 2])
4-element Array{Int64,1}:
  1
  2
 -1
  3

julia> collect(Unique(x -> x^2), [1, 1, 2, -1, 3, 3, 2])
3-element Array{Int64,1}:
 1
 2
 3
```
"""
struct Unique{P} <: AbstractFilter
    by::P
end

Unique() = Unique(identity)

function start(rf::R_{Unique}, result)
    seen = Set(Union{}[])
    return wrap(rf, seen, start(inner(rf), result))
end

complete(rf::R_{Unique}, result) = complete(inner(rf), unwrap(rf, result)[2])

function next(rf::R_{Unique}, result, input)
    wrapping(rf, result) do seen, iresult
        y = xform(rf).by(input)
        if y in seen
            return seen, iresult
        else
            seen′ = push!!(seen, y)
            return seen′, next(inner(rf), iresult, input)
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

start(rf::R_{Interpose}, result) = wrap(rf, Val(true), start(inner(rf), result))
complete(rf::R_{Interpose}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{Interpose}, result, input) =
    wrapping(rf, result) do isfirst, iresult
        if isfirst isa Val{false}
            iresult = next(inner(rf), iresult, xform(rf).sep)
        end
        return Val(false), next(inner(rf), iresult, input)
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

start(rf::R_{Dedupe}, result) = wrap(rf, Unseen(), start(inner(rf), result))
complete(rf::R_{Dedupe}, result) = complete(inner(rf), unwrap(rf, result)[2])

next(rf::R_{Dedupe}, result, input) =
    wrapping(rf, result) do prev, iresult
        if prev isa Unseen || prev != input
            return input, next(inner(rf), iresult, input)
        else
            return input, iresult
        end
    end

"""
    Scan(f, [init = Init])

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
is used in a process that gurantee an order, such as [`foldl`](@ref).

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

Scan(f) = Scan(f, makeid(f, Init))

isexpansive(::Scan) = false

function start(rf::R_{Scan}, result)
    init = _initvalue(rf)
    return wrap(rf, init, start(inner(rf), result))
end

complete(rf::R_{Scan}, result) = complete(inner(rf), unwrap(rf, result)[2])

function next(rf::R_{Scan}, result, input)
    wrapping(rf, result) do acc, iresult
        acc = xform(rf).f(acc, input)
        return acc, next(inner(rf), iresult, acc)
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

See also: [`Scan`](@ref), [`Iterated`](@ref).

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

isexpansive(xf::ScanEmit) = xf.onlast !== nothing

start(rf::R_{ScanEmit}, result) =
    wrap(rf, _initvalue(rf), start(inner(rf), result))

function next(rf::R_{ScanEmit}, result, input)
    wrapping(rf, result) do u0, iresult
        y1, u1 = xform(rf).f(u0, input)
        return u1, next(inner(rf), iresult, y1)
    end
end

function complete(rf::R_{ScanEmit}, result)
    u, iresult = unwrap(rf, result)
    if xform(rf).onlast !== nothing
        iresult = @next(inner(rf), iresult, xform(rf).onlast(u))
    end
    return complete(inner(rf), iresult)
end

function combine(rf::R_{ScanEmit}, a, b)
    ua, ira = unwrap(rf, a)
    ub, irb = unwrap(rf, b)
    irc = combine(inner(rf), ira, irb)
    yc, uc = xform(rf).f(ua, ub)
    irc = next(inner(rf), irc, yc)
    return wrap(rf, uc, irc)
end

"""
    AdHocXF(f, init, [onlast])

# Examples
```jldoctest
julia> using Transducers
       using Transducers: AdHocXF, @next
       using Setfield: @set!

julia> flushlast(rf, result) = rf(@next(rf, result, result.state));

julia> xf = AdHocXF(nothing, flushlast) do rf, result, input
           m = match(r"^name:(.*)", input)
           if m === nothing
               push!(result.state.lines, input)
               return result
           else
               chunk = result.state
               @set! result.state = (name=strip(m.captures[1]), lines=String[])
               push!(result.state.lines, input)
               if chunk === nothing
                   return result
               else
                   return rf(result, chunk)
               end
           end
       end;

julia> collect(xf, split(\"\"\"
       name: Map
       type: onetoone
       name: Cat
       type: expansive
       name: Filter
       type: contractive
       name: Cat |> Filter
       type: chaotic
       \"\"\", "\\n"; keepempty=false))
4-element Array{NamedTuple{(:name, :lines),Tuple{SubString{String},Array{String,1}}},1}:
 (name = "Map", lines = ["name: Map", "type: onetoone"])
 (name = "Cat", lines = ["name: Cat", "type: expansive"])
 (name = "Filter", lines = ["name: Filter", "type: contractive"])
 (name = "Cat |> Filter", lines = ["name: Cat |> Filter", "type: chaotic"])
```
"""
struct AdHocXF{F, T, L} <: Transducer
    f::F
    init::T
    onlast::L
end

AdHocXF(f, init) = AdHocXF(f, init, nothing)

struct ResultShim{S, R}
    state::S
    result::R
end

struct RFShim{F}
    rf::F
end

_setresult(shim, result::Reduced) = Reduced(@set shim.result = unreduced(result))
_setresult(shim, result) = @set shim.result = result

(f::RFShim)(shim::ResultShim) =
    _setresult(shim, complete(f.rf, shim.result))
(f::RFShim)(shim::ResultShim, input) =
    _setresult(shim, next(f.rf, shim.result, input))

start(rf::R_{AdHocXF}, result) =
    wrap(rf, _initvalue(rf), start(inner(rf), result))

next(rf::R_{AdHocXF}, result, input) =
    wrapping(rf, result) do state, iresult
        shim = xform(rf).f(RFShim(inner(rf)), ResultShim(state, iresult), input)
        if shim isa Reduced
            return unreduced(shim).state, Reduced(unreduced(shim).result)
        else
            return shim.state, shim.result
        end
    end

function complete(rf::R_{AdHocXF}, result)
    state, iresult = unwrap(rf, result)
    onlast = xform(rf).onlast
    if onlast !== nothing
        shim = onlast(RFShim(inner(rf)), ResultShim(state, iresult))
        if shim isa Reduced
            return Reduced(unreduced(shim).result)
        else
            return shim.result
        end
    end
    return complete(inner(rf), iresult)
end

"""
    Iterated(f, init)

Generate a sequence `init`, `f(init)`, `f(f(init))`, `f(f(f(init)))`,
and so on.

$(_shared_notes_unfold)

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
end

isexpansive(::Iterated) = false
start(rf::R_{Iterated}, result) =
    wrap(rf, _initvalue(rf), start(inner(rf), result))
complete(rf::R_{Iterated}, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::R_{Iterated}, result, ::Any) =
    wrapping(rf, result) do istate, iresult
        return xform(rf).f(istate), next(inner(rf), iresult, istate)
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

julia> collect(Zip(Map(identity), Count(Day(1))) |> Map(xs -> *(xs...)), 1:3) ==
       [Day(1), Day(4), Day(9)]
true
```
"""
struct Count{T} <: Transducer
    start::T
    step::T
end

Count(start = 1) = Count(start, oneunit(start))

isexpansive(::Count) = false
start(rf::R_{Count}, result) = wrap(rf, xform(rf).start, start(inner(rf), result))
complete(rf::R_{Count}, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::R_{Count}, result, ::Any) =
    wrapping(rf, result) do istate, iresult
        return istate + xform(rf).step, next(inner(rf), iresult, istate)
    end

"""
    ZipSource(xform::Transducer)

Branch input into two "flows", inject one into `xform` and then merge
(zip) the output of `xform` with the original (source) input.

$_experimental_warning

To illustrate how it works, consider the following usage

```
xf0 |> ZipSource(xf1) |> xf2
```

where `xf0`, `xf1`, and `xf2` are some transducers.  Schematically,
the output `yn` from `xfn` flows as follows:

```text
xf0      xf1                       xf2
---- y0 ------ y1 ---.-- (y0, y1) ----->
      |              |
       `-------------'
```

# Examples
```jldoctest
julia> using Transducers
       using Transducers: ZipSource

julia> collect(ZipSource(Filter(isodd) |> Map(x -> x + 1)), 1:5)
3-element Array{Tuple{Int64,Int64},1}:
 (1, 2)
 (3, 4)
 (5, 6)
```
"""
struct ZipSource{T} <: Transducer
    xform::T
end
# The idea is to insert an object `Joiner` to the bottom of
# `Reduction` dynamically which calls to the rest of inner reductions
# after the value is zipped (joined).

# Consider a transducer:
#
#     Map(identity) |>
#         ZipSource(
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
#                             rf))))))

struct Splitter{R} <: AbstractReduction{R}
    inner::R
end

setinner(rf::Splitter, inner) = Splitter(inner)
reform(rf::Splitter, f) = Splitter(reform(inner(rf), f))

struct Joiner{F} <: AbstractReduction{F}
    inner::F  # original inner reduction
end

setinner(rf::Joiner, inner) = Joiner(inner)
reform(rf::Joiner, f) = Joiner(reform(inner(rf), f))

# It's ugly that `Reduction` returns a non-`Reduction` type!  TODO: fix it
function Reduction(xf::Composition{<:ZipSource}, f)
    @nospecialize
    rf = _teezip_rf(xf.outer.xform, (xf.inner, f))
    return Splitter(rf)
end

function Reduction(xf::ZipSource, f)
    @nospecialize
    rf = _teezip_rf(xf.xform, (nothing, f))
    return Splitter(rf)
end

function _teezip_rf(xf::Composition, downstream)
    @nospecialize
    rf_inner = _teezip_rf(xf.inner, downstream)
    return Reduction(xf.outer, rf_inner)
end

function _teezip_rf(xf, downstream)
    @nospecialize
    xf_ds, f = downstream
    if xf_ds === nothing
        rf_ds = ensurerf(f)
    else
        rf_ds = Reduction(xf_ds, f)
    end
    joiner = Joiner(rf_ds)
    return Reduction(xf, joiner)
end

const SplitterState = PrivateState{<:Splitter}
const JoinerState = PrivateState{<:Joiner}

"""
    _set_joiner_value(ps::PrivateState, x) :: PrivateState

Set `.state` field of the `PrivateState` of the first "unbalanced"
`Joiner`.  A `Joiner` matched with preceding `Splitter` would be
treated as a regular reducing function node.  Thus, private state `ps`
must have one more `Joiner` than `Splitter`.
"""
@inline _set_joiner_value(ps, x) = _set_joiner_value(ps, x, Val(0))
@inline _set_joiner_value(ps::JoinerState, x, ::Val{0}) =
    setpsstate(ps, x)
@inline _set_joiner_value(ps::JoinerState, x, ::Val{c}) where c =
    setpsresult(ps, _set_joiner_value(psresult(ps), x, Val(c - 1)))
@inline _set_joiner_value(ps::SplitterState, x, ::Val{c}) where c =
    setpsresult(ps, _set_joiner_value(psresult(ps), x, Val(c + 1)))
@inline _set_joiner_value(ps, x, VC) =
    setpsresult(ps, _set_joiner_value(psresult(ps), x, VC))
#
# Writing above with a single function was much easier to read.
# However, it didn't work with the compiler (which tries to
# dynamically allocate type variable somehow).

start(rf::Splitter, result) = wrap(rf, nothing, start(inner(rf), result))
complete(rf::Splitter, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::Splitter, result, input) =
    wrapping(rf, result) do _, iresult
        nothing, next(inner(rf), _set_joiner_value(iresult, input), input)
    end

start(rf::Joiner, result) = wrap(rf, nothing, start(inner(rf), result))
complete(rf::Joiner, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::Joiner, result, input) =
    wrapping(rf, result) do state, iresult
        state, next(inner(rf), iresult, (state, input))
    end
# Putting `state` back to make it type stable.

isexpansive(xf::ZipSource) = isexpansive(xf.xform)

function Transducer(rf::Splitter)
    xf_split, rf_ds = _rf_to_teezip(inner(rf))
    return ZipSource(xf_split) |> Transducer(rf_ds)
end

function _rf_to_teezip(rf::Reduction)
    xf_split, rf_ds = _rf_to_teezip(inner(rf))
    return xform(rf) |> xf_split, rf_ds
end

_rf_to_teezip(rf::Joiner) = IdentityTransducer(), inner(rf)

function _rf_to_teezip(rf::Splitter)
    xf_split, rf_inner = _rf_to_teezip(inner(rf))
    xf_inner, rf_ds = _rf_to_teezip(rf_inner)
    return ZipSource(xf_split) |> xf_inner, rf_ds
end


# add joint
# Base.adjoint(xf::Transducer) = ZipSource(xf)

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
    ZipSource(Map(first) |> xf1) |> Map(_zip_between) |> _Zip(xforms...)

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

next(rf::R_{GetIndex{true}}, result, input) =
    next(inner(rf), result, @inbounds xform(rf).array[input])
next(rf::R_{GetIndex{false}}, result, input) =
    next(inner(rf), result, xform(rf).array[input])

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

julia> foldl(first ∘ tuple, SetIndex(ys), [(1, 11.1), (3, 33.3)], init=nothing)

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

next(rf::R_{SetIndex{true}}, result, input::NTuple{2, Any}) =
    next(inner(rf), result, (@inbounds xform(rf).array[input[1]] = input[2];))
next(rf::R_{SetIndex{false}}, result, input::NTuple{2, Any}) =
    next(inner(rf), result, (xform(rf).array[input[1]] = input[2];))
# Index is `input[1]` due to `ZipSource`'s definition.  Is it better to
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
start(rf::R_{Inject}, result) =
    wrap(rf, iterate(xform(rf).iterator), start(inner(rf), result))
complete(rf::R_{Inject}, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::R_{Inject}, result, input) =
    wrapping(rf, result) do istate, iresult
        istate === nothing && return istate, reduced(complete(inner(rf), iresult))
        y, s = istate
        iresult2 = next(inner(rf), iresult, (input, y))
        return iterate(xform(rf).iterator, s), iresult2
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
start(rf::R_{Enumerate}, result) =
    wrap(rf, xform(rf).start, start(inner(rf), result))
complete(rf::R_{Enumerate}, result) = complete(inner(rf), unwrap(rf, result)[2])
next(rf::R_{Enumerate}, result, input) =
    wrapping(rf, result) do i, iresult
        iresult2 = next(inner(rf), iresult, (i, input))
        i + xform(rf).step, iresult2
    end

"""
    GroupBy(key, rf, [init])
    GroupBy(key, xf::Transducer, [step = right, [init]])

Group the input stream by a function `key` and then fan-out each group
of key-value pairs to the reducing function `rf`.

For example, if `GroupBy` is used as in:

    Map(upstream) |> GroupBy(key, rf, init) |> Map(downstream)

then the "function signatures" would be:

    upstream(_) :: V
    key(::V) :: K
    rf(::Y, ::Pair{K, V}) ::Y
    downstream(::Dict{K, Y})

That is to say,

* Ouput of the `upstream` is fed into the function `key` that produces
  the group key (of type `K`).

* For each new group key, a new transducible process is started with
  the initial state `init :: Y`.  Pass [`OnInit`](@ref) or
  [`CopyInit`](@ref) object to `init` for creating a dedicated
  (possibly mutable) state for each group.

* After one "nested" reducing function `rf` is called, the
  intermediate result dictionary (of type `Dict{K, Y}`) accumulating
  the current and all preceding results is then fed into the
  `downstream`.

See also `groupreduce` in
[SplitApplyCombine.jl](https://github.com/JuliaData/SplitApplyCombine.jl).

!!! compat "Transducers.jl 0.3"

    New in version 0.3.

# Examples
```jldoctest
julia> using Transducers
       using BangBang  # for `push!!`

julia> foldl(right, GroupBy(string, Map(last), push!!), [1, 2, 1, 2, 3])
Transducers.GroupByViewDict{String,Array{Int64,1},…} with 3 entries:
  "1" => [1, 1]
  "2" => [2, 2]
  "3" => [3]
```

Note that the reduction stops if one of the group returns a
[`reduced`](@ref).  This can be used, for example, to find if there is
a group with a sum grater than 3 and stop the computation as soon as
it is find:

```jldoctest; setup = :(using Transducers)
julia> result = transduce(
           GroupBy(
               string,
               Map(last) |> Scan(+) |> ReduceIf(x -> x > 3),
           ),
           right,
           nothing,
           [1, 2, 1, 2, 3],
       );

julia> result isa Reduced
true

julia> unreduced(result)
Transducers.GroupByViewDict{String,Any,…} with 2 entries:
  "1" => 2
  "2" => 4
```
"""
struct GroupBy{K, R, T} <: Transducer
    key::K
    rf::R
    init::T
end

function GroupBy(key, xf::Transducer, step = right, init = MissingInit())
    rf = _reducingfunction(xf, step; init = init)
    if init isa MissingInit
        return GroupBy(key, rf)
    else
        return GroupBy(key, rf, makeid(_realbottomrf(step), init))
    end
end

function GroupBy(key, rf0)
    rf = _asmonoid(rf0)
    op = _realbottomrf(rf)
    return GroupBy(key, rf, DefaultInit(op))
end

# `GroupByViewDict` wraps a dictionary whose values are the
# (composite) states of the reducing function and provides a view such
# that the its values are the state/result/accumulator of the bottom
# reducing function.
struct GroupByViewDict{K,V,S<:DefaultInit,D<:AbstractDict{K}} <: AbstractDict{K,V}
    state::D
end

# https://github.com/JuliaLang/julia/issues/30751
_typesubtract(::Type{Larger}, ::Type{Smaller}) where {Larger,Smaller} =
    _typesubtract_impl(Smaller, Larger)
_typesubtract_impl(::Type{T}, ::Type{T}) where {T} = Union{}
_typesubtract_impl(::Type{T}, ::Type{Union{T,S}}) where {S,T} = S
_typesubtract_impl(::Type, ::Type{S}) where {S} = S

function GroupByViewDict(state::AbstractDict{K,V0}, xf::GroupBy) where {K,V0}
    S = typeof(DefaultInit(_realbottomrf(xf.rf)))
    V = _typesubtract(V0, S)
    return GroupByViewDict{K,V,S,typeof(state)}(state)
end

struct _NoValue end

Base.IteratorSize(::Type{<:GroupByViewDict}) = Base.SizeUnknown()
function Base.iterate(dict::GroupByViewDict{<:Any,<:Any,S}, state = _NoValue()) where {S}
    y = state isa _NoValue ? iterate(dict.state) : iterate(dict.state, state)
    y === nothing && return nothing
    while true
        (k, v), state = y
        v isa S || return (k => unwrap_all(unreduced(v))), state
        y = iterate(dict.state, state)
        y === nothing && return nothing
    end
end

Base.length(dict::GroupByViewDict) = count(true for _ in dict)
function Base.showarg(io::IO, dict::GroupByViewDict, _toplevel)
    print(io, GroupByViewDict, '{', keytype(dict), ',', valtype(dict), ",…}")
end

function Base.getindex(dict::GroupByViewDict{<:Any,<:Any,S}, key) where {S}
    value = unwrap_all(unreduced(dict.state[key]))
    value isa S && throw(KeyError(key))
    return value
end

function start(rf::R_{GroupBy}, result)
    gstate = Dict{Union{},Union{}}()
    return wrap(rf, gstate, start(inner(rf), result))
end

complete(rf::R_{GroupBy}, result) = complete(inner(rf), unwrap(rf, result)[2])

@inline function next(rf::R_{GroupBy}, result, input)
    wrapping(rf, result) do gstate, iresult
        key = xform(rf).key(input)
        gstate, somegr = modify!!(gstate, key) do value
            if value === nothing
                gr0 = start(xform(rf).rf, initvalue(xform(rf).init))
            else
                gr0 = something(value)
            end
            return Some(next(xform(rf).rf, gr0, key => input))  # Some(gr)
        end
        gr = something(somegr)
        iresult = next(inner(rf), iresult, GroupByViewDict(gstate, xform(rf)))
        if gr isa Reduced && !(iresult isa Reduced)
            return gstate, reduced(complete(inner(rf), iresult))
        else
            return gstate, iresult
        end
    end
end

function combine(rf::R_{GroupBy}, a, b)
    gstate_a, ira = unwrap(rf, a)
    gstate_b, irb = unwrap(rf, b)
    gstate_c = mergewith!!(gstate_a, gstate_b) do ua, ub
        combine(xform(rf).rf, ua, ub)
    end
    irc = combine(inner(rf), ira, irb)
    irc = next(inner(rf), irc, GroupByViewDict(gstate_c, xform(rf)))
    return wrap(rf, gstate_c, irc)
end

"""
    ReduceIf(pred)

Stop fold when `pred(x)` returns `true` for the output `x` of the
upstream transducer.

# Examples
```jldoctest
julia> using Transducers

julia> foldl(right, ReduceIf(x -> x == 3), 1:10)
3
```
"""
struct ReduceIf{P} <: AbstractFilter
    pred::P
end

function next(rf::R_{ReduceIf}, result0, input)
    shouldreduce = xform(rf).pred(input)
    result = next(inner(rf), result0, input)
    if shouldreduce
        return reduced(complete(inner(rf), result))
    end
    return result
end

# More immediate version of `ReduceIf`.  Not sure if this is useful so
# not exporting it ATM.
struct AbortIf{P} <: AbstractFilter
    pred::P
end

next(rf::R_{AbortIf}, result, input) =
    if xform(rf).pred(input)
        return reduced(complete(inner(rf), result))
    else
        return next(inner(rf), result, input)
    end
