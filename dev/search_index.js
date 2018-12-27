var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "#Transducers-for-Julia-1",
    "page": "Home",
    "title": "Transducers for Julia",
    "category": "section",
    "text": "warning: Warning\nThis is a work in progress!DocTestSetup = quote\n    using Transducers\nendTransducers are composable transformations which can be implemented very efficiently and useful in both compute- and I/O-bound contexts.  The interface used by transducers can naturally describe a wide range of processes that can be formalized as a succession of steps.  Furthermore, transducers can be defined without specifying the details of the input and output (collections, streams, channels, etc.) and therefore achieves a full reusability.  Transducers are introduced by Rich Hickey, the creator of the Clojure language. His Strange Look talk is a great introduction to the idea of transducers.Transducers.jl is an implementation of the transducer framework in Julia.  Aiming to satisfy high-performance needs of Julia users, Transducers.jl uses a formulation that is pure [pure] and aiding type-stability.[pure]: ...although not pure in the strong sense as Base.@pure."
},

{
    "location": "#Examples-1",
    "page": "Home",
    "title": "Examples",
    "category": "section",
    "text": "If you are familiar with iterators (see also Base.Iterators and IterTools.jl) it would look very familiar to you:julia> using Transducers\n\njulia> collect(Map(x -> 2x), 1:3)  # double each element\n3-element Array{Int64,1}:\n 2\n 4\n 6\n\njulia> collect(Filter(iseven), 1:6)  # collect only evens\n3-element Array{Int64,1}:\n 2\n 4\n 6\n\njulia> collect(MapCat(x -> 1:x), 1:3)  # concatenate mapped results\n6-element Array{Int64,1}:\n 1\n 1\n 2\n 1\n 2\n 3\nTransducers can be composed (without, unlike iterators, referring to the input):julia> xf = Filter(iseven) |> Map(x -> 2x)\n       collect(xf, 1:6)\n3-element Array{Int64,1}:\n  4\n  8\n 12An efficient way to use transducers is combination with mapfoldl.  This computation is done without creating any intermediate lazy object and compiles to a single loop:julia> mapfoldl(xf, +, 0, 1:6)\n24mapfoldl (or foldl) illustrates the difference between iterators and transducers.  Implementation of the same computation in iterator would be:f(x) = 2x\nmapfoldl(f, +, 0, filter(iseven, input))\nfoldl(+, map(f, filter(iseven, input)))  # equivalent\n         _____________________________\n         composition at inputCompare it to:mapfoldl(Filter(iseven) |> Map(f), +, 0, input)\n         ________________________\n         composition at computation"
},

{
    "location": "#Links-1",
    "page": "Home",
    "title": "Links",
    "category": "section",
    "text": "\"Transducers\" by Rich Hickey - YouTube\nRich Hickey - Inside Transducers - YouTube\nCppCon 2015: Juan Pedro Bolívar Puente “Transducers: from Clojure to C++\" - YouTube"
},

{
    "location": "manual/#",
    "page": "Manual",
    "title": "Manual",
    "category": "page",
    "text": ""
},

{
    "location": "manual/#Transducers-and-Transducer-contexts-1",
    "page": "Manual",
    "title": "Transducers and Transducer contexts",
    "category": "section",
    "text": "Pages = [\"manual.md\"]\nOrder = [:function, :type]"
},

{
    "location": "manual/#Base.mapfoldl",
    "page": "Manual",
    "title": "Base.mapfoldl",
    "category": "function",
    "text": "mapfoldl(xf, step, init, itr) :: T\ntransduce(xf, step, init, itr) :: Union{T, Reduced{T}}\n\nCompose transducer xf with reducing step function step and reduce itr using it.\n\nwarning: Warning\ntransduce differs from mapfoldl as Reduced{T} is returned if the transducer xf or step aborts the reduction.\n\nThis API is modeled after transduce in Clojure.\n\nArguments\n\nxf::Transducer: A transducer.\nstep: A callable which accepts 1 and 2 arguments.  If it only accepts 2 arguments, wrap it by Completing to add complete protocol.\ninit: An initial value fed to the first argument to reducing step function step.\nitr: An iterable.\n\nExamples\n\njulia> using Transducers\n\njulia> function step_demo(state, input)\n           @show state, input\n           state + input\n       end;\n\njulia> function step_demo(state)\n           println(\"Finishing with state = \", state)\n           state\n       end;\n\njulia> mapfoldl(Filter(isodd), step_demo, 0.0, 1:4)\n(state, input) = (0.0, 1)\n(state, input) = (1.0, 3)\nFinishing with state = 4.0\n4.0\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.transduce",
    "page": "Manual",
    "title": "Transducers.transduce",
    "category": "function",
    "text": "mapfoldl(xf, step, init, itr) :: T\ntransduce(xf, step, init, itr) :: Union{T, Reduced{T}}\n\nSee mapfoldl.\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.loop",
    "page": "Manual",
    "title": "Transducers.loop",
    "category": "function",
    "text": "loop(step, xf, init, coll)\n\nThis is a shorthand for transduce(Completing(step), xf, init, coll). It is intended to be used with do block.\n\nExamples\n\njulia> using Transducers\n\njulia> loop(Filter(isodd), 0.0, 1:4) do state, input\n           @show state, input\n           state + input\n       end\n(state, input) = (0.0, 1)\n(state, input) = (1.0, 3)\n4.0\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.eduction",
    "page": "Manual",
    "title": "Transducers.eduction",
    "category": "function",
    "text": "eduction(xf::Transducer, coll)\n\nCreate a iterable and reducible object.\n\nIterable.\nReducible (TODO); i.e., it can be handled by transduce efficiently.\n\nThis API is modeled after eduction in Clojure.\n\nExamples\n\njulia> using Transducers\n\njulia> for x in eduction(Filter(isodd) |> Take(3), 1:1000)\n           @show x\n       end\nx = 1\nx = 3\nx = 5\n\n\n\n\n\n"
},

{
    "location": "manual/#Base.map!",
    "page": "Manual",
    "title": "Base.map!",
    "category": "function",
    "text": "map!(xf::Transducer, dest, src)\n\nFeed src to transducer xf, storing the result in dest. Collections dest and src must have the same shape.  Transducer xf may contain filtering transducers.  If some entries src are skipped, the corresponding entries in dest will be unchanged. Transducer xf must not contain any expansive transducers such as MapCat.\n\nSee also copy!.\n\nExamples\n\njulia> using Transducers\n\njulia> xs = collect(1:5)\n       ys = zero(xs)\n       map!(Filter(isodd), ys, xs)\n5-element Array{Int64,1}:\n 1\n 0\n 3\n 0\n 5\n\njulia> ans === ys\ntrue\n\n\n\n\n\n"
},

{
    "location": "manual/#Base.copy!",
    "page": "Manual",
    "title": "Base.copy!",
    "category": "function",
    "text": "copy!(xf::Transducer, dest, src)\n\nFeed src to transducer xf, storing the result in dest. Collections dest and src may have the same shape.  Source src must be iterable.  Destination dest must implement empty! and push!.\n\nSee also map!.\n\nExamples\n\njulia> using Transducers\n\njulia> copy!(PartitionBy(x -> x ÷ 3) |> Map(sum), Int[], 1:10)\n4-element Array{Int64,1}:\n  3\n 12\n 21\n 19\n\n\n\n\n\n"
},

{
    "location": "manual/#Base.append!",
    "page": "Manual",
    "title": "Base.append!",
    "category": "function",
    "text": "append!(xf::Transducer, dest, src)\n\nThis API is modeled after into in Clojure.\n\nExamples\n\njulia> using Transducers\n\njulia> append!(Drop(2), [-1, -2], 1:5)\n5-element Array{Int64,1}:\n -1\n -2\n  3\n  4\n  5\n\n\n\n\n\n"
},

{
    "location": "manual/#Base.collect",
    "page": "Manual",
    "title": "Base.collect",
    "category": "function",
    "text": "collect(xf::Transducer, itr)\n\nProcess an iterable itr using a transducer xf and collect the result into a Vector.\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Interpose(missing), 1:3)\n5-element Array{Union{Missing, Int64},1}:\n 1\n  missing\n 2\n  missing\n 3\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducer-contexts-1",
    "page": "Manual",
    "title": "Transducer contexts",
    "category": "section",
    "text": "mapfoldl\ntransduce\nloop\neduction\nmap!\ncopy!\nappend!\ncollect"
},

{
    "location": "manual/#Transducers.Cat",
    "page": "Manual",
    "title": "Transducers.Cat",
    "category": "type",
    "text": "Cat()\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Cat(), [[1, 2], [3], [4, 5]]) == 1:5\ntrue\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Dedupe",
    "page": "Manual",
    "title": "Transducers.Dedupe",
    "category": "type",
    "text": "Dedupe()\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Dedupe(), [1, 1, 2, 1, 3, 3, 2])\n5-element Array{Int64,1}:\n 1\n 2\n 1\n 3\n 2\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Distinct",
    "page": "Manual",
    "title": "Transducers.Distinct",
    "category": "type",
    "text": "Distinct()\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Distinct(), [1, 1, 2, 1, 3, 3, 2])\n3-element Array{Int64,1}:\n 1\n 2\n 3\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Drop",
    "page": "Manual",
    "title": "Transducers.Drop",
    "category": "type",
    "text": "Drop(n)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Drop(3), 1:5)\n2-element Array{Int64,1}:\n 4\n 5\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.DropLast",
    "page": "Manual",
    "title": "Transducers.DropLast",
    "category": "type",
    "text": "DropLast(n)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(DropLast(2), 1:5)\n3-element Array{Int64,1}:\n 1\n 2\n 3\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.DropWhile",
    "page": "Manual",
    "title": "Transducers.DropWhile",
    "category": "type",
    "text": "DropWhile(pred)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(DropWhile(x -> x < 3), 1:5)\n3-element Array{Int64,1}:\n 3\n 4\n 5\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Filter",
    "page": "Manual",
    "title": "Transducers.Filter",
    "category": "type",
    "text": "Filter(pred)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Filter(iseven), 1:3)\n1-element Array{Int64,1}:\n 2\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.GetIndex",
    "page": "Manual",
    "title": "Transducers.GetIndex",
    "category": "type",
    "text": "GetIndex(array)\nGetIndex{inbounds}(array)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(GetIndex(1:10), [2, 3, 4])\n3-element Array{Int64,1}:\n 2\n 3\n 4\n\njulia> collect(GetIndex{true}(1:10), [2, 3, 4])\n3-element Array{Int64,1}:\n 2\n 3\n 4\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Interpose",
    "page": "Manual",
    "title": "Transducers.Interpose",
    "category": "type",
    "text": "Interpose(sep)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Interpose(missing), 1:3)\n5-element Array{Union{Missing, Int64},1}:\n 1\n  missing\n 2\n  missing\n 3\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Keep",
    "page": "Manual",
    "title": "Transducers.Keep",
    "category": "type",
    "text": "Keep(f)\n\nExamples\n\njulia> using Transducers\n\njulia> xf = Keep() do x\n           if x < 3\n               x + 1\n           end\n       end;\n\njulia> collect(xf, 1:5)\n2-element Array{Int64,1}:\n 2\n 3\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Map",
    "page": "Manual",
    "title": "Transducers.Map",
    "category": "type",
    "text": "Map(f)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Map(x -> 2x), 1:3)\n3-element Array{Int64,1}:\n 2\n 4\n 6\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.MapCat",
    "page": "Manual",
    "title": "Transducers.MapCat",
    "category": "type",
    "text": "MapCat(f)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(MapCat(x -> 1:x), 1:3)\n6-element Array{Int64,1}:\n 1\n 1\n 2\n 1\n 2\n 3\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.PartitionBy",
    "page": "Manual",
    "title": "Transducers.PartitionBy",
    "category": "type",
    "text": "PartitionBy(f)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(PartitionBy(x -> (x + 1) ÷ 3) |> Map(copy), 1:9)\n4-element Array{Array{Int64,1},1}:\n [1]\n [2, 3, 4]\n [5, 6, 7]\n [8, 9]\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Replace",
    "page": "Manual",
    "title": "Transducers.Replace",
    "category": "type",
    "text": "Replace(dict)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Replace(Dict(\'a\' => \'A\')), \"abc\")\n3-element Array{Char,1}:\n \'A\'\n \'b\'\n \'c\'\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Scan",
    "page": "Manual",
    "title": "Transducers.Scan",
    "category": "type",
    "text": "Scan(f, [init])\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Scan(*), 1:3)\n3-element Array{Int64,1}:\n 1\n 2\n 6\n\njulia> collect(Map(x -> x + im) |> Scan(*), 1:3)\n3-element Array{Complex{Int64},1}:\n 1 + 1im\n 1 + 3im\n 0 + 10im\n\njulia> collect(Scan(*, 10), 1:3)\n3-element Array{Int64,1}:\n 10\n 20\n 60\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.SetIndex",
    "page": "Manual",
    "title": "Transducers.SetIndex",
    "category": "type",
    "text": "SetIndex(array)\nSetIndex{inbounds}(array)\n\nExamples\n\njulia> using Transducers\n\njulia> ys = zeros(3);\n\njulia> mapfoldl(SetIndex(ys), first ∘ tuple, nothing, [(1, 11.1), (3, 33.3)])\n\njulia> ys\n3-element Array{Float64,1}:\n 11.1\n  0.0\n 33.3\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Take",
    "page": "Manual",
    "title": "Transducers.Take",
    "category": "type",
    "text": "Take(n)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Take(2), 1:10)\n2-element Array{Int64,1}:\n 1\n 2\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.TakeNth",
    "page": "Manual",
    "title": "Transducers.TakeNth",
    "category": "type",
    "text": "TakeNth(n)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(TakeNth(3), 1:9)\n3-element Array{Int64,1}:\n 1\n 4\n 7\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.TakeWhile",
    "page": "Manual",
    "title": "Transducers.TakeWhile",
    "category": "type",
    "text": "TakeWhile(pred)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(TakeWhile(x -> x < 3), 1:10)\n2-element Array{Int64,1}:\n 1\n 2\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.TeeZip",
    "page": "Manual",
    "title": "Transducers.TeeZip",
    "category": "type",
    "text": "TeeZip(xform::Transducer)\n\nBranch input into two \"flows\", inject one into xform and then merge the output of xform with the original input.\n\nTo illustrate how it works, consider the following usage\n\nxf0 |> TeeZip(xf1) |> xf2\n\nwhere xf0, xf1, and xf2 are some transducers.  Schematically, the output yn from xfn flows as follows:\n\nxf0      xf1                       xf2\n---- y0 ------ y1 ---.-- (y0, y1) ----->\n      |              |\n       `-------------\'\n    \"Tee\"          \"Zip\"\n\nExamples\n\njulia> using Transducers\n\njulia> collect(TeeZip(Filter(isodd) |> Map(x -> x + 1)), 1:5)\n3-element Array{Tuple{Int64,Int64},1}:\n (1, 2)\n (3, 4)\n (5, 6)\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers.Window",
    "page": "Manual",
    "title": "Transducers.Window",
    "category": "type",
    "text": "Window(size, step = size, flush = false)\nWindow(size; step = size, flush = false)\n\nExamples\n\njulia> using Transducers\n\njulia> collect(Window(3) |> Map(copy), 1:8)\n2-element Array{Array{Int64,1},1}:\n [1, 2, 3]\n [4, 5, 6]\n\njulia> collect(Window(3; flush=true) |> Map(copy), 1:8)\n3-element Array{Array{Int64,1},1}:\n [1, 2, 3]\n [4, 5, 6]\n [7, 8]\n\njulia> collect(Window(3; step=1) |> Map(copy), 1:8)\n6-element Array{Array{Int64,1},1}:\n [1, 2, 3]\n [2, 3, 4]\n [3, 4, 5]\n [4, 5, 6]\n [5, 6, 7]\n [6, 7, 8]\n\n\n\n\n\n"
},

{
    "location": "manual/#Transducers-1",
    "page": "Manual",
    "title": "Transducers",
    "category": "section",
    "text": "Modules = [Transducers]\nPrivate = false\nFilter = t -> t isa Type && t <: Transducers.Transducer"
},

{
    "location": "manual/#Transducers.Completing",
    "page": "Manual",
    "title": "Transducers.Completing",
    "category": "type",
    "text": "Completing(function)\n\nWrap a function to add a no-op complete protocol.  Use it when passing a function without 1-argument arity to transduce etc.\n\n\n\n\n\n"
},

{
    "location": "manual/#Miscellaneous-1",
    "page": "Manual",
    "title": "Miscellaneous",
    "category": "section",
    "text": "Modules = [Transducers]\nPrivate = false\nFilter = t -> t isa Type && !(t <: Transducers.Transducer)"
},

{
    "location": "interface/#",
    "page": "Interface",
    "title": "Interface",
    "category": "page",
    "text": ""
},

{
    "location": "interface/#Transducers.R_",
    "page": "Interface",
    "title": "Transducers.R_",
    "category": "type",
    "text": "Transducers.R_{X}\n\nWhen defining a transducer type X, it is often required to dispatch on type rf::R_{X} (Reducing Function) which bundles the current transducer rf.xform::X and the inner reducing function rf.inner::R_.\n\nconst R_{X} = Reduction{<:X}\n\n\n\n\n\n"
},

{
    "location": "interface/#Transducers.start",
    "page": "Interface",
    "title": "Transducers.start",
    "category": "function",
    "text": "Transducers.start(rf::R_{X}, state)\n\nThis is an optional interface for a transducer.  Default implementation just calls start of the inner reducing function; i.e.,\n\nstart(rf::Reduction, result) = start(rf.inner, result)\n\nIf the transducer X is stateful, it can \"bundle\" its private state with state (so that next function can be \"pure\").\n\nstart(rf::R_{X}, result) = wrap(rf, PRIVATE_STATE, start(rf.inner, result))\n\nSee Take, PartitionBy, etc. for real-world examples.\n\nSide notes: There is no related API in Clojure\'s Transducers. Transducers.jl uses it to implement stateful transducers using \"pure\" functions.  The idea is based on a slightly different approach taken in C++ Transducer library atria.\n\n\n\n\n\n"
},

{
    "location": "interface/#Transducers.next",
    "page": "Interface",
    "title": "Transducers.next",
    "category": "function",
    "text": "Transducers.next(rf::R_{X}, state, input)\n\nThis is the only required interface.  It takes the following form (if start is not defined):\n\nnext(rf::R_{X}, result, input) =\n    # code calling next(rf.inner, result, possibly_modified_input)\n\nSee Map, Filter, Cat, etc. for real-world examples.\n\n\n\n\n\n"
},

{
    "location": "interface/#Transducers.complete",
    "page": "Interface",
    "title": "Transducers.complete",
    "category": "function",
    "text": "Transducers.complete(rf::R_{X}, state)\n\nThis is an optional interface for a transducer.  If transducer X has some internal state, this is the last chance to \"flush\" the result.\n\nSee PartitionBy, etc. for real-world examples.\n\nIf both complete(rf::R_{X}, state) and start(rf::R_{X}, state) are defined, complete(rf::R_{X}, state) must unwarp state before returning state to the outer reducing function.  If complete is not defined for R_{X}, this happens automatically.\n\n\n\n\n\n"
},

{
    "location": "interface/#Transducer-interface-1",
    "page": "Interface",
    "title": "Transducer interface",
    "category": "section",
    "text": "Transducers.R_\nTransducers.start\nTransducers.next\nTransducers.complete"
},

{
    "location": "internals/#",
    "page": "Internals",
    "title": "Internals",
    "category": "page",
    "text": ""
},

{
    "location": "internals/#Transducers.simple_transduce",
    "page": "Internals",
    "title": "Transducers.simple_transduce",
    "category": "function",
    "text": "simple_transduce(xform, step, init, coll)\n\nSimplified version of transduce.  For simple transducers Julia may be able to emit a good code.  This function exists only for performance tuning.\n\n\n\n\n\n"
},

{
    "location": "internals/#Internals-1",
    "page": "Internals",
    "title": "Internals",
    "category": "section",
    "text": "Transducers.simple_transduce"
},

]}
