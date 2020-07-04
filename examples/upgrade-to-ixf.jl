# # Upgrade to new `|>` of Transducers.jl 0.4.39
#
# Transducers.jl 0.4.39 now interprets `|>` differently.  Consider the
# following examples:

using Transducers
using Test                                                             #src
using Logging                                                        # hide

with_logger(NullLogger()) do                                         # hide
global old1 =                                                          #src
collect(Filter(isodd) |> Map(inv), 1:5)
global old2 =                                                          #src
foldl(+, Filter(isodd) |> Map(inv), 1:5)
end                                                                  # hide
nothing                                                              # hide

# It is now recommended to write

@test old1 ==                                                          #src
1:5 |> Filter(isodd) |> Map(inv) |> collect
@test old2 ==                                                          #src
foldl(+, 1:5 |> Filter(isodd) |> Map(inv))
nothing                                                              # hide

# The last snippet can also be written as

@test old2 ==                                                          #src
1:5 |> Filter(isodd) |> Map(inv) |> sum
nothing                                                              # hide

# Note that `|>` now is compatible with the standard function
# application definition of `|>` (i.e., `x |> f == f(x)`):

if VERSION >= v"1.3"                                                   #src
@assert 1:5 |> Filter(isodd) |> Map(inv) === Map(inv)(Filter(isodd)(1:5))
end                                                                    #src

# !!! note
#
#     Julia < 1.3 requires `collection |> xf` or `eduction(xf,
#     collection)` instead of `xf(collection)`.

# If there is no input collection; e.g.,

with_logger(NullLogger()) do                                         # hide
global old3 =                                                          #src
foldl(right, GroupBy(x -> gcd(x, 6), Map(last) |> Filter(isodd), push!!), 1:10)
end                                                                  # hide
nothing                                                              # hide

# use the opposite composition `opcompose` instead:

@test old3 ==                                                          #src
foldl(right, GroupBy(x -> gcd(x, 6), opcompose(Map(last), Filter(isodd)), push!!), 1:10)
nothing                                                              # hide

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

ys = Int[]
for x in 1:5 |> Filter(isodd)
    push!(ys, x)
end
old4 = ys                                                              #src
nothing                                                              # hide

# works as expected, it is recommended to use

ys = Int[]
foreach(1:5 |> Filter(isodd)) do x
    push!(ys, x)
end
@test old4 == ys                                                       #src
nothing                                                              # hide

# when the performance is important.
#
# Transducers.jl 0.4.39 also adds [`xf'(rf)`](@ref adjoint) as the
# [reducing function transformation](@ref glossary-rfxf).  This makes
# composing reducing functions easier.  For example, it can be used to
# compute even minimum and odd maximum in one go:

rf = TeeRF(Filter(iseven)'(min), Filter(isodd)'(max))
@test (2, 9) ==                                                        #src
reduce(rf, Map(identity), 1:10)

# More details can be found in the reference entries such as
# [`Transducer`](@ref), [`eduction`](@ref), [`adjoint`](@ref),
# [`reducingfunction`](@ref) and [`∘`](@ref).  To understand how those
# interfaces work coherently, see [the explanation section on
# "generalized" transducers](@ref glossary-transducer).
