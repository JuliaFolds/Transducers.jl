# Transducers for Julia

!!! warning
    This is a work in progress!

```@meta
DocTestSetup = quote
    using Transducers
end
```

[Transducers](https://clojure.org/reference/transducers) are
composable transformations which can be implemented very efficiently
and useful in both compute- and I/O-bound contexts.  The interface
used by transducers can naturally describe a wide range of processes
that can be formalized as a succession of steps.  Furthermore,
transducers can be defined without specifying the details of the input
and output (collections, streams, channels, etc.) and therefore
achieves a full reusability.  Transducers are introduced by Rich
Hickey, the creator of the Clojure language.
[His Strange Look talk](https://www.youtube.com/watch?v=6mTbuzafcII)
is a great introduction to the idea of transducers.

Transducers.jl is an implementation of the transducer framework in
Julia.  Aiming to satisfy high-performance needs of Julia users,
Transducers.jl uses a formulation that is _pure_ [^pure] and aiding
type-stability.

[^pure]: ...although not pure in the strong sense as `Base.@pure`.

## Examples

If you are familiar with
[iterators](https://en.wikipedia.org/wiki/Iterator) (see also
[`Base.Iterators`](https://docs.julialang.org/en/v1/base/iterators/)
and [IterTools.jl](https://github.com/JuliaCollections/IterTools.jl))
it would look very familiar to you:

```jldoctest
julia> using Transducers

julia> collect(Map(x -> 2x), 1:3)  # double each element
3-element Array{Int64,1}:
 2
 4
 6

julia> collect(Filter(iseven), 1:6)  # collect only evens
3-element Array{Int64,1}:
 2
 4
 6

julia> collect(MapCat(x -> 1:x), 1:3)  # concatenate mapped results
6-element Array{Int64,1}:
 1
 1
 2
 1
 2
 3

```

Transducers can be composed (without, unlike iterators, referring to
the input):

```jldoctest filter-map
julia> xf = Filter(iseven) |> Map(x -> 2x)
       collect(xf, 1:6)
3-element Array{Int64,1}:
  4
  8
 12
```

An efficient way to use transducers is combination with
[`mapfoldl`](@ref).  This computation is done without creating any
intermediate lazy object and compiles to a single loop:

```jldoctest filter-map
julia> mapfoldl(xf, +, 0, 1:6)
24
```

`mapfoldl` (or `foldl`) illustrates the difference between iterators
and transducers.  Implementation of the same computation in iterator
would be:

```julia
f(x) = 2x
mapfoldl(f, +, 0, filter(iseven, input))
foldl(+, map(f, filter(iseven, input)))  # equivalent
         _____________________________
         composition at input
```

Compare it to:

```julia
mapfoldl(Filter(iseven) |> Map(f), +, 0, input)
         ________________________
         composition at computation
```


## Links

* ["Transducers" by Rich Hickey - YouTube](https://www.youtube.com/watch?v=6mTbuzafcII)
* [Rich Hickey - Inside Transducers - YouTube](https://www.youtube.com/watch?v=4KqUvG8HPYo)
* [CppCon 2015: Juan Pedro Bolívar Puente “Transducers: from Clojure to C++" - YouTube](https://www.youtube.com/watch?v=vohGJjGxtJQ)
