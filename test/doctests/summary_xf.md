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
::Cat

julia> Count() |> printsummary
::Count

julia> Count(2) |> printsummary
::Count

julia> Count(3, 4) |> printsummary
::Count

julia> GetIndex([0]) |> printsummary
::GetIndex

julia> Iterated(sqrt, 0.1) |> printsummary
::Iterated

julia> Map(sin) |> printsummary
::Map

julia> Filter(isfinite) |> printsummary
::Filter

julia> Scan(*) |> printsummary
::Scan

julia> ZipSource(Filter(isfinite)) |> printsummary
::ZipSource

julia> ZipSource(opcompose(Filter(isfinite), Map(sin))) |> printsummary
::ZipSource

julia> opcompose(ZipSource(opcompose(Filter(isfinite), Map(sin))), Map(sum)) |> printsummary
::ZipSource ⨟ ::Map

julia> let xf = ZipSource(opcompose(Filter(isfinite), Map(sin)))
           opcompose(xf, Map(sum), xf) |> printsummary
       end
::ZipSource ⨟ ::ZipSource ⨟ ::ZipSource

julia> let xf = opcompose(Map(first), Map(last))
           xf = opcompose(ZipSource(opcompose(ZipSource(xf), Map(identity))), xf)
           opcompose(xf, ZipSource(xf), xf) |> printsummary
       end
::ZipSource ⨟ (5 transducers...) ⨟ ::Map
```

```@meta
DocTestSetup = nothing
```
