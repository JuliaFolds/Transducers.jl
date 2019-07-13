using PkgBenchmark
benchmarkpkg(dirname(@__DIR__), resultfile=joinpath(@__DIR__, "result.json"))
