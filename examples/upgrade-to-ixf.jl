# # Upgrade to new `|>` of Transducers.jl 0.4.39
#
# Transducers.jl 0.4.39 now interprets `|>` differently.  Consider the
# following examples:

using Transducers
using LiterateTest                                                     #src
using Test                                                             #src
using Logging                                                        # hide

@dedent old1 = with_logger(NullLogger()) do
    collect(Filter(isodd) |> Map(inv), 1:5)
end
@dedent old2 = with_logger(NullLogger()) do
    foldl(+, Filter(isodd) |> Map(inv), 1:5)
end
nothing                                                              # hide

# It is now recommended to write

@test begin
    1:5 |> Filter(isodd) |> Map(inv) |> collect
end == old1
@test begin
    foldl(+, 1:5 |> Filter(isodd) |> Map(inv))
end == old2
nothing                                                              # hide

# The last snippet can also be written as

@test begin
    1:5 |> Filter(isodd) |> Map(inv) |> sum
end == old2
nothing                                                              # hide

# Note that `|>` now is compatible with the standard function
# application definition of `|>` (i.e., `x |> f == f(x)`):

if VERSION >= v"1.3"                                                   #src
    @dedent begin
        @assert 1:5 |> Filter(isodd) |> Map(inv) === Map(inv)(Filter(isodd)(1:5))
    end
end                                                                    #src

# !!! note
#
#     Julia < 1.3 requires `collection |> xf` or `eduction(xf,
#     collection)` instead of `xf(collection)`.

# If there is no input collection; e.g.,

@dedent old3 = with_logger(NullLogger()) do
    xf = Map(last) |> Filter(isodd)
    foldl(right, GroupBy(x -> gcd(x, 6), xf, push!!), 1:10)
end
nothing                                                              # hide

# use the opposite composition `opcompose` instead:

@test begin
    xf = opcompose(Map(last), Filter(isodd))
    foldl(right, GroupBy(x -> gcd(x, 6), xf, push!!), 1:10)
end == old3
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
@test old4 == ys
nothing                                                              # hide

# when the performance is important.
#
# Transducers.jl 0.4.39 also adds [`xf'(rf)`](@ref adjoint) as the
# [reducing function transformation](@ref glossary-rfxf).  This makes
# composing reducing functions easier.  For example, it can be used to
# compute even minimum and odd maximum in one go:

rf = TeeRF(Filter(iseven)'(min), Filter(isodd)'(max))
@test begin
    reduce(rf, Map(identity), 1:10)
end == (2, 9)

# More details can be found in the reference entries such as
# [`Transducer`](@ref), [`eduction`](@ref), [`adjoint`](@ref),
# [`reducingfunction`](@ref) and [`∘`](@ref).  To understand how those
# interfaces work coherently, see [the explanation section on
# "generalized" transducers](@ref glossary-transducer).
