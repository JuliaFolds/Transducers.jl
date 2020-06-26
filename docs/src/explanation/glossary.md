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

## Reducing step function

**Reducing function** or **Reducing step (function)**: A reducing
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

## Transducer

A transducer in Transducers.jl is a transformation `xf` that

* transforms an iterator with [`xf(itr)`](@ref eduction)
  (**iterator transformation**)
* transforms a reducing step function with [`xf'(rf)`](@ref adjoint)
  (**reducing function transformation**)

Common variable names for transducers are `xf` and `xform`.

### Transducer in the narrow sense (Clojure)

A transducer as originally
[introduced by Rich Hickey](https://clojure.org/reference/transducers)
is a transformation of reducing step function.  Thus, what is referred
to as a transducer ``\mathrm{xf}`` in Clojure and many other languages
is the reducing function transformation `xf'` in Transducer.jl.

Since a transducer in the narrow sense maps a reducing function to a
reducing function, it can be composed with simple function composition
``∘``.  When a composite transducer ``\mathrm{xf} = \mathrm{xf}_1
\circ \mathrm{xf}_2 \circ ... \circ \mathrm{xf}_n`` to a "bottom"
reducing function ``\mathrm{rf}_0``, it is processed from right to
left just like normal functions:

```math
\mathrm{rf} =
\mathrm{xf}_1(\mathrm{xf}_2(...(\mathrm{xf}_{n}(\mathrm{rf}_0))))
```

which is equivalent to the following forms in Transducers.jl

```julia
rf = xf₁'(xf₂'(...(xfₙ(rf₀))))
rf = (xf₁' ∘ xf₂' ∘ ... ∘ xfₙ')(rf₀)
rf = (xfₙ ∘ ... ∘  xf₁ ∘ xf₂)'(rf₀)
rf = (xf₁ ⨟ xf₂ ⨟ ... ⨟ xfₙ)(rf₀)
```

### Inner transducer

Given a composition `xf₁' ∘ xf₂'`, transducer `xf₂` is said to be the
_inner transducer_ of `xf₁' ∘ xf₂'`.  Likewise,
`xf₂'(rf₀)` is an _inner reducing function_ of `xf₁'(xf₂'(rf₀))`.

## Reducible collection

**Reducible collection** (or just **Reducible**): Any object that
can be passed to [`foldl`](@ref) and alike is reducible.  A
reducible collection knows how to apply reducing function to its
elements.  Iterators are automatically reducible as this is the
canonical fallback implementation.

## Transducible process

A function that can reduce reducible collections using transducers is
a transducible process.  Examples are [`foldl`](@ref) and
[`reduce`](@ref).  Find more in [Transducible processes](@ref).
