# # Upgrade to new `|>` of Transducers.jl 0.4.XX
#
# Transducers.jl 0.4.XX now interpret `|>` differently.  Consider
# following examples:

using Transducers
using Test                                                             #src

old1 =                                                                 #src
collect(Filter(isodd) |> Map(inv), 1:5)
#-

old2 =                                                                 #src
foldl(+, Filter(isodd) |> Map(inv), 1:5)
#-

# It is now recommended to write

@test old1 ==                                                          #src
1:5 |> Filter(isodd) |> Map(inv) |> collect
#-

@test old2 ==                                                          #src
foldl(+, 1:5 |> Filter(isodd) |> Map(inv))
#-

# The last snippet can also be written as

@test old2 ==                                                          #src
1:5 |> Filter(isodd) |> Map(inv) |> sum

# Note that `|>` now is compatible with the standard function
# application definition of `|>` (i.e., `x |> f == f(x)`):

yes =                                                                  #src
1:5 |> Filter(isodd) |> Map(inv) === Map(inv)(Filter(isodd)(1:5))
@test yes                                                              #src

# !!! note
#
#     Julia < 1.3 requires `collection |> xf` or `eduction(xf,
#     collection)` instead of `xf(collection)`.

# If there is no input collection; e.g.,

old3 =                                                                 #src
foldl(right, GroupBy(x -> gcd(x, 6), Map(last) |> Filter(isodd), push!!), 1:10)

# use the opposite composition `opcompose` instead:

@test old3 ==                                                          #src
foldl(right, GroupBy(x -> gcd(x, 6), opcompose(Map(last), Filter(isodd)), push!!), 1:10)

# In Julia ≥ 1.5,
# [`⨟`](https://github.com/JuliaFunctional/CompositionsBase.jl) can
# also be used as the infix version of the opposite composition
#
# ```julia
# foldl(right, GroupBy(x -> gcd(x, 6), Map(last) ⨟ Filter(isodd), push!!), 1:10)
# ```

# Note that `collection |> xf` and `xf(collection)` create an
# [`eduction(xf, collection)`](@ref eduction) which is iterable.
# However, it is not recommended to use it with non-specialized
# functions.  For example, even though

for x in 1:5 |> Filter(isodd)
    @show x
end

# works as expected, it is recommended to use

foreach(1:5 |> Filter(isodd)) do x
    @show x
end
nothing                                                              # hide

# when the performance is important.
