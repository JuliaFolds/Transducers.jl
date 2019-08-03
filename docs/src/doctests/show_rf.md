# Show method for reducing functions

```@meta
DocTestSetup = quote
    using Transducers
    using Transducers: Reduction, TeeZip
end
```

```jldoctest
Reduction(Filter(isfinite) |> Map(sin), +)

# output

Reduction(
    Filter(isfinite),
    Reduction(
        Map(sin),
        BottomRF(
            +)))
```

```jldoctest
rf = Reduction(Map(error), right)

# output

Reduction(
    Map(error),
    BottomRF(
        Transducers.right))
```

```jldoctest
rf = Reduction(
    TeeZip(Filter(isodd) |> Map(identity) |> TeeZip(Map(identity))),
    right,
)

# output

Splitter(
    Reduction(
        Filter(isodd),
        Reduction(
            Map(identity),
            Splitter(
                Reduction(
                    Map(identity),
                    Joiner(
                        Joiner(
                            BottomRF(
                                Transducers.right))))))))
```

```@meta
DocTestSetup = nothing
```
