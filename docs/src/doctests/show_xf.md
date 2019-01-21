# Show method for transducers

```@meta
DocTestSetup = quote
    using Transducers
    using Transducers: TeeZip
end
```

```jldoctest
julia> Map(sin) |> Map(cos) |> Map(tan)
Map(sin) |>
    Map(cos) |>
    Map(tan)

julia> TeeZip(Map(sin) |> TeeZip(Map(tan)))
TeeZip(
    Map(sin) |>
        TeeZip(Map(tan))
)

julia> TeeZip(Map(sin) |> TeeZip(Map(tan) |> Filter(isfinite)) |> MapSplat(*))
TeeZip(
    Map(sin) |>
        TeeZip(
            Map(tan) |>
                Filter(isfinite)
        ) |>
        MapSplat(*)
)

julia> TeeZip(Map(sin) |>
              TeeZip(Map(tan) |> Filter(isfinite)) |>
              MapSplat(*)) |> MapSplat(+)
TeeZip(
    Map(sin) |>
        TeeZip(
            Map(tan) |>
                Filter(isfinite)
        ) |>
        MapSplat(*)
) |>
    MapSplat(+)

julia> TeeZip(OfType(Float64)) |> MapSplat(+)
TeeZip(OfType(Float64)) |>
    MapSplat(+)
```

```@meta
DocTestSetup = nothing
```
