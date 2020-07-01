# Benchmark result

* Target commit: [`07e0e7e94fe5ca54f648c6789f62f181ea0e7b15`](https://github.com/JuliaFolds/Transducers.jl/commit/07e0e7e94fe5ca54f648c6789f62f181ea0e7b15)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/322> (Use create-pull-request v2)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 02:33
    - Baseline: 1 Jul 2020 - 02:37
* Package commits:
    - Target: 96d9c6
    - Baseline: 391f3f
* Julia commits:
    - Target: 44fa15
    - Baseline: 44fa15
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`
    - Baseline: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                                       | time ratio                   | memory ratio |
|------------------------------------------|------------------------------|--------------|
| `["findall", "base"]`                    |                1.06 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.14 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.13 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.12 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.14 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "man"]`                 | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["cat"]`
- `["collect"]`
- `["dot"]`
- `["filter_map_map!"]`
- `["filter_map_reduce"]`
- `["findall"]`
- `["gemm", "fusedmul", "blas"]`
- `["gemm", "fusedmul", "xf"]`
- `["gemm", "mul", "linalg"]`
- `["gemm", "mul", "man", "false"]`
- `["gemm", "mul", "man", "ivdep"]`
- `["gemm", "mul", "man", "true"]`
- `["gemm", "mul", "xf", "false"]`
- `["gemm", "mul", "xf", "ivdep"]`
- `["gemm", "mul", "xf", "true"]`
- `["groupby", "sum"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`

## Julia versioninfo

### Target
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      46931 s          0 s       1457 s      14444 s          0 s
       #2  2394 MHz      12917 s          0 s       1603 s      48435 s          0 s
       
  Memory: 6.764884948730469 GB (3026.1953125 MB free)
  Uptime: 647.0 sec
  Load Avg:  1.0322265625  1.0  0.623046875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

### Baseline
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      68951 s          0 s       1614 s      16080 s          0 s
       #2  2394 MHz      14722 s          0 s       1704 s      70386 s          0 s
       
  Memory: 6.764884948730469 GB (2990.6328125 MB free)
  Uptime: 887.0 sec
  Load Avg:  1.0  1.0  0.724609375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 2:33
* Package commit: 96d9c6
* Julia commit: 44fa15
* Julia command flags: None
* Environment variables: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                       | time            | GC time | memory          | allocations |
|------------------------------------------|----------------:|--------:|----------------:|------------:|
| `["cat", "base"]`                        |   1.810 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.760 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 115.702 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  92.401 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 330.404 μs (5%) |         | 704.84 KiB (1%) |       16649 |
| `["dot", "blas"]`                        |   2.167 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.167 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.533 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.544 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  61.900 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 619.504 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 226.302 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 226.302 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 948.811 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 827.609 μs (5%) |         |   3.04 MiB (1%) |       99396 |
| `["findall", "xf-iter"]`                 |   3.471 ms (5%) |         |   9.63 MiB (1%) |      299932 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.542 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.377 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.101 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.504 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.095 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 640.704 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.594 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.553 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 937.808 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.362 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 281.760 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.091 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.640 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 455.330 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.060 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   5.883 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 450.005 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.079 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.880 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 472.959 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.095 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.740 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 447.480 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.046 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.383 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 456.858 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.084 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.720 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 463.452 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 240.802 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 183.001 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 179.600 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.240 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.545 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.567 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.240 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.057 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.729 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.089 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.250 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 217.902 μs (5%) |         |  72.03 KiB (1%) |        3739 |
| `["missing_dot", "xf_nota"]`             | 219.502 μs (5%) |         |  72.31 KiB (1%) |        3749 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 188.370 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.917 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.906 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["cat"]`
- `["collect"]`
- `["dot"]`
- `["filter_map_map!"]`
- `["filter_map_reduce"]`
- `["findall"]`
- `["gemm", "fusedmul", "blas"]`
- `["gemm", "fusedmul", "xf"]`
- `["gemm", "mul", "linalg"]`
- `["gemm", "mul", "man", "false"]`
- `["gemm", "mul", "man", "ivdep"]`
- `["gemm", "mul", "man", "true"]`
- `["gemm", "mul", "xf", "false"]`
- `["gemm", "mul", "xf", "ivdep"]`
- `["gemm", "mul", "xf", "true"]`
- `["groupby", "sum"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`

## Julia versioninfo
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      46931 s          0 s       1457 s      14444 s          0 s
       #2  2394 MHz      12917 s          0 s       1603 s      48435 s          0 s
       
  Memory: 6.764884948730469 GB (3026.1953125 MB free)
  Uptime: 647.0 sec
  Load Avg:  1.0322265625  1.0  0.623046875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 2:37
* Package commit: 391f3f
* Julia commit: 44fa15
* Julia command flags: None
* Environment variables: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                       | time            | GC time | memory          | allocations |
|------------------------------------------|----------------:|--------:|----------------:|------------:|
| `["cat", "base"]`                        |   1.730 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.770 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 110.801 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  93.200 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 325.101 μs (5%) |         | 705.27 KiB (1%) |       16674 |
| `["dot", "blas"]`                        |   2.178 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.156 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.544 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.544 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  62.000 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 620.102 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 226.300 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 226.300 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 899.004 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 823.104 μs (5%) |         |   3.02 MiB (1%) |       98821 |
| `["findall", "xf-iter"]`                 |   3.423 ms (5%) |         |   9.63 MiB (1%) |      299924 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.544 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.379 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.994 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.505 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.163 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 639.402 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.249 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.545 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 937.504 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.124 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.096 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   5.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.110 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.124 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.091 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.500 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.121 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 244.201 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 187.101 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 185.601 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.230 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.556 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.511 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.340 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.148 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.729 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.116 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.270 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 210.801 μs (5%) |         |  72.20 KiB (1%) |        3747 |
| `["missing_dot", "xf_nota"]`             | 209.300 μs (5%) |         |  72.22 KiB (1%) |        3745 |
| `["overhead", "foldl"]`                  |   4.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 186.383 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.920 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.898 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["cat"]`
- `["collect"]`
- `["dot"]`
- `["filter_map_map!"]`
- `["filter_map_reduce"]`
- `["findall"]`
- `["gemm", "fusedmul", "blas"]`
- `["gemm", "fusedmul", "xf"]`
- `["gemm", "mul", "linalg"]`
- `["gemm", "mul", "man", "false"]`
- `["gemm", "mul", "man", "ivdep"]`
- `["gemm", "mul", "man", "true"]`
- `["gemm", "mul", "xf", "false"]`
- `["gemm", "mul", "xf", "ivdep"]`
- `["gemm", "mul", "xf", "true"]`
- `["groupby", "sum"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`

## Julia versioninfo
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      68951 s          0 s       1614 s      16080 s          0 s
       #2  2394 MHz      14722 s          0 s       1704 s      70386 s          0 s
       
  Memory: 6.764884948730469 GB (2990.6328125 MB free)
  Uptime: 887.0 sec
  Load Avg:  1.0  1.0  0.724609375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 2 |

`lscpu` output:

    Architecture:        x86_64
    CPU op-mode(s):      32-bit, 64-bit
    Byte Order:          Little Endian
    CPU(s):              2
    On-line CPU(s) list: 0,1
    Thread(s) per core:  1
    Core(s) per socket:  2
    Socket(s):           1
    NUMA node(s):        1
    Vendor ID:           GenuineIntel
    CPU family:          6
    Model:               63
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz
    Stepping:            2
    CPU MHz:             2394.459
    BogoMIPS:            4788.91
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            30720K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm invpcid_single pti fsgsbase bmi1 avx2 smep bmi2 erms invpcid xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Haswell                                                |
| Model              | Family: 0x06, Model: 0x3f, Stepping: 0x02, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 30720) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 44 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

