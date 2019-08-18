using PkgBenchmark
include("pprinthelper.jl")
result = PkgBenchmark.readresults(joinpath(@__DIR__, "result.json"))
displayresult(result)
