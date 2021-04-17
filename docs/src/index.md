# Transducers for Julia

```@meta
DocTestSetup = quote
    using Transducers
end
```

[Transducers](https://clojure.org/reference/transducers) are
transformations of "sequence" of input that can be composed very
efficiently.  The interface used by transducers naturally describes a
wide range of processes that is expressible as a succession of steps.
Furthermore, transducers can be defined without specifying the details
of the input and output (collections, streams, channels, etc.)  and
therefore achieves a full reusability.  Transducers are introduced by
Rich Hickey, the creator of the Clojure language.
[His Strange Loop talk](https://www.youtube.com/watch?v=6mTbuzafcII)
is a great introduction to the idea of transducers.

Transducers.jl is an implementation of the transducers in Julia.
Aiming to satisfy high-performance needs of Julia users,
Transducers.jl uses a formulation that is _pure_ [^pure] and aiding
type-stability.

## Features

* Sequential, multi-threaded, and distributed computation with a
  single API --- *transducers* (see
  [overview of parallel processing](@ref overview-parallel)).
* Support various table types including
  [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl),
  [StructArrays.jl](https://github.com/JuliaArrays/StructArrays.jl),
  [TypedTables.jl](https://github.com/JuliaData/TypedTables.jl), etc.
  using [Tables.jl](https://github.com/JuliaData/Tables.jl) and
  [BangBang.jl](https://github.com/JuliaFolds/BangBang.jl) API
  (see [`copy`](@ref), etc.).
* [OnlineStats.jl](https://github.com/joshday/OnlineStats.jl)
  integration.
* Robust
  [typocalypse](https://discourse.julialang.org/search?q=typocalypse)-free
  implementation of `map`, `collect`, and alike based on
  mutate-or-widen strategy implemented in
  [BangBang.jl](https://github.com/JuliaFolds/BangBang.jl).
* User interface-agnostic progress bar support based on
  [ProgressLogging.jl](https://github.com/JunoLab/ProgressLogging.jl)
  that works with threaded and distributed processing (see
  [`withprogress`](@ref)).

## Installation

```julia
using Pkg
Pkg.add("Transducers")
```

## Examples

If you are familiar with
[iterators](https://en.wikipedia.org/wiki/Iterator) (see also
[`Base.Iterators`](https://docs.julialang.org/en/v1/base/iterators/)
and [IterTools.jl](https://github.com/JuliaCollections/IterTools.jl))
it would look very familiar to you:

```jldoctest
julia> using Transducers

julia> 1:3 |> Map(x -> 2x) |> collect  # double each element
3-element Vector{Int64}:
 2
 4
 6

julia> 1:6 |> Filter(iseven) |> collect  # collect only evens
3-element Vector{Int64}:
 2
 4
 6

julia> 1:3 |> MapCat(x -> 1:x) |> collect  # concatenate mapped results
6-element Vector{Int64}:
 1
 1
 2
 1
 2
 3

```

Transducers can be composed:

```jldoctest filter-map
julia> 1:6 |> Filter(iseven) |> Map(x -> 2x) |> collect
3-element Vector{Int64}:
  4
  8
 12
```

An efficient way to use transducers is combination with
[`foldl`](@ref).  The computation is compiled down to an efficient
loop you would write by hand::

```jldoctest filter-map
julia> foldl(+, 1:6 |> Filter(iseven) |> Map(x -> 2x))
24
```

For more detailed discussions on the difference to iterators, see
[Comparison to iterators](@ref comparison-to-iterators).

## List of transducers

Here is the list of pre-defined transducers:

```@eval
import Markdown
import Transducers
Markdown.MD(Transducers.TransducerLister())
```

## Links

* ["Transducers" by Rich Hickey - YouTube](https://www.youtube.com/watch?v=6mTbuzafcII)
* [Rich Hickey - Inside Transducers - YouTube](https://www.youtube.com/watch?v=4KqUvG8HPYo)
* [CppCon 2015: Juan Pedro Bolívar Puente “Transducers: from Clojure to C++" - YouTube](https://www.youtube.com/watch?v=vohGJjGxtJQ)


---

[^pure]: ...although not pure in the strong sense as `Base.@pure`.
