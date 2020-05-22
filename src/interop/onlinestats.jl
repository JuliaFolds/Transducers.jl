"""
    Transducer(o::OnlineStat)

Use an `OnlineStat` as a stateful transducer.

It is implemented as:

```julia
Scan(fit!, CopyInit(o)) |> Map(value)
```

# Examples
```jldoctest
julia> using Transducers
       using OnlineStats: Mean

julia> collect(Transducer(Mean()), 1:4)
4-element Array{Float64,1}:
 1.0
 1.5
 2.0
 2.5
```
"""
Transducer(o::OnlineStatsBase.OnlineStat) =
    Scan(OnlineStatsBase.fit!, CopyInit(o)) |> Map(OnlineStatsBase.value)
# TODO: implement `combine`

"""
    reducingfunction([xf::Transducer,] o::OnlineStat; simd)

Convert an `OnlineStat` to a reducing function.  Returned function can
be used with [`foldl`](@ref), [`reduce`](@ref), and [`dreduce`](@ref).
Note that input `o` is only used as a "prototype"; i.e., it's not
going to be mutated.

# Examples
```jldoctest
julia> using Transducers
       using OnlineStats: Mean

julia> foldl(reducingfunction(Mean()), Map(x -> x^2), 1:4)
Mean: n=4 | value=7.5

julia> foldl(Mean(), Map(x -> x^2), 1:4)  # equivalent to above
Mean: n=4 | value=7.5

julia> reduce(Mean(), Map(x -> x^2), 1:4)  # threaded
Mean: n=4 | value=7.5

julia> foldl(Mean(), eduction(x^2 for x in 1:4))  # ditto
Mean: n=4 | value=7.5

julia> reduce(Mean(), eduction(x^2 for x in 1:4))  # ditto
Mean: n=4 | value=7.5
```

[`dreduce`](@ref) can be used instead of `reduce`.  However the usual caveats
of code availability for Distributed.jl apply.
"""
reducingfunction(xf::Transducer, stat::OnlineStatsBase.OnlineStat; kwargs...) =
    reducingfunction(xf, reducingfunction(stat); kwargs...)
reducingfunction(stat::OnlineStatsBase.OnlineStat) = OnlineStatReducingFunction(stat)

@inline _reducingfunction(xf, stat::OnlineStatsBase.OnlineStat; kwargs...) =
    _reducingfunction(xf, reducingfunction(stat); kwargs...)

struct OnlineStatReducingFunction{T<:OnlineStatsBase.OnlineStat} <: Function
    init::T
end

InitialValues.hasinitialvalue(::Type{<:OnlineStatReducingFunction}) = true

# `GenericInitialValue{T}` for case when `init=Init(op::OnlineStat)`
# is explicitly passed.
const OSInit{T} =
    Union{GenericInitialValue{T},GenericInitialValue{OnlineStatReducingFunction{T}}}

(rf::OnlineStatReducingFunction{T})(::OSInit{T}, x) where {T<:OnlineStatsBase.OnlineStat} =
    rf(copy(rf.init), x)

function (::OnlineStatReducingFunction)(acc, x)
    OnlineStatsBase.fit!(acc, x)
    return acc
end

combine(::OnlineStatReducingFunction{T}, a::T, b::T) where {T<:OnlineStatsBase.OnlineStat} =
    merge!(a, b)

combine(
    ::OnlineStatReducingFunction{T},
    a::Union{T,OSInit{T}},
    ::OSInit{T},
) where {T<:OnlineStatsBase.OnlineStat} = a

combine(
    ::OnlineStatReducingFunction{T},
    ::OSInit{T},
    b::T,
) where {T<:OnlineStatsBase.OnlineStat} = b

const OSNonZeroNObsError = ArgumentError(
    "An `OnlineStat` with one or more observations cannot be used with " *
    "`reduce` and `dreduce`.",
)

function validate_reduce_ostat(stat)
    if OnlineStatsBase.nobs(stat) != 0
        throw(OSNonZeroNObsError)
    end
    return stat
end

# Method plumbing:
Base.foldl(stat::OnlineStatsBase.OnlineStat, xform::Transducer, itr; kwargs...) =
    foldl(reducingfunction(stat), xform, itr; kwargs...)

Base.foldl(stat::OnlineStatsBase.OnlineStat, foldable::Foldable; kwargs...) =
    foldl(reducingfunction(stat), extract_transducer(foldable)...; kwargs...)

Base.reduce(stat::OnlineStatsBase.OnlineStat, xform::Transducer, itr; kwargs...) =
    reduce(reducingfunction(validate_reduce_ostat(stat)), xform, itr; kwargs...)

Base.reduce(stat::OnlineStatsBase.OnlineStat, foldable::Foldable; kwargs...) = reduce(
    reducingfunction(validate_reduce_ostat(stat)),
    extract_transducer(foldable)...;
    kwargs...,
)

dreduce(stat::OnlineStatsBase.OnlineStat, xform::Transducer, itr; kwargs...) =
    dreduce(reducingfunction(validate_reduce_ostat(stat)), xform, itr; kwargs...)

dreduce(stat::OnlineStatsBase.OnlineStat, foldable::Foldable; kwargs...) = dreduce(
    reducingfunction(validate_reduce_ostat(stat)),
    extract_transducer(foldable)...;
    kwargs...,
)
