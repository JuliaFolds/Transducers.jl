# # Tutorial: missing value handling
#
# This tutorial illustrates the usage of Transducers.jl by stepping
# through various handling of missing values.

using Transducers
using LiterateTest                                                     #src
using Test                                                             #src

# ## Dot product
#
# Here is a simple way to compute a dot product using
# [`MapSplat`](@ref):

@test begin
    zip(1:3, 10:2:14) |> MapSplat(*) |> sum
end == 76

# Let's see what it does step by step.  First we create a "printer"
# transducer using the following function (see [`Map`](@ref)):

xf_printer(label) = Map() do x
    println(label, ": ", x)
    return x  # just return it as-is
end
nothing  # hide

# This transducer just pass-through the input while printing its value
# (prefixed by a `label`).  Let's sandwich the previous `MapSplat(*)`
# with it:

@test begin
    zip(1:3, 10:2:14) |>
    xf_printer(" input") |>
    MapSplat(*) |>
    xf_printer("output") |>
    sum
end == 76
flush(stdout)  # hide

# You can see that the input tuple `(1, 10)` is splatted into function
# `*` by `MapSplat` which then outputs `10`.  This is repeated for all
# inputs.

# Perhaps unfortunately, this way of computing a dot product
# propagates any missing values contained in the input arrays to the
# result (which may actually be desired in certain cases).

xs = [1, missing, 3, 2]
ys = [10, 14, missing, 12]
zip(xs, ys) |> MapSplat(*) |> sum

# However, it is very simple to ignore any missing values using
# [`OfType`](@ref):

@test begin
    zip(xs, ys) |> OfType(Tuple{Vararg{Number}}) |> MapSplat(*) |> sum
end == 34

# Here, `Tuple{Vararg{Number}}` is a type that matches with a tuple of
# any length with numbers.  It does not match with a tuple if it has a
# `missing`.

@assert (1, 0.5) isa Tuple{Vararg{Number}}
@assert (1, 0.5, 2im) isa Tuple{Vararg{Number}}
@assert !((1, missing) isa Tuple{Vararg{Number}})

# The part `... |> OfType(Tuple{Vararg{Number}}) |> MapSplat(*)` can
# be factored out using [`opcompose`](@ref ∘):

xf_mdot = opcompose(OfType(Tuple{Vararg{Number}}), MapSplat(*));

# or equivalently (in Julia ≥ 1.5):
#
# ```julia
# OfType(Tuple{Vararg{Number}}) ⨟ MapSplat(*)
# ```

# The transducer `xf_mdot` can be used where previously
# `OfType(Tuple{Vararg{Number}}) |> MapSplat(*)` was used:

@test begin
    zip(xs, ys) |> xf_mdot |> sum
end == 34

# ## Covariance
#
# Transducer `xf_mdot` above can also be used to compute the
# covariance.  First, we need the number of pairs of elements in `xs`
# and `ys` that _both_ of them are not `missing`:

nonmissings = zip(xs, ys) |> Map(x -> x isa Tuple{Vararg{Number}}) |> count
@test nonmissings == 2

# Finally, we have to pre-process the input to `xf_mdot` by
# subtracting the average.  It's easy to do this with `Map`:

using Statistics: mean

function xf_demean(xs, ys)
    xmean = mean(skipmissing(xs))
    ymean = mean(skipmissing(ys))
    return Map(((x, y),) -> (x - xmean, y - ymean))
end
nothing  # hide

# We can then compute the covariance by combining `xf_demean` and
# `xf_mdot`:

@test begin
    s = zip(xs, ys) |> xf_demean(xs, ys) |> xf_mdot |> sum
    s / nonmissings
end == 1.0

# In `xf_demean`, the averages of the vectors `xs` and `ys` are
# computed separately.  It is also easy to compute the averages of the
# elements where both `xs` and `ys` are non-`missing`:

function xf_demean2(xs, ys)
    n, xsum, ysum =
        zip(xs, ys) |>
        OfType(Tuple{Vararg{Number}}) |>
        Map(((x, y),) -> (1, x, y)) |>
        Broadcasting() |>
        sum
    xmean = xsum / n
    ymean = ysum / n
    return Map(((x, y),) -> (x - xmean, y - ymean))
end

if VERSION >= v"1.1"                                                   #src
    @test begin
        s = zip(xs, ys) |> xf_demean2(xs, ys) |> xf_mdot |> sum
        s / nonmissings
    end == 0.5
end                                                                    #src

# In `xf_demean2`, we used [`Broadcasting`](@ref) transducer to
# broadcast elements of the tuple `(1, x, y)` over the reducing
# function of `sum` (i.e., `+`).

# ### Advanced: `TeeRF` and `ProductRF`
#
# Alternatively, it can also be computed using by combining
# [`foldxl`](@ref), [`ProductRF`](@ref), [`TeeRF`](@ref), and
# [`DataTools.inc1`](https://juliafolds.github.io/DataTools.jl/dev/)
# (see [below](@ref tutorial-findminmax) for how `TeeRF` and
# `ProductRF` work):

using DataTools: inc1

function xf_demean3(xs, ys)
    n, (xsum, ysum) =
        zip(xs, ys) |>
        OfType(Tuple{Vararg{Number}}) |>
        foldxl(TeeRF(inc1, ProductRF(+, +)))
    xmean = xsum / n
    ymean = ysum / n
    return Map(((x, y),) -> (x - xmean, y - ymean))
end

@test begin
    s = zip(xs, ys) |> xf_demean3(xs, ys) |> xf_mdot |> sum
    s / nonmissings
end == 0.5

# ## Vectorized reduction
#
# `reduce`, `sum`, etc. in `Base` support `dims` argument.
# Transducers.jl does not support this argument as of writing.
# However, this can easily be emulated using `eachcol`, `eachrow`, or
# `eachslice` iterators in `Base`.

xs = [
    0       missing 1       2
    3       4       5       missing
    missing 6       7       missing
]

if VERSION < v"1.1"
    using Compat: eachcol
end
@test begin
    eachcol(xs) |> Broadcasting() |> NotA(Missing) |> sum
end == [3, 12, 13]

# Here, we use [`NotA`](@ref) transducer that filters out `missing`
# values:

@test begin
    [1, 2, missing, 3] |> NotA(Missing) |> collect
end == [1, 2, 3]

# Above computation returns the sum over each row without taking into
# account the relationship within a column.  Another possibly useful
# reduction is the sum of the columns with no missing values.  This
# can easily be done by filtering before:

@test begin
    eachcol(xs) |> Filter(x -> !any(ismissing, x)) |> Broadcasting() |> sum
end == [1, 5, 7]

# ## `findmax` and `findmin`
#
# Another useful operation is `findmax`/`findmin`.  Using `Filter`,
# `missing` values can be filtered out by

filtered_pairs = [1, 3, missing, 0] |> pairs |> Filter(!(ismissing ∘ last))
@test begin
    collect(filtered_pairs)
end == [1 => 1, 2 => 3, 4 => 0]

# These key-value pairs can be accumulated by the following reducing
# step function:

##                     ,--- current state
##                     |
##                     |              ,-- input
##                     |              |
function findmax_step((argmax, max), (index, value))
    argmax, max = value > max ? (index, value) : (argmax, max)
    return argmax => max
    ##        \
    ##         \__ next state
end

@test begin
    foldxl(findmax_step, filtered_pairs)
end == (2 => 3)

# or equivalently

@test begin
    [1, 3, missing, 0] |> pairs |> Filter(!(ismissing ∘ last)) |> foldxl(findmax_step)
end == (2 => 3)

# [`foldxl`](@ref) is like [`foldl`](@refe) but always uses
# Transducers.jl's extended fold protocol.  It also has the unary
# curried method `foldxl(rf)` defined as `xs -> foldxl(rf, xs)`.  It
# is handy to use in the piping context as in the latter example.

# [`DataTools.rightif`](https://juliafolds.github.io/DataTools.jl/dev/)
# can be used for defining `findmax`/`findmin`-like functions on the
# fly:

using DataTools: rightif

@test begin
    foldxl(rightif(<, last), filtered_pairs)
end === Pair{Int64,Union{Missing, Int}}(2, 3)

# ### Side note: why `Pair{Int64,Union{Missing,Int}}`?
#
# The result type just above using `rightif` is
# `Pair{Int64,Union{Missing,Int}}`:

@test begin
    typeof(foldxl(rightif(<, last), filtered_pairs))
end === Pair{Int64,Union{Missing,Int}}

# This is because that's the element type of `pairs([1, 3, missing,
# 0])` and `rightif` does not re-construct the input `Pair` like
# `findmax_step`:

@test begin
    [1, 3, missing, 0] |> pairs |> first |> typeof
end === Pair{Int64,Union{Missing, Int}}

# We can avoid this by pre-processing the input with `MapSplat(Pair)`:

@test begin
    foldxl(rightif(<, last), filtered_pairs |> MapSplat(Pair))
end === (2 => 3)

# ### `findmin`

# Similarly, we can define `findmin` with

function findmin_step((argmin, min), (index, value))
    argmin, min = value < min ? (index, value) : (argmin, min)
    return argmin => min
end

@test begin
    foldxl(findmin_step, filtered_pairs)
end == (4 => 0)

# and

@test begin
    foldxl(rightif(>, last), filtered_pairs)
end == (4 => 0)

# ## [Extrema (`findminmax`)](@id tutorial-findminmax)
#
# To compute `findmax` and `findmax` in a single sweep, we can use
# [`TeeRF`](@ref) to "fan out" the input stream to multiple reducing
# step functions:

@test begin
    foldxl(TeeRF(findmin_step, findmax_step), filtered_pairs)
end == (4 => 0, 2 => 3)

# or equivalently

@test begin
    foldxl(TeeRF(rightif(>, last), rightif(<, last)), filtered_pairs)
end == (4 => 0, 2 => 3)

# In general, multiple folds on a same collection
#
# ```julia
# a₁ = foldxl(rf₁, xs)
# a₂ = foldxl(rf₂, xs)
# ...
# aₙ = foldxl(rfₙ, xs)
# ```
#
# can be fused into a single fold using `TeeRF`
#
# ```julia
# a₁, a₂, ..., aₙ = foldxl(TeeRF(rf₁, rf₂, ..., rfₙ), xs)
# ```
#
# provided that the input collection `xs` and the reducing functions
# `rf₁`, `rf₂`, ..., and `rfₙ` are not stateful.

# ### More fusing by transforming reducing functions

# In the above computation, we have a [reducing (step) function](@ref
# glossary-rf)

rf = TeeRF(rightif(>, last), rightif(<, last));

# a [transducer](@ref glossary-transducer)

xf = Filter(!(ismissing ∘ last));

# and an iterable

xs = pairs([1, 3, missing, 0]);

# In Transducers.jl, a transducer acts as iterator transformation
# `xf(xs)` as well as reducing function transformation `xf'(rf)`.
# Thus, the following calls are equivalent:

#src `xf(xs)` impossible before https://github.com/JuliaLang/julia/pull/31916
@dedent if VERSION >= v"1.3"
    @assert foldxl(rf, xf, xs) == (4 => 0, 2 => 3)
    @assert foldxl(rf, xf(xs)) == (4 => 0, 2 => 3)
    @assert foldxl(xf'(rf), xs) == (4 => 0, 2 => 3)
end

# By exploiting this equality, we can fuse more computations by moving
# the transformation on the side of reducing function.  For example,
# we can compute non-missing extrema and count missings at the same
# time:

@test begin
    [1, 3, missing, 0] |>
    pairs |>
    MapSplat(Pair) |>  # avoid `Pair{Int64,Union{Missing, Int}}`
    foldxl(TeeRF(
        Map(ismissing ∘ last)'(+),  # count number of missings
        Filter(!(ismissing ∘ last))'(TeeRF(
            rightif(>, last),  # find non-missing minimum
            rightif(<, last),  # find non-missing maximum
        )),
    ))
end == (1, (4 => 0, 2 => 3))

# Using `ProductRF`, we can compute `findmax` of individual and
# `zip`ped items at the same time

@test begin
    zip(
        pairs([1, 3, missing, 0]),  # produces k1 => v1
        pairs([4, missing, 6, 5]),  # produces k2 => v2
    ) |>
    Map() do ((k1, v1), (k2, v2))
        (k1 => v1, k2 => v2, (k1, k2) => (v1, v2))
    end |>
    foldxl(ProductRF(
        Filter(!(ismissing ∘ last))'(rightif(<, last)),  # max of k1 => v1
        Filter(!(ismissing ∘ last))'(rightif(<, last)),  # max of k2 => v2
        Filter(((_, (v1, v2)),) -> v1 !== missing && v2 !== missing)'(
            rightif(<, last)  # max (k1, k2) => (v1, v2)
        ),
    ))
end == (2 => 3, 3 => 6, (1, 1) => (1, 4))

# `ProductRF` is like `TeeRF` but acts on the input that is already a
# tuple.  That is to say, given a collection of `n`-tuple `xs`,
# multiple folds on a same collection
#
# ```julia
# a₁ = foldxl(rf₁, (x[1] for x in xs))
# a₂ = foldxl(rf₂, (x[2] for x in xs))
# ...
# aₙ = foldxl(rfₙ, (x[n] for x in xs))
# ```
#
# can be fused into a single fold using `ProductRF`
#
# ```julia
# a₁, a₂, ..., aₙ = foldxl(ProductRF(rf₁, rf₂, ..., rfₙ), xs)
# ```
#
# provided that the input collection `xs` and the reducing functions
# `rf₁`, `rf₂`, ..., and `rfₙ` are not stateful.

# ## Early termination

# `Base`'s `maximum` reports the maximum to be `missing` when it
# receives a container with a `missing`:

@test begin
    maximum([1, 2, missing, 3])
end === missing

# We can obtain the same behavior by using `isless` instead of `>` in
# `findmax_step′`:

function findmax_step′((argmax, max), (index, value))
    argmax, max = isless(max, value) ? (index, value) : (argmax, max)
    return argmax => max
end

@test begin
    foldl(findmax_step′, pairs([1, 2, missing, 3]))
end === (3 => missing)

@testset "foldl(findmax_step′, pairs(...))" begin
    f(xs) = foldl(findmax_step′, pairs(xs))
    @test f([1, 2, 3]) === (3 => 3)
    @test f([1, NaN, 3]) === (2 => NaN)
    @test f([1, missing, 3, missing]) === (2 => missing)
end

# `foldl(findmax_step′, ...)` does not stop even after it observed
# `missing`.  We can easily add early termination by using
# [`ReduceIf`](@ref):

@test begin
    [1, 2, missing, 3] |> pairs |> ReduceIf(ismissing ∘ last) |> foldxl(findmax_step′)
end === (3 => missing)

# Note that [`ReduceIf(f)`](@ref ReduceIf) is not same as
# [`TakeWhile(!f)`](@ref TakeWhile):

@test begin
    [1, 2, missing, 3] |> pairs |> TakeWhile(!(ismissing ∘ last)) |> foldxl(findmax_step′)
end === (2 => 2)

# That is to say, `TakeWhile` does not evaluate the inner reducing
# step function with the item that triggers the early termination.
# That's why we need `ReduceIf` here.

# ### `findmin` with `missing` and `NaN`

# Unfortunately, we do not have `min`-compatible "total" ordering in
# `Base`.  Thus, we need to create a function that special-cases
# `missing` and `NaN`:

function isgreater(x, y)
    xisnan = x != x
    xisnan isa Bool || return false  # x is missing
    yisnan = y != y
    yisnan isa Bool || return true  # y is missing
    xisnan && return false
    yisnan && return true
    return isless(y, x)
end

@assert isgreater(2, 1)
@assert isgreater(1, missing)
@assert isgreater(NaN, missing)
@assert isgreater(1, NaN)
@assert !isgreater(1, 2)
@assert !isgreater(missing, 1)
@assert !isgreater(missing, NaN)
@assert !isgreater(NaN, 1)

# Using `isgreater` instead of `<`, we can define `findmin_step′` like
# `findmax_step′`:

function findmin_step′((argmin, min), (index, value))
    argmin, min = isgreater(min, value) ? (index, value) : (argmin, min)
    return argmin => min
end

@test begin
    foldl(findmax_step′, pairs([1, 2, missing, 3]))
end === (3 => missing)

@testset "foldl(findmin_step′, pairs(...))" begin
    f(xs) = foldl(findmin_step′, pairs(xs))
    @test f([1, 2, 3]) === (1 => 1)
    @test f([1, NaN, 3]) === (2 => NaN)
    @test f([1, missing, 3, missing]) === (2 => missing)
end

# ### Extrema (`findminmax`) with early termination

# As before, we can fuse `findmin_step′` and `findmax_step′` using
# `TeeRF`.  This can also be composed with `ReduceIf`:

@test begin
    [1, 2, 3, 0, 2] |>
    pairs |>
    ReduceIf(ismissing ∘ last) |>
    foldxl(TeeRF(findmin_step′, findmax_step′))
end === ((4 => 0), (3 => 3))
#-

@test begin
    [1, 2, missing, 0, 2] |>
    pairs |>
    ReduceIf(ismissing ∘ last) |>
    foldxl(TeeRF(findmin_step′, findmax_step′))
end === ((3 => missing), (3 => missing))

# ## Ad-hoc imputation

# Using [`Scan`](@ref), it is straightforward to fill `missing` items
# with the last non-`missing` item (last observation carried forward):

@test begin
    [1, 3, missing, 0, 2, missing, missing] |>
    pairs |>
    MapSplat(Pair) |>
    Scan() do last, (k, v)
        ismissing(v) ? last : k => v
    end |>
    collect
end == [1 => 1, 2 => 3, 2 => 3, 4 => 0, 5 => 2, 5 => 2, 5 => 2]

# `rightif` can also be used:

@test begin
    [1, 3, missing, 0, 2, missing, missing] |>
    pairs |>
    MapSplat(Pair) |>
    Scan(rightif(!(ismissing ∘ right), last)) |>
    collect
end == [1 => 1, 2 => 3, 2 => 3, 4 => 0, 5 => 2, 5 => 2, 5 => 2]
nothing  # hide

# Note that the output still may contain `missing` if the first item
# is `missing`:

@test begin
    [missing, 1, missing] |>
    pairs |>
    MapSplat(Pair) |>
    Scan(rightif(!(ismissing ∘ right), last)) |>
    collect
end |> isequal([1 => missing, 2 => 1, 2 => 1])

# This can be worked around by specifying `init` argument for `Scan`:

@test begin
    [missing, 1, missing] |>
    pairs |>
    MapSplat(Pair) |>
    Scan(rightif(!(ismissing ∘ right), last), 0 => 0) |>
    collect
end == [0 => 0, 2 => 1, 2 => 1]
