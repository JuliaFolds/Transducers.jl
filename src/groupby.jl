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

function GroupBy(key, xf::Transducer, step = right, init = DefaultInit)
    rf = _reducingfunction(xf, step; init = init)
    return GroupBy(key, rf, init)
end

GroupBy(key, rf) = GroupBy(key, _asmonoid(rf), DefaultInit)

# `GroupByViewDict` wraps a dictionary whose values are the
# (composite) states of the reducing function and provides a view such
# that the its values are the state/result/accumulator of the bottom
# reducing function.
struct GroupByViewDict{K,V,S<:DefaultInitOf,D<:AbstractDict{K}} <: AbstractDict{K,V}
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

function Base.get(dict::GroupByViewDict{<:Any,<:Any,S}, key, default) where {S}
    value = unwrap_all(unreduced(dict.state[key]))
    return value isa S ? default : value
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
                gr0 = start(xform(rf).rf, xform(rf).init)
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
