module Transducers

export Map, Filter, Cat, MapCat, Take, PartitionBy, Scan, TeeZip, Zip,
    Replace, TakeWhile, TakeNth, Drop, DropLast, DropWhile, Keep, Distinct,
    Interpose, Dedupe, Window, GetIndex, SetIndex, Iterated, Count, Merge,
    transduce, eduction, loop,
    Completing

include("basics.jl")
include("core.jl")
include("library.jl")
include("processes.jl")
include("lister.jl")

end # module
