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
