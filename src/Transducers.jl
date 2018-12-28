module Transducers

export Map, Filter, Cat, MapCat, Take, PartitionBy, Scan, TeeZip,
    Replace, TakeWhile, TakeNth, Drop, DropLast, DropWhile, Keep, Distinct,
    Interpose, Dedupe, Window, GetIndex, SetIndex,
    transduce, eduction, loop,
    Completing

include("basics.jl")
include("core.jl")
include("library.jl")
include("contexts.jl")
include("lister.jl")

end # module
