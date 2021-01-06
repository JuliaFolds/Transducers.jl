# Show method for executors

```@meta
DocTestSetup = quote
    using Transducers
end
```

```jldoctest
julia> SequentialEx()
SequentialEx()

julia> ThreadedEx()
ThreadedEx()

julia> DistributedEx()
DistributedEx()
```

```jldoctest
julia> SequentialEx(simd = true)
SequentialEx(simd = true)
```

```jldoctest
julia> ThreadedEx(simd = true, basesize = 1)
ThreadedEx(simd = true, basesize = 1)
```

```@meta
DocTestSetup = nothing
```
