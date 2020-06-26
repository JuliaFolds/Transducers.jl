# Glossary

```julia
foldl(step, xf, input, init=...)
#  |   |    |     |
#  |   |    |     `-- reducible
#  |   |    |
#  |   |    `-- transducer
#  |   |
#  |   `-- "bottom" (inner most) reducing function
#  |
#  `-- transducible process
```

* **Reducing function** or **Reducing step (function)**: A reducing
  function combines result-so-far with the input.  It in a narrow
  sense is a "callable" `op` of the signature `op(::X, ::Y) :: X` (or
  `op(::X, ::X) :: X` in case for [`reduce`](@ref)) or
  schematically:

  ```math
  (\text{result-so-far}, \text{input}) \mapsto \text{result-so-far}
  ```

  It is the function that can be passed to the classic
  (non-Transducers.jl) `Base.foldl` or `Base.reduce`.  It is sometimes
  referred to as a `step` or `op`.  In Transducers.jl,
  [`next(rf, ::X, ::Y) :: X`](@ref Transducers.next) is used instead
  of a "bare" callable.  Furthermore, a reducing function in a loose
  sense also includes other interfaces such as [`start(rf, ::X)`](@ref
  Transducers.start) and [`complete(rf, ::X)`](@ref
  Transducers.complete).

* **Transducer**: A transducer transforms a reducing function into a
  new reducing function.  It is sometimes referred to as a `xf` or
  `xform`.  A transducer can be composed of many sub-transducers; the
  syntax in Transducers.jl is `xf = xf₁ |> xf₂ |> ... |> xfₙ`.  The
  composed transducers are applied to the "bottom" reducing function
  from right to left, i.e., schematically, a new reducing function
  ``\mathrm{rf}`` is obtained from the "bottom" reducing function
  ``\mathrm{step}`` by

  ```math
  \mathrm{rf} =
  \mathrm{xf}_1(\mathrm{xf}_2(...(\mathrm{xf}_{n}(\mathrm{step}))))
  ```

  Given a composition `xf₁ |> xf₂`, transducer `xf₂` is said to be the
  _inner transducer_ of `xf₁ |> xf₂`.  Likewise,
  ``\mathrm{xf}_2(\mathrm{rf}')`` is an _inner reducing function_ of
  ``\mathrm{xf}_1(\mathrm{xf}_2(\mathrm{rf}'))``.

* **Reducible collection** (or just **Reducible**): Any object that
  can be passed to [`foldl`](@ref) and alike is reducible.  A
  reducible collection knows how to apply reducing function to its
  elements.  Iterators are automatically reducible as this is the
  canonical fallback implementation.

* **Transducible process**: A function that can reduce reducible
  collections using transducers is a transducible process.  Examples
  are [`foldl`](@ref) and [`reduce`](@ref).  Find more in
  [Transducible processes](@ref).
