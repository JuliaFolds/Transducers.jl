# # Useful patterns
#
# This page includes some useful patterns using Transducers.jl.

using Transducers

using Test                                                             #src

# ## Flattening nested objects using `MapCat`
#
# ### Simple `MapCat` usage
#
# Consider a vector of "objects" (here just `NamedTuple`s) which in
# turn contain a vector of objects:

#! format: off
nested_objects = [
    (a = 1,  b = [(c = 2,  d = 3),  (c = 4,  d = 5)]),
    (a = 10, b = [(c = 20, d = 30), (c = 40, d = 50)]),
];
#! format: on

# We can flatten this into a table by using `Map` inside `MapCat`:

using TypedTables
astable(xs) = copy(Table, xs)  # using `TypedTables` for a nice display

table1 = nested_objects |> MapCat() do x
    x.b |> Map() do b  # not `MapCat`
        (a = x.a, b...)
    end
end |> astable
@test table1 == Table(a = [1, 1, 10, 10], c = [2, 4, 20, 40], d = [3, 5, 30, 50])

# (Note that the transducer used inside `MapCat` is `Map`, not `MapCat`)

# ### Nested `MapCat`
#
# This pattern can handle more nested objects:

#! format: off
more_nested_objects = [
    (a = 1,  b = [(c = 2,  d = [(e = 3,  f = 4),  (e = 4,  f = 5)]),
                  (c = 6,  d = [])]),
    (a = 10, b = [(c = 20, d = [(e = 30, f = 40), (e = 40, f = 50)])]),
];
#! format: on

# By using nested `MapCat` (except for the "inner most" processing
# which uses `Map` since there is nothing to con**cat**enate):

table3 =
    more_nested_objects |> MapCat() do x
        x.b |> MapCat() do b
            b.d |> Map() do d
                (a = x.a, c = b.c, d...)
            end
        end
    end |> astable

# ### Comparison with iterator comprehension
#
# As a comparison, here is how to do it with iterator comprehension

#! format: off
rows = (
    (a = x.a, c = b.c, d...)
    for x in more_nested_objects
    for b in x.b
    for d in b.d
)
@assert Table(collect(rows)) == table3
#! format: on

# For a simple flattening and mapping, iterator comprehension as above
# perhaps is the simplest solution.
#
# Note that Transducers.jl works well with iterator comprehensions.
# Transducers.jl-specific entry points like [`foldxl`](@ref) converts
# iterator comprehensions to transducers internally.
# [`eduction`](@ref) can be used to explicitly do this conversion:

@assert astable(eduction(rows)) == table3

# ### Complex `MapCat` example
#
# For more complex processing that requires intermediate variables,
# the iterator comprehension does not work well.  Fortunately, it is
# easy to use intermediate variables with transducers:

ans = begin
    more_nested_objects |>
    MapCat() do x
        a2 = x.a * 2
        x.b |> MapCat() do b
            a2_plus_c = a2 + b.c
            b.d |> Map() do d
                c_plus_e = b.c + d.e
                c_plus_f = b.c + d.f
                (a2_plus_c = a2_plus_c, c_plus_e = c_plus_e, c_plus_f = c_plus_f)
            end
        end
    end |>
    astable
end

@testset begin
    @test ans == Table(
        a2_plus_c = [4, 4, 40, 40],
        c_plus_e = [5, 6, 50, 60],
        c_plus_f = [6, 7, 60, 70],
    )
end

# ### `MapCat` with `zip`
#
# Note also that `MapCat` can be combined with arbitrary iterator
# combinators such as `zip`

ans = begin
    [(a = 1:3, b = 'x':'z'), (a = 1:4, b = 'i':'l')] |>
    MapCat() do x
        zip(x.a, x.b)
    end |>
    MapSplat((a, b) -> (a = a, b = b)) |>
    astable
end

@testset begin
    @test ans == Table(a = [1, 2, 3, 1, 2, 3, 4], b = ['x', 'y', 'z', 'i', 'j', 'k', 'l'])
end

# ### `MapCat` with `Iterators.product`
#
# ... and `product`

ans = begin
    [(a = 1:3, b = 'x':'z'), (a = 1:4, b = 'i':'l')] |>
    MapCat() do x
        Iterators.product(x.a, x.b)
    end |>
    Enumerate() |>
    Filter(x -> x[1] % 5 == 0) |>  # include only every five item
    MapSplat((n, (a, b)) -> (n = n, a = a, b = b)) |>
    astable
end

@testset begin
    @test ans ==
          Table(n = [5, 10, 15, 20, 25], a = [2, 1, 2, 3, 4], b = ['y', 'i', 'j', 'k', 'l'])
end

# ## "Missing value" handling with `KeepSomething`

# Transducers.jl has a generic filtering such as [`Filter`](@ref) as
# well as type-based filtering such as [`NotA`](@ref) and
# [`OfType`](@ref).  These transducers can be used to filter out
# "missing values" represented as `missing` or `nothing`.
#
# [`KeepSomething`](@ref) is a transducer that is useful for working
# on `Union{Nothing,Some{T}}`.  It filters out `nothing` and yield
# itmes after applying `something`.

@test begin
    [nothing, 1, Some(nothing), 2, 3] |> KeepSomething(identity) |> collect
end == [1, nothing, 2, 3]

# Thus, `KeepSomething` works well with any tools that operate on
# `Union{Nothing,Some{T}}`.  Here is an example of using it with
# [Maybe.jl](https://github.com/tkf/Maybe.jl).  Consider a vector of
# heterogeneous dictionaries with varying set of keys:

heterogeneous_objects = [
    Dict(:a => 1, :b => Dict(:c => 2)),
    Dict(:a => 1),                          # missing key
    Dict(:a => 1, :b => Dict()),            # missing key
    Dict(:b => Dict(:c => 2)),              # missing key
    Dict(:a => 10, :b => Dict(:ccc => 20)), # alternative key name
];

# Using `@something` and `@?` macros from Maybe.jl, we can convert
# this to a regular table quite easily:

using Maybe

ans = begin
    heterogeneous_objects |>
    KeepSomething() do x
        c = @something {       # (1)
            @? x[:b][:c];      # (2)
            @? x[:b][:ccc];    # (3)
            return;            # (4)
        }
        @? (a = x[:a], c = c)  # (5)
    end |>
    astable
end

@testset begin
    @test ans == Table(a = [1, 10], c = [2, 20])
end

# In this example, for each dictionary `x`, the body of the `do` block
# works as follows:
#
# * (1) Try to extract the item `c`.
#   * (2) First, try to get it from `x[:b][:c]`.
#   * (3) If `x[:b][:c]` doesn't exist, try `x[:b][:ccc]` next.
#   * (4) If both `x[:b][:c]` and `x[:b][:ccc]` do not exist, return
#     `nothing`.  `KeepSomething` will filter out this entry.
# * (5) Try to extract the item `a` from `x[:a]`.
#   * If this does not exist, the whole expression wrapped by `@?`
#     evaluates to `nothing`.  This, in turn, will be filtered out by
#     `KeepSomething`.
#   * If `x[:a]` exists, `@? (a = x[:a], c = c)` evaluates to `Some((a
#     = value_of_a, c = value_of_c))`.  The `Some` wrapper is
#     unwrapped by `something` called by `KeepSomething`.
#
# For more information, see the tutorial in [Maybe.jl
# documentation](https://tkf.github.io/Maybe.jl/dev/).

# ## Multiple outputs

# Usually, reducers like `sum` and `collect` have one output.  However
# we can use [`TeeRF`](@ref) etc. to "fan-out" input items to multiple
# outputs.
#
# ### Multiple output vectors
#
# Here is an example of creating two output vectors of integers and
# symbols in one go:

ints, symbols =
    [1, :two, missing, 3, 4, :five, 6] |>
    Filter(!isequal(6)) |>
    foldxl(TeeRF(
        OfType(Int)'(push!!),    # push integers to a vector
        OfType(Symbol)'(push!!), # push symbols to a vector
    ))

@testset begin
    @test ints == [1, 3, 4]
    @test symbols == [:two, :five]
end

# Here, we use `TeeRF(rf₁, rf₂, ..., rfₙ)` to fan-out input items to
# multiple reducing functions.  To compose each reducing function, we
# use [`OfType`](@ref) transducer as reducing function transformation
# [`xf'(rf)`](@ref adjoint).
#
# ### Handling empty results
#
# Note that fold with `push!!` throws when the input is empty.  To
# obtain an empty vector when the input is empty or all filtered out,
# we need to specify `init`.
# [MicroCollections.jl](https://github.com/JuliaFolds/MicroCollections.jl)
# includes a library of collections useful as `init`.  Here, we can
# use `EmptyVector`:

using MicroCollections

ints, strings =
    [1, :two, missing, 3, 4, :five, 6] |>
    Filter(!isequal(6)) |>
    foldxl(TeeRF(
        OfType(Int)'(push!!),    # push integers to a vector
        OfType(String)'(push!!), # push strings to a vector (but there is no string)
    ); init = EmptyVector())

@testset begin
    @test ints == [1, 3, 4]
    @test strings == []
end

# ### Composed transducers with `TeeRF`
#
# Each reducing function passed to `TeeRF` can use arbitrary complex
# transducers.  Here is an example of filtering-in symbols and then
# map them to strings:

ints, strings =
    [1, :two, missing, 3, 4, :five, 6] |>
    Filter(!isequal(6)) |>
    foldxl(
        TeeRF(
            OfType(Int)'(push!!),
            opcompose(OfType(Symbol), Map(String))'(push!!),  # filter _then_ map
        );
        init = EmptyVector(),
    )

@testset begin
    @test ints == [1, 3, 4]
    @test strings == ["two", "five"]
end

# ### Nested `TeeRF`
#
# Each reducing function itself passed to `TeeRF` can even be composed
# using `TeeRF` (or other reducing function combinators; e.g.,
# [`ProductRF`](@ref)).  Here is an example of computing extrema on
# integers:

(imin, imax), strings =
    [1, :two, missing, 3, 4, :five, 6] |>
    Filter(!isequal(6)) |>
    foldxl(
        TeeRF(
            OfType(Int)'(TeeRF(max, min)),  # extrema on integers
            opcompose(OfType(Symbol), Map(String))'(push!!),  # filter _then_ map
        );
        init = ((typemin(Int), typemax(Int)), EmptyVector()),
    )

@testset begin
    @test imin == 4
    @test imax == 1
    @test strings == ["two", "five"]
end

# ### When input is a tuple: `ProductRF`
#
# [`ProductRF`](@ref) is like `TeeRF` but it expects that the input is
# already a tuple:

ints, io =
    [(1:3, 'x':'z'), nothing, (1:4, 'i':'l')] |>
    NotA(Nothing) |>
    foldxl(
        ProductRF(
            opcompose(Cat(), Filter(isodd))'(push!!),    # process 1:3 etc.
            Cat()'((io, char) -> (write(io, char); io)), # process 'x':'z' etc.
        );
        init = (EmptyVector(), IOBuffer()),
    );
#-

@test begin
    String(take!(io))
end == "xyzijkl"
#-

@test begin
    ints
end == [1, 3, 1, 3]
#-

# ### When input is a row: `DataTools.oncol`
#
# [`oncol`](https://juliafolds.github.io/DataTools.jl/dev/#DataTools.oncol)
# from [DataTools.jl](https://github.com/JuliaFolds/DataTools.jl) is
# like `ProductRF` but acts on `NamedTuple` (as well as any
# [Setfield.jl](https://github.com/jw3126/Setfield.jl)-compatible
# possibly nested objects).

using DataTools
@test begin
    foldxl(oncol(a = +, b = *), [(a = 1, b = 2), (a = 3, b = 4)])
end == (a = 4, b = 8)
