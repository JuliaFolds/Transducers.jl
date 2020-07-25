"""
    foldxl(rf, [xf,] itr)
    foldxl(rf) -> itr -> foldxl(rf, itr)

e**X**tended **l**eft fold.  Like `foldl`, but always uses the
extended protocol defined in Transducers.jl.

$_experimental_warning

# Examples
```jldoctest
julia> using Transducers

julia> foldxl(+, 1:5 |> Filter(isodd))
9

julia> 1:5 |> Filter(isodd) |> foldxl(+)
9
```

Since [`TeeRF`](@ref) requires the extended fold protocol,
`foldl(TeeRF(min, max), [5, 2, 6, 8, 3])` does not work while it works
with `foldxl`:

```jldoctest; setup = :(using Transducers)
julia> foldxl(TeeRF(min, max), [5, 2, 6, 8, 3])
(2, 8)
```

The unary method of `foldlx` is useful when combined with `|>`:

```jldoctest; setup = :(using Transducers)
julia> (1:5, 4:-1:1) |> Cat() |> Filter(isodd) |> Enumerate() |> foldxl() do a, b
           a[2] < b[2] ? b : a
       end
(3, 5)
```
"""
foldxl
foldxl(rf; kw...) = itr -> foldxl(rf, itr; kw...)
foldxl(rf, itr; kw...) = foldl(rf, extract_transducer(itr)...; kw...)
foldxl(rf, xf, itr; kw...) = foldl(rf, xf, itr; kw...)

"""
    foldxt(rf, [xf,] itr)
    foldxt(rf) -> itr -> foldxt(rf, itr)

e**X**tended **t**hreaded fold (reduce).  This is a multi-threaded
`reduce` based on extended fold protocol defined in Transducers.jl.

$_experimental_warning

# Examples
```jldoctest
julia> using Transducers

julia> foldxt(+, 1:5 |> Filter(isodd))
9

julia> 1:5 |> Filter(isodd) |> foldxt(+)
9

julia> foldxt(TeeRF(min, max), [5, 2, 6, 8, 3])
(2, 8)
```
"""
foldxt
foldxt(rf; kw...) = itr -> foldxt(rf, itr; kw...)
foldxt(rf, itr; kw...) = reduce(rf, extract_transducer(itr)...; kw...)
foldxt(rf, xf, itr; kw...) = reduce(rf, xf, itr; kw...)

"""
    foldxd(rf, [xf,] itr)
    foldxd(rf) -> itr -> foldxd(rf, itr)

e**X**tended **d**istributed fold (reduce).  This is a distributed
`reduce` based on extended fold protocol defined in Transducers.jl.

$_experimental_warning

# Examples
```jldoctest
julia> using Transducers

julia> foldxd(+, 1:5 |> Filter(isodd))
9

julia> 1:5 |> Filter(isodd) |> foldxd(+)
9

julia> foldxd(TeeRF(min, max), [5, 2, 6, 8, 3])
(2, 8)
```
"""
foldxd
foldxd(rf; kw...) = itr -> foldxd(rf, itr; kw...)
foldxd(rf, itr; kw...) = dreduce(rf, extract_transducer(itr)...; kw...)
foldxd(rf, xf, itr; kw...) = dreduce(rf, xf, itr; kw...)
