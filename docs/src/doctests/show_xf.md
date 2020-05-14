# Show method for transducers

```@meta
DocTestSetup = quote
    using Transducers
    using Transducers: ZipSource
end
```

```jldoctest
julia> Map(sin) |> Map(cos) |> Map(tan)
Map(sin) |>
    Map(cos) |>
    Map(tan)

julia> ZipSource(Map(sin) |> ZipSource(Map(tan)))
ZipSource(
    Map(sin) |>
        ZipSource(Map(tan))
)

julia> ZipSource(Map(sin) |> ZipSource(Map(tan) |> Filter(isfinite)) |> MapSplat(*))
ZipSource(
    Map(sin) |>
        ZipSource(
            Map(tan) |>
                Filter(isfinite)
        ) |>
        MapSplat(*)
)

julia> ZipSource(Map(sin) |>
              ZipSource(Map(tan) |> Filter(isfinite)) |>
              MapSplat(*)) |> MapSplat(+)
ZipSource(
    Map(sin) |>
        ZipSource(
            Map(tan) |>
                Filter(isfinite)
        ) |>
        MapSplat(*)
) |>
    MapSplat(+)

julia> ZipSource(OfType(Float64)) |> MapSplat(+)
ZipSource(OfType(Float64)) |>
    MapSplat(+)
```

```@meta
DocTestSetup = nothing
```
