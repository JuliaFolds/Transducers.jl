# Show method for transducers

```@meta
DocTestSetup = quote
    using Transducers
    using Transducers: ZipSource
end
```

```jldoctest
julia> opcompose(Map(sin), Map(cos), Map(tan))
Map(sin) ⨟
    Map(cos) ⨟
    Map(tan)

julia> ZipSource(opcompose(Map(sin), ZipSource(Map(tan))))
ZipSource(
    Map(sin) ⨟
        ZipSource(Map(tan))
)

julia> ZipSource(opcompose(Map(sin), ZipSource(opcompose(Map(tan), Filter(isfinite))), MapSplat(*)))
ZipSource(
    Map(sin) ⨟
        ZipSource(
            Map(tan) ⨟
                Filter(isfinite)
        ) ⨟
        MapSplat(*)
)

julia> opcompose(
           ZipSource(opcompose(
               Map(sin),
               ZipSource(opcompose(Map(tan), Filter(isfinite))),
               MapSplat(*),
           )),
           MapSplat(+),
       )
ZipSource(
    Map(sin) ⨟
        ZipSource(
            Map(tan) ⨟
                Filter(isfinite)
        ) ⨟
        MapSplat(*)
) ⨟
    MapSplat(+)

julia> opcompose(ZipSource(OfType(Float64)), MapSplat(+))
ZipSource(OfType(Float64)) ⨟
    MapSplat(+)
```

```@meta
DocTestSetup = nothing
```
