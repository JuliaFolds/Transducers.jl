module BenchMapCatEduction

using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

SUITE["xf-eduction"] =
    @benchmarkable foldl(+, 1:1000 |> MapCat(x -> 1:x |> Map(x -> x + 1)))
SUITE["xf-xf"] = @benchmarkable foldl(+, 1:1000 |> MapCat(x -> 1:x) |> Map(x -> x + 1))
SUITE["base"] = @benchmarkable sum(y + 1 for x in 1:1000 for y in 1:x)

end  # module
BenchMapCatEduction.SUITE
