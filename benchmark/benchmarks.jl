using BenchmarkTools
SUITE = BenchmarkGroup()
SUITE["filter_map_reduce"] = include("bench_filter_map_reduce.jl")
