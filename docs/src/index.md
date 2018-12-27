# Transducers.jl

```@index
```

## Transducer contexts

```@docs
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
Public = true
Filter = t -> t isa Type && t <: Transducers.Transducer
```

## Miscellaneous

```@autodocs
Modules = [Transducers]
Public = true
Filter = t -> t isa Type && !(t <: Transducers.Transducer)
```
