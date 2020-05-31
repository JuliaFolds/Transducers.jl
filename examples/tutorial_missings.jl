# # Tutorial: missing value handling
#
# This tutorial illustrates the usage of Transducers.jl by stepping
# through various handling of missing values.

using Transducers

# ## Dot product
#
# Here is a simple way to compute a dot product using
# [`foldl`](@ref) and [`MapSplat`](@ref):

foldl(+, MapSplat(*), zip(1:3, 10:2:14))

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

foldl(
    +,
    zip(1:3, 10:2:14) |> xf_printer(" input") |> MapSplat(*) |> xf_printer("output"),
)
flush(stdout)  # hide

# You can see that the input tuple `(1, 10)` is splatted into function
# `*` by `MapSplat` which then outputs `10`.  This is repeated for all
# inputs.

# Perhaps unfortunately, this way of computing a dot product
# propagates any missing values contained in the input arrays to the
# result (which may actually be desired in certain cases).

xs = [1, missing, 3, 2]
ys = [10, 14, missing, 12]
foldl(+, MapSplat(*), zip(xs, ys))

# However, it is very simple to ignore any missing values using
# [`OfType`](@ref):

xf_mdot = opcompose(OfType(Tuple{Vararg{Number}}), MapSplat(*))
foldl(+, xf_mdot, zip(xs, ys))

# Here, `Tuple{Vararg{Number}}` is a type that matches with a tuple of
# any length with numbers.  It does not match with a tuple if it has a
# `missing`.

@assert (1, 0.5) isa Tuple{Vararg{Number}}
@assert (1, 0.5, 2im) isa Tuple{Vararg{Number}}
@assert !((1, missing) isa Tuple{Vararg{Number}})

# ## Covariance
#
# Transducer `xf_mdot` above can also be used to compute the
# covariance.  First, we need the number of pairs of elements in `xs`
# and `ys` that _both_ of them are not `missing`:

nonmissings = foldl(
    right,
    zip(xs, ys) |> OfType(Tuple{Vararg{Number}}) |> Count();
    init = 0,
)
nonmissings  # hide
#-
@assert nonmissings == 2  # hide

# We do this by using [`Count`](@ref) and [`right`](@ref).  `Count`
# ignores input and count the number of times the input is provided.
# Since `OfType(Tuple{Vararg{Number}})` provides the inputs to the
# downstream transducer only if there is no `missing` values, this
# correctly counts the number of non-missing pairs.  Function `right`
# is simply defined as `right(l, r) = r` (and `right(r) = r`).  Thus,
# the whole `foldl` returns the last output of `Count`.  In case
# `Count` never gets called (i.e., there are no non-missing pairs), we
# pass `init=0`.

ans =  # hide
foldl(
    right,
    zip(Int[], Int[]) |> OfType(Tuple{Vararg{Number}}) |> Count();
    init = 0,
)
ans  # hide
#-
@assert ans == 0  # hide

# Finally, we have to pre-process the input to `xf_mdot` by
# subtracting the average.  It's easy to do with `Map`:

using Statistics: mean

function xf_demean(xs, ys)
    xmean = mean(skipmissing(xs))
    ymean = mean(skipmissing(ys))
    return Map(((x, y),) -> (x - xmean, y - ymean))
end

foldl(+, zip(xs, ys) |> xf_demean(xs, ys) |> xf_mdot) / nonmissings

# ## Addition
#
# How do we use transducers for vector-to-vector transformation?  Here
# is a function to calculate ``y = x + y`` while ignoring missing
# values in ``x``.  First, mandatory input shape check:

function add_skipmissing!(ys, xs)
    length(ys) == length(xs) || error("length(ys) != length(xs)")
    firstindex(ys) == 1 || error("firstindex(ys) != 1")
#+
# For filtering out missing values from `xs` while tracking indices,
# we use [`Enumerate`](@ref) and [`Filter`](@ref).  To iterate over
# the output of the transducer, [`foreach`](@ref) is used instead of
# [`foldl`](@ref) since mutating an array is better expressed as a
# side-effect than a fold.

    foreach(xs |> Enumerate() |> Filter(!(ismissing ∘ last))) do (i, xi)
        @inbounds ys[i] += xi
    end
#+
# We then return the mutated value to behave like the rest of Julia
# functions (`push!`, `mul!`, etc.):

    return ys
end
nothing  # hide

# Example:

ans =  # hide
add_skipmissing!([100, 110, 120], [1, missing, 2])
#-
@assert ans == [101, 110, 122]  # hide

# ## Vectorized reduction
#
# `foldl`, `mapfoldl`, etc. in `Base` support `dims` argument.
# Transducers.jl does not support this argument as of writing.
# However, this can easily be emulated using `eachcol`, `eachrow`, or
# `eachslice` iterators in `Base`.

xs = [
    0       missing 1       2
    3       4       5       missing
    missing 6       7       missing
]

function xf_sum_columns(prototype)
    T = Base.nonmissingtype(eltype(prototype)) # subtract Missing from type
    dims = size(prototype)
    return Scan(add_skipmissing!, CopyInit(zeros(T, dims)))
end
nothing  # hide

# We use [`CopyInit`](@ref) here to allocate the "output array"
# into which the columns are added by `add_skipmissing!`.

if VERSION >= v"1.1-"  # eachcol not in Julia 1.0  #src
ans =  # hide
foldl(right, xf_sum_columns(xs[:, 1]), eachcol(xs))
#-
@assert ans == [3, 12, 13]  # hide

# Above computation returns the sum over each row without taking into
# account the relationship within a column.  Another possibly useful
# reduction is the sum of the columns with no missing values.  This
# can easily be done by prepending a filter:

ans =  # hide
foldl(
    right,
    eachcol(xs) |> Filter(x -> !any(ismissing, x)) |> xf_sum_columns(xs[:, 1]),
)
#md ans  # hide
#src `#md ans` is a hack to avoid Literate.jl to put `continued = true`.
#-
@assert ans == [1, 5, 7]  # hide

# Note that above combination of `Scan` and `right` is redundant.  For
# example, we can simply pass `add_skipmissing!` to "normal" `foldl`:

ans =  # hide
foldl(add_skipmissing!, eachcol(xs), init=zeros(Int, size(xs, 1)))
#-
@assert ans == [3, 12, 13]  # hide

# However, packaging it as a transducer is sometimes useful as it can
# be composed with other transducers and "bottom" reducing function.
# For example, vectorized version of `cumsum` can easily obtained by
# composing it with `append!` (and then `reshape` after `foldl`):

result = foldl(
    append!,
    xf_sum_columns(xs[:, 1]),
    eachcol(xs);
    init = Int[],
)
ans =  # hide
reshape(result, (size(xs, 1), :))
#-
@assert ans == [      # hide
    0  0   1   3      # hide
    3  7  12  12      # hide
    0  6  13  13      # hide
]                     # hide
end  # if VERSION >= v"1.1-"  #src

# ## Argmax
#
# Another useful operation to do ignoring missing values is
# `argmax`/`argmin`.  It can be implemented using `opcompose(Enumerate(),
# Filter(!(ismissing ∘ last)))` (see also `add_skipmissing!` above)
# composed with [`ScanEmit`](@ref).  We first need to define a
# function to be called by `ScanEmit`:

##                     ,--- current state
##                     |
##                     |              ,-- input
##                     |              |
function argmax_step((argmax, max), (index, value))
    argmax, max = value > max ? (index, value) : (argmax, max)
    return argmax, (argmax, max)
    ##       \        \
    ##        \        \__ next state
    ##         \
    ##          \__ output
end
nothing  # hide

# This function is passed to `ScanEmit` with the initial state:

xf_argmax = opcompose(
    Enumerate(),
    Filter(!(ismissing ∘ last)),
    ScanEmit(argmax_step, (0, typemin(Int))),
    ##                      |
    ##               initial state
)
nothing  # hide


# As [`ScanEmit`](@ref) is one of the most complex (and powerful)
# transducer, it may require some comments on how above code works:
#
# * The state `(argmax, max)` is initialized to `(0, typemin(Int))` in
#   `xf_argmax`.  This is the first value passed to the first argument
#   `(argmax, max)` of `argmax_step`.
#
# * The upstream transducer `Enumerate()` provides `(index,
#   value)`-pair which becomes the input (the second argument) of
#   `argmax_step`.
#
# * Function `argmax_step` must return a pair.  The first item becomes
#   the output of `ScanEmit`.  In this case that's the index of the
#   largest item seen so far.
#
# * The second item in the returned pair is fed back to `argmax_step`
#   in the next call.
#
# We have the argmax function by extracting the last output of
# `xf_argmax`:

foldl(right, xf_argmax, [1, 3, missing, 2])

# Side note: We use `typemin(Int)` as the initial value of `max` for
# simplicity.  In practice, it should be
# `typemin(eltype(input_array))`.  A more generic solution is to
# special-case the first invocation by using a singleton like
# `nothing`.  Julia can handle small `Union` type such as this (see
# the next section).  Another solution is to use `Init(>)` from
# InitialValues.jl.

# ## Extrema
#
# Transducer `xf_argmax` in the previous section only outputs the
# index of the maximum element so far.  To output the maximum element
# as well, we can simply use [`Scan`](@ref).  Also, while we are at
# it, let's support both argmax and argmin.  To this end, we
# parametrize the function passed to `Scan` by the comparison function
# `>` and `<`.  Another problem with `xf_argmax` is that it does not
# handle non-`Int` input types.  To properly handle different input
# types, we initialize `Scan`'s state with `nothing` and special-case
# the first invocation to return the input as-is.  Following function
# `argext_step` takes the function `>` or `<` and return a function
# appropriate for `Scan.`

argext_step(should_update) =
    (old, (index, value)) ->
        if old === nothing || should_update(old[2], value)
            (index, value)
        else
            old
        end
nothing  # hide

xf_scanext(should_update) = Scan(argext_step(should_update), nothing)
nothing  # hide

# Passing `<` gives us the argmax transducer:

@time begin  #src
ans = # hide
foldl(
    right,
    [1.0, 3.0, missing, 2.0] |>
        Enumerate() |>
        OfType(Tuple{Integer,Number}) |>
        xf_scanext(<),
)
end  #src
#-
@assert ans === (2, 3.0) # hide
@show ans  #src

# We now have transducers `xf_scanext(<)` and `xf_scanext(>)` for
# argmax and argmin, respectively.  We can compute them concurrently
# by [`Zip`](@ref)'ing them together:

xf_fullextrema = opcompose(
    Enumerate(),
    OfType(Tuple{Integer,Number}),
    Zip(xf_scanext(>), xf_scanext(<)),
)

@time begin  #src
ans = # hide
foldl(right, xf_fullextrema, [1.0, 3.0, -1.0, missing, 2.0])
end  #src
#-
@assert ans === ((3, -1.0), (2, 3.0))  # hide
@show ans  #src

# This transducer produces a tuple `((argmin, min), (argmax, max))`.
# To output only indices, append an appropriate `Map`:

xf_argextrema = opcompose(
    xf_fullextrema,
    Map() do ((argmin, min), (argmax, max))
        (argmin, argmax)
    end,
)

@time begin  #src
ans = # hide
foldl(right, xf_argextrema, [1.0, 3.0, -1.0, missing, 2.0])
end  #src
#-
@assert ans === (3, 2)  # hide
@show ans  #src
