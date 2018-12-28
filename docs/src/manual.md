# Transducers and Transducible processes

```@index
Pages = ["manual.md"]
Order = [:function, :type]
```

## Transducible processes

```@docs
mapfoldl
transduce
foldl
foreach
eduction
map!
copy!
append!
collect
Channel
```

## Transducers

```@autodocs
Modules = [Transducers]
Private = false
Filter = Transducers.is_transducer_type
```

## Miscellaneous

```@autodocs
Modules = [Transducers]
Private = false
Filter = t -> t isa Type && !(t <: Transducers.Transducer)
```
