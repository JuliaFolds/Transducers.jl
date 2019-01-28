module Transducers

export Map, Filter, Cat, MapCat, Take, PartitionBy, Scan, Zip,
    Replace, TakeWhile, TakeNth, Drop, DropLast, DropWhile, Keep, Unique,
    Interpose, Dedupe, Partition, Iterated, Count,
    TakeLast, FlagFirst, MapSplat, ScanEmit, Enumerate, NotA, OfType,
    transduce, eduction, setinput, Reduced, reduced, unreduced,
    Completing, Initializer, right

# Deprecated:
export Distinct

using Base.Broadcast: Broadcasted

using ArgCheck

import Setfield
using Setfield: @lens, @set, set

include("basics.jl")
include("core.jl")
include("library.jl")
include("simd.jl")
include("processes.jl")
include("air.jl")
include("lister.jl")
include("show.jl")
include("deprecated.jl")

end # module
