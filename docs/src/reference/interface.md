# Transducer interface

## Core interface for transducers

```@docs
Transducers.AbstractFilter
Transducers.R_
Transducers.inner
Transducers.xform
Transducers.start
Transducers.next
Transducers.@next
Transducers.complete
Transducers.combine
```

## Helpers for stateful transducers

```@docs
Transducers.wrap
Transducers.unwrap
Transducers.wrapping
```

## Interface for reducibles

```@docs
Transducers.__foldl__
Transducers.@return_if_reduced
```
