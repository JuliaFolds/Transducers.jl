# Summary method for transducers

```@meta
DocTestSetup = quote
    using Transducers
    using Transducers: GetIndex, ZipSource
    printsummary(x) = summary(stdout, x)
end
```

```jldoctest
julia> Cat() |> printsummary
Cat

julia> Count() |> printsummary
Count

julia> Count(2) |> printsummary
Count

julia> Count(3, 4) |> printsummary
Count

julia> GetIndex([0]) |> printsummary
GetIndex

julia> Iterated(sqrt, 0.1) |> printsummary
Iterated

julia> Map(sin) |> printsummary
Map

julia> Filter(isfinite) |> printsummary
Filter

julia> Scan(*) |> printsummary
Scan

julia> ZipSource(Filter(isfinite)) |> printsummary
ZipSource

julia> ZipSource(Filter(isfinite) |> Map(sin)) |> printsummary
ZipSource

julia> ZipSource(Filter(isfinite) |> Map(sin)) |> Map(sum) |> printsummary
ZipSource |> Map

julia> let xf = ZipSource(Filter(isfinite) |> Map(sin))
           xf |> Map(sum) |> xf |> printsummary
       end
ZipSource |> (1 transducers...) |> ZipSource

julia> let xf = Map(first) |> Map(last)
           xf = ZipSource(ZipSource(xf) |> Map(identity)) |> xf
           xf |> ZipSource(xf) |> xf |> printsummary
       end
ZipSource |> (5 transducers...) |> Map
```

```@meta
DocTestSetup = nothing
```
