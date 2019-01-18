module Transducers

export Map, Filter, Cat, MapCat, Take, PartitionBy, Scan, Zip,
    Replace, TakeWhile, TakeNth, Drop, DropLast, DropWhile, Keep, Distinct,
    Interpose, Dedupe, Partition, Iterated, Count,
    TakeLast, FlagFirst, MapSplat, ScanEmit, Enumerate, NotA, OfType,
    transduce, eduction,
    Completing, Initializer, right

using ArgCheck

import Setfield
using Setfield: Lens, @lens, set

include("basics.jl")
include("core.jl")
include("library.jl")
include("simd.jl")
include("processes.jl")
include("lister.jl")
include("show.jl")

end # module
