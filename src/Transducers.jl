module Transducers

export Map, Filter, MapCat, Take, PartitionBy, Scan, TeeZip,
    Replace, TakeWhile, TakeNth, Drop, DropLast, DropWhile, Keep, Distinct,
    Interpose, Dedupe, Window,
    transduce, eduction

include("basics.jl")
include("core.jl")
include("library.jl")
include("contexts.jl")

end # module
