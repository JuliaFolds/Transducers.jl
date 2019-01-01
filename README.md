# Transducers.jl: Efficient and type-stable transducers for Julia

[![Latest documentation][docs-latest-img]][docs-latest-url]
[![Travis Status][travis-img]][travis-url]
[![codecov.io][codecov-img]][codecov-url]
[![Coverage Status][coveralls-img]][coveralls-url]

Transducers.jl provides composable algorithms on sequence of inputs.
They are called _[transducers]_, first introduced in Clojure language
by Rich Hickey.

[transducers]: https://clojure.org/reference/transducers

Using transducers is quite straightforward, especially if you already
know similar concepts in iterator libraries:

```julia
using Transducers
xf = Partition(7) |> Filter(x -> prod(x) % 11 == 0) |> Cat() |> Scan(+)
mapfoldl(xf, +, 1:40)
```

However, the formalization of the transducers is quite different from
iterators and resulting in a better performance for complex
compositions.

See more in the [documentation](https://tkf.github.io/Transducers.jl/latest).

## Installation

```
]add https://github.com/tkf/Transducers.jl
```

[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://tkf.github.io/Transducers.jl/latest
[travis-img]: https://travis-ci.com/tkf/Transducers.jl.svg?branch=master
[travis-url]: https://travis-ci.com/tkf/Transducers.jl
[codecov-img]: http://codecov.io/github/tkf/Transducers.jl/coverage.svg?branch=master
[codecov-url]: http://codecov.io/github/tkf/Transducers.jl?branch=master
[coveralls-img]: https://coveralls.io/repos/tkf/Transducers.jl/badge.svg?branch=master&service=github
[coveralls-url]: https://coveralls.io/github/tkf/Transducers.jl?branch=master
