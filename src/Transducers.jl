module Transducers

export Transducer, Map, Filter, Cat, MapCat, Take, PartitionBy, Scan, Zip,
    Replace, TakeWhile, TakeNth, Drop, DropLast, DropWhile, Keep, Unique,
    Interpose, Dedupe, Partition, Iterated, Count, GroupBy, ReduceIf,
    TakeLast, FlagFirst, MapSplat, ScanEmit, Enumerate, NotA, OfType,
    transduce, eduction, setinput, Reduced, reduced, unreduced, ifunreduced,
    Completing, Initializer, OnInit, CopyInit, right, reducingfunction

# Deprecated:
export Distinct

using Base.Broadcast: Broadcasted

using ArgCheck
using BangBang: push!!, empty!!, setindex!!
using Requires
using InitialValues: InitialValues, InitialValue, SpecificInitialValue, Init,
    hasinitialvalue

import Setfield
using Setfield: @lens, @set, set

include("showutils.jl")
include("basics.jl")
include("core.jl")
include("library.jl")
include("simd.jl")
include("processes.jl")
include("air.jl")
include("lister.jl")
include("show.jl")
include("comprehensions.jl")
include("deprecated.jl")

include("interop/blockarrays.jl")
include("interop/lazyarrays.jl")

include("evals.jl")

function __init__()
    @require BlockArrays="8e7c35d0-a365-5155-bbbb-fb81a777f24e" begin
        __foldl__(rf, acc, coll::BlockArrays.BlockArray) =
            _foldl_blockarray(rf, acc, coll)
    end
    @require LazyArrays="5078a376-72f3-5289-bfd5-ec5146d43c02" begin
        __foldl__(rf, acc, coll::LazyArrays.Hcat) =
            _foldl_lazy_hcat(rf, acc, coll)
        __foldl__(rf, acc, coll::LazyArrays.Vcat) =
            _foldl_lazy_vcat(rf, acc, coll)
    end
end

end # module
