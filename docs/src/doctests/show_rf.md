# Show method for reducing functions

```@meta
DocTestSetup = quote
    using Transducers
    using Transducers: Reduction, TeeZip
    using Setfield: @set!
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
        +))
```

```jldoctest
rf = Reduction(
    TeeZip(Count()),
    right,
    Float64)
@set! rf.inner.inner.value = 1.25

# output

Splitter{▶ Float64}(
    Reduction{▶ Float64}(
        Count(1, 1),
        Joiner{▶ ⦃Float64, Int64⦄}(
            Transducers.right,
            1.25)),
    (@lens _.inner.value))
```

```jldoctest
rf = Reduction(
    Filter(isfinite) |> TeeZip(Count()) |> Enumerate() |> MapSplat(*),
    right,
    Float64)
@set! rf.inner.inner.inner.value = 1.25

# output

Reduction{▶ Float64}(
    Filter(isfinite),
    Splitter{▶ Float64}(
        Reduction{▶ Float64}(
            Count(1, 1),
            Joiner{▶ ⦃Float64, Int64⦄}(
                Reduction{▶ ⦃Float64, Int64⦄}(
                    Enumerate(1, 1),
                    Reduction{▶ ⦃Int64, ⦃Float64, Int64⦄⦄}(
                        MapSplat(*),
                        Transducers.right)),
                1.25)),
        (@lens _.inner.value)))
```

```jldoctest
rf = Reduction(
    TeeZip(Count() |> TeeZip(FlagFirst())),
    right,
    Float64)
@set! rf.inner.inner.inner.inner.value = 123456789
@set! rf.inner.inner.inner.inner.inner.value = 1.25

# output

Splitter{▶ Float64}(
    Reduction{▶ Float64}(
        Count(1, 1),
        Splitter{▶ Int64}(
            Reduction{▶ Int64}(
                FlagFirst(),
                Joiner{▶ ⦃Int64, ⦃Bool, Int64⦄⦄}(
                    Joiner{▶ ⦃Float64, ⦃Int64, ⦃Bool, Int64⦄⦄⦄}(
                        Transducers.right,
                        1.25),
                    123456789)),
            (@lens _.inner.value))),
    (@lens _.inner.inner.inner.inner.value))
```

```@meta
DocTestSetup = nothing
```
