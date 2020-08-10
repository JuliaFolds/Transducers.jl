module BenchTeeRFFilter

using BenchmarkTools
using Transducers

const SUITE = BenchmarkGroup()

let xs = 1:1000
    rf = TeeRF(Filter(isodd)'(+), Filter(iseven)'(+))

    SUITE["noinit"] = @benchmarkable foldxl($rf, $xs)
    SUITE["withinit"] = @benchmarkable foldxl($rf, $xs; init = (0, 0))
end

end  # module
BenchTeeRFFilter.SUITE
