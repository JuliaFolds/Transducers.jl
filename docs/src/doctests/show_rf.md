# Show method for reducing functions

```@meta
DocTestSetup = quote
    using Transducers
    using Transducers: Reduction, TeeZip
end
```

```jldoctest
Reduction(
    Filter(isfinite) |> Map(sin),
    +,
    Float64)

# output

Reduction{▶ Float64}(
    Filter(isfinite),
    Reduction{▶ Float64}(
        Map(sin),
        BottomRF{▶ Float64}(
            +)))
```

```jldoctest
rf = Reduction(Map(error), right, Int64)

# output

Reduction{▶ Int64}(
    Map(error),
    BottomRF{▶ Union{}}(
        Transducers.right))
```

```jldoctest
rf = Reduction(
    TeeZip(Filter(isodd) |> Map(identity) |> TeeZip(Map(identity))),
    right,
    Any)

# output

Splitter{▶ Any}(
    Reduction{▶ Any}(
        Filter(isodd),
        Reduction{▶ Any}(
            Map(identity),
            Splitter{▶ Any}(
                Reduction{▶ Any}(
                    Map(identity),
                    Joiner{▶ ⦃Any, Any⦄}(
                        Joiner{▶ ⦃Any, ⦃Any, Any⦄⦄}(
                            BottomRF{▶ ⦃Any, ⦃Any, Any⦄⦄}(
                                Transducers.right))))))))
```

```@meta
DocTestSetup = nothing
```
