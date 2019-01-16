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
@set! rf.xforms[3].xform.value = 1.25

# output

Reduction{▶ Float64}(
    Splitter((@lens _.xforms[2].xform.value)),
    Reduction{▶ Float64}(
        Count(1, 1),
        Reduction{▶ Int64}(
            Joiner(1.25),
            Transducers.right)))
```

```jldoctest
rf = Reduction(
    Filter(isfinite) |> TeeZip(Count()) |> Enumerate() |> MapSplat(*),
    right,
    Float64)
@set! rf.xforms[4].xform.value = 1.25

# output

Reduction{▶ Float64}(
    Filter(isfinite),
    Reduction{▶ Float64}(
        Splitter((@lens _.xforms[2].xform.value)),
        Reduction{▶ Float64}(
            Count(1, 1),
            Reduction{▶ Int64}(
                Joiner(1.25),
                Reduction{▶ ⦃Float64, Int64⦄}(
                    Enumerate(1, 1),
                    Reduction{▶ ⦃Int64, ⦃Float64, Int64⦄⦄}(
                        MapSplat(*),
                        Transducers.right))))))
```

```jldoctest
rf = Reduction(
    TeeZip(Count() |> TeeZip(FlagFirst())),
    right,
    Float64)
@set! rf.xforms[5].xform.value = 123456789
@set! rf.xforms[6].xform.value = 1.25

# output

Reduction{▶ Float64}(
    Splitter((@lens _.xforms[5].xform.value)),
    Reduction{▶ Float64}(
        Count(1, 1),
        Reduction{▶ Int64}(
            Splitter((@lens _.xforms[2].xform.value)),
            Reduction{▶ Int64}(
                FlagFirst(),
                Reduction{▶ ⦃Bool, Int64⦄}(
                    Joiner(123456789),
                    Reduction{▶ ⦃Int64, ⦃Bool, Int64⦄⦄}(
                        Joiner(1.25),
                        Transducers.right))))))
```

```jldoctest
rf = Reduction(
    TeeZip(Filter(isodd) |> Map(identity) |> TeeZip(Map(identity))),
    right,
    Int64)
@set! rf.xforms[6].xform.value = 123456789
@set! rf.xforms[7].xform.value = 123456789

# output

Reduction{▶ Int64}(
    Splitter((@lens _.xforms[6].xform.value)),
    Reduction{▶ Int64}(
        Filter(isodd),
        Reduction{▶ Int64}(
            Map(identity),
            Reduction{▶ Int64}(
                Splitter((@lens _.xforms[2].xform.value)),
                Reduction{▶ Int64}(
                    Map(identity),
                    Reduction{▶ Int64}(
                        Joiner(123456789),
                        Reduction{▶ ⦃Int64, Int64⦄}(
                            Joiner(123456789),
                            Transducers.right)))))))
```

```jldoctest
rf = Reduction(
    TeeZip(Filter(isodd) |> Map(identity) |> TeeZip(Map(identity))),
    right,
    Any)

# output

Reduction{▶ Any}(
    Splitter((@lens _.xforms[6].xform.value)),
    Reduction{▶ Any}(
        Filter(isodd),
        Reduction{▶ Any}(
            Map(identity),
            Reduction{▶ Any}(
                Splitter((@lens _.xforms[2].xform.value)),
                Reduction{▶ Any}(
                    Map(identity),
                    Reduction{▶ Any}(
                        Joiner(nothing),
                        Reduction{▶ ⦃Any, Any⦄}(
                            Joiner(nothing),
                            Transducers.right)))))))
```

```@meta
DocTestSetup = nothing
```
