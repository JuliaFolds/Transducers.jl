module BenchFindall

using BenchmarkTools
using Transducers

struct Mapping{F, T}
    f::F
    itr::T
end

function Base.iterate(itr::Mapping, state...)
    y = iterate(itr.itr, state...)
    y === nothing && return nothing
    return itr.f(y[1]), y[2]
end

needle = 123.0
xs = rand(100_000)
xs[xs.>0.001] .= needle

suite = BenchmarkGroup()
suite["base"] = @benchmarkable findall(isequal($needle), $xs)
suite["xf-array"] = @benchmarkable collect(
    Enumerate() |> Filter(!isequal($needle) ∘ last) |> Map(first),
    $xs,
)
suite["xf-iter"] = @benchmarkable collect(
    Enumerate() |> Filter(isequal($needle) ∘ last) |> Map(first),
    Mapping(identity, $xs),
)

end  # module
BenchFindall.suite
