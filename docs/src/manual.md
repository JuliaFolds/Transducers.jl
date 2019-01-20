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
mapreduce
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

### Experimental

```@docs
Transducers.TeeZip
Transducers.GetIndex
Transducers.SetIndex
Transducers.Inject
```

## Early termination

```@docs
Reduced
reduced
unreduced
```

## Miscellaneous

```@docs
Completing
Initializer
right
setinput
```
