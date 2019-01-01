# Transducers.jl: Efficient and type-stable transducers for Julia

<!-- [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tkf.github.io/Transducers.jl/stable) -->

[![Latest](https://img.shields.io/badge/docs-latest-blue.svg)](https://tkf.github.io/Transducers.jl/latest)
[![Build Status](https://travis-ci.com/tkf/Transducers.jl.svg?branch=master)](https://travis-ci.com/tkf/Transducers.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/tkf/Transducers.jl?svg=true)](https://ci.appveyor.com/project/tkf/Transducers-jl)
[![Codecov](https://codecov.io/gh/tkf/Transducers.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/tkf/Transducers.jl)
[![Coveralls](https://coveralls.io/repos/github/tkf/Transducers.jl/badge.svg?branch=master)](https://coveralls.io/github/tkf/Transducers.jl?branch=master)

Transducers.jl provides composable algorithms on sequence of inputs.
They are called
[_transducers_](https://clojure.org/reference/transducers), first
introduced in Clojure language by Rich Hickey.

Using Transducers is quite straightforward, especially if you already
know similarly concepts in iterator libraries:

```julia
using Transducers
xf = Partition(7) |> Filter(x -> prod(x) % 11 == 0) |> Cat() |> TakeNth(5)
mapfoldl(xf, +, 1:100)
```

However, the formalization of the transducers is quite different from
iterators and yields a better performance for complex compositions.

See more in the [documentation](https://tkf.github.io/Transducers.jl/latest).

## Installation

```
]add https://github.com/tkf/Transducers.jl
```
