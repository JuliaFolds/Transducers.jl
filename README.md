# Transducers.jl: Efficient transducers for Julia

[![Stable documentation][docs-stable-img]][docs-stable-url]
[![Latest documentation][docs-dev-img]][docs-dev-url]
[![Travis Status][travis-img]][travis-url]
[![codecov.io][codecov-img]][codecov-url]
[![Coverage Status][coveralls-img]][coveralls-url]
[![Aqua QA](https://img.shields.io/badge/Aqua.jl-%F0%9F%8C%A2-aqua.svg)](https://github.com/tkf/Aqua.jl)

Transducers.jl provides composable algorithms on "sequence" of inputs.
They are called _[transducers]_, first introduced in Clojure language
by Rich Hickey.

[transducers]: https://clojure.org/reference/transducers

Using transducers is quite straightforward, especially if you already
know similar concepts in iterator libraries:

```julia
using Transducers
xf = Partition(7) |> Filter(x -> prod(x) % 11 == 0) |> Cat() |> Scan(+)
foldl(+, xf, 1:40)
```

However, the protocol used for the transducers is quite different from
iterators and results in a better performance for complex
compositions.  Furthermore, some transducers support parallel
execution.  If a transducer is composed of such transducers, it can be
automatically re-used both in sequential (`foldl` etc.) and parallel
(`reduce` etc.) contexts.

See more in the [documentation](https://juliafolds.github.io/Transducers.jl/dev).

## Installation

```julia
using Pkg
Pkg.add("Transducers")
```

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://juliafolds.github.io/Transducers.jl/stable
[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://juliafolds.github.io/Transducers.jl/dev
[travis-img]: https://travis-ci.com/JuliaFolds/Transducers.jl.svg?branch=master
[travis-url]: https://travis-ci.com/JuliaFolds/Transducers.jl
[codecov-img]: http://codecov.io/github/JuliaFolds/Transducers.jl/coverage.svg?branch=master
[codecov-url]: http://codecov.io/github/JuliaFolds/Transducers.jl?branch=master
[coveralls-img]: https://coveralls.io/repos/JuliaFolds/Transducers.jl/badge.svg?branch=master&service=github
[coveralls-url]: https://coveralls.io/github/JuliaFolds/Transducers.jl?branch=master
