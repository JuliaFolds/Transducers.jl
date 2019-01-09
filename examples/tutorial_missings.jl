# # Tutorial: missing value handling
#
# This tutorial illustrates the usage of Transducers.jl by stepping
# through various handling of missing values.

using Transducers

# ## Dot product
#
# Here is a simple way to compute a dot product using
# [`mapfoldl`](@ref) and [`MapSplat`](@ref):

mapfoldl(MapSplat(*), +, zip(1:3, 10:2:14))

# Let's see what it does step by step.  First we create a "printer"
# transducer using this function (see [`Map`](@ref)):

xf_printer(label) = Map() do x
    println(label, ": ", x)
    return x  # just return it as-is
end
nothing  # hide

# This transducer just pass-through the input while printing its value
# (prefixed by a `label`).  Let's sandwich the previously
# `MapSplat(*)` using it:

_ = mapfoldl(
    xf_printer(" input") |> MapSplat(*) |> xf_printer("output"),
    +, zip(1:3, 10:2:14))
flush(stdout)  # hide

# You can see that the input tuple `(1, 10)` is splatted into function
# `*` by `MapSplat` which then outputs `10`.  This is repeated for all
# inputs.

# Perhaps unfortunately, this way of computing a dot product propagate
# any missing values contained in the input arrays to the result
# (which may actually be desired in certain cases).

xs = [1, missing, 3, 2]
ys = [10, 14, missing, 12]
mapfoldl(MapSplat(*), +, zip(xs, ys))

# However, it is very simple to ignore any missing values using
# [`NotA`](@ref):

xf_mdot = MapSplat(*) |> NotA(Missing)
mapfoldl(xf_mdot, +, zip(xs, ys))

#jl Make sure this comment is correct:
#jl
#jl # (You may think filtering out missing values after computing the
#jl # multiplication.  However, it looks like the Julia compiler optimizes
#jl # out the "dead code" and makes it efficient.)

# ## Covariance
#
# This transducer `xf_mdot` can also be used to compute the
# covariance.  First, we need the pairs of elements in `xs` and `ys`
# that _both_ of them are not `missing`:

nonmissings = mapfoldl(xf_mdot |> Count(), right, zip(xs, ys); init=0)

# We do this by using [`Count`](@ref) and [`right`](@ref).  `Count`
# ignores input and count the number of times the input is provided.
# Since `xf_mdot` provides the inputs to the downstream transducer,
# this correctly counts the number of non-missing pairs.  Function
# `right` is simply defined as `right(l, r) = r`.  Thus, the whole
# `mapfoldl` returns the last output of `Count`.  In case `Count`
# never gets called (i.e., there are no non-missing pairs), we pass
# `init=0`.
#
# Finally, we have to pre-process the input to `xf_mdot` by
# subtracting the average.  It's easy to do with `Map`:

using Statistics: mean

xf_demean = let
    xmean = mean(skipmissing(xs))
    ymean = mean(skipmissing(ys))
    Map(((x, y),) -> (x - xmean, y - ymean))
end

mapfoldl(xf_demean |> xf_mdot, +, zip(xs, ys)) / nonmissings
