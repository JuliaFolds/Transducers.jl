# Transducers.jl

```@index
```

## Transducer contexts

```@docs
mapfoldl
transduce
loop
eduction
map!
copy!
append!
collect
```

## Transducers

```@autodocs
Modules = [Transducers]
Private = false
Filter = t -> t isa Type && t <: Transducers.Transducer
```

## Miscellaneous

```@autodocs
Modules = [Transducers]
Private = false
Filter = t -> t isa Type && !(t <: Transducers.Transducer)
```
