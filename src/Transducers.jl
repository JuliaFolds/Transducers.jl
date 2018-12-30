module Transducers

export Map, Filter, Cat, MapCat, Take, PartitionBy, Scan, TeeZip, Zip,
    Replace, TakeWhile, TakeNth, Drop, DropLast, DropWhile, Keep, Distinct,
    Interpose, Dedupe, Partition, GetIndex, SetIndex, Iterated, Count, Merge,
    TakeLast, FlagFirst, MapSplat, ScanEmit,
    transduce, eduction,
    Completing

include("basics.jl")
include("core.jl")
include("library.jl")
include("processes.jl")
include("lister.jl")
include("show.jl")

end # module
