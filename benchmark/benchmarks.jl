using BenchmarkTools
SUITE = BenchmarkGroup()
SUITE["filter_map_reduce"] = include("bench_filter_map_reduce.jl")
SUITE["filter_map_map!"] = include("bench_filter_map_map!.jl")
SUITE["partition_by"] = include("bench_partition_by.jl")
