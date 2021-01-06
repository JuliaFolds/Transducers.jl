# Transducers and Transducible processes

```@index
Pages = ["manual.md"]
Order = [:function, :type]
```

## Transducible processes

```@docs
foldxl
transduce
foldl
foreach
foldxt
foldxd
dtransduce
eduction
map!
copy!
copy
tcopy
dcopy
append!
Transducers.append!!
collect
tcollect
dcollect
Channel
```

### Experimental transducible processes

```@docs
Transducers.channel_unordered
Transducers.append_unordered!
```

## Transducers

```@docs
Transducers.Transducer
Base.:∘
Base.adjoint
```

```@autodocs
Modules = [Transducers]
Private = false
Filter = Transducers.is_transducer_type
```

### Experimental transducers

```@docs
Transducers.ZipSource
Transducers.GetIndex
Transducers.SetIndex
Transducers.Inject
```

## [Other reducing function combinators](@id combinators)

```@docs
Transducers.TeeRF
Transducers.ProductRF
Transducers.wheninit
Transducers.whenstart
Transducers.whencomplete
Transducers.whencombine
```

## Early termination

```@docs
Reduced
reduced
unreduced
ifunreduced
```

## Executors

```@docs
SequentialEx
ThreadedEx
DistributedEx
```

## Miscellaneous

```@docs
Transducer(::Transducers.Comprehension)
Transducer(::OnlineStats.OnlineStat)
reducingfunction
Completing
Init
OnInit
CopyInit
right
setinput
AdHocFoldable
withprogress
```

## Deprecated

```@docs
reduce
dreduce
mapfoldl
mapreduce
Keep
```
