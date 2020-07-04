# Show method for eduction

```@meta
DocTestSetup = quote
    using Transducers
end
```

```jldoctest
julia> 1:3 |> Map(sin) |> Map(cos) |> Map(tan)
3-element UnitRange{Int64} |>
    Map(sin) |>
    Map(cos) |>
    Map(tan)
```

```jldoctest
julia> 1:3 |> Filter(isodd) |> Map(inv)
3-element UnitRange{Int64} |>
    Filter(isodd) |>
    Map(inv)
```

```jldoctest
julia> 1:3 |> Map(sin) |> Map(cos) |> Map(tan) |> print
1:3 |> Map(sin) |> Map(cos) |> Map(tan)
```

```jldoctest
julia> 1:3 |> Filter(isodd) |> Map(inv) |> print
1:3 |> Filter(isodd) |> Map(inv)
```

## To be improved

`Filter(Fix2)` is not very specific:

```jldoctest
julia> -3:3 |> Filter(<(0)) |> Map(inv)
7-element UnitRange{Int64} |>
    Filter(Fix2) |>
    Map(inv)
```

```@meta
DocTestSetup = nothing
```
