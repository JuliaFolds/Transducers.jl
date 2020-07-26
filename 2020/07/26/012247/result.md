# Benchmark result

* Pull request commit: [`85bf17107221a10251d29b8867f736c40265e8dc`](https://github.com/JuliaFolds/Transducers.jl/commit/85bf17107221a10251d29b8867f736c40265e8dc)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/372> (Do not use LiterateTest for examples/words.jl)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 26 Jul 2020 - 01:17
    - Baseline: 26 Jul 2020 - 01:22
* Package commits:
    - Target: ae8ba5
    - Baseline: b79014
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

| ID                                       | time ratio                   | memory ratio  |
|------------------------------------------|------------------------------|---------------|
| `["append!!", "eduction"]`               |                1.25 (5%) :x: |    1.00 (1%)  |
| `["cat", "base"]`                        |                1.06 (5%) :x: |    1.00 (1%)  |
| `["collect", "identity-float"]`          |                1.08 (5%) :x: |    1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.05 (5%)  | 1.01 (1%) :x: |
| `["gemm", "mul", "linalg", "256"]`       | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         |                1.05 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.90 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.85 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["groupby", "sum", "sac"]`              |                1.09 (5%) :x: |    1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     |                1.08 (5%) :x: |    1.00 (1%)  |
| `["missing_dot", "man"]`                 |                1.11 (5%) :x: |    1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.08 (5%) :x: |    1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
- `["cat"]`
- `["collect"]`
- `["dict"]`
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
- `["mapcat_eduction"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`
- `["set"]`

## Julia versioninfo

### Target
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      27121 s          0 s       1332 s      45859 s          0 s
       #2  2294 MHz      42956 s          0 s       1916 s      29592 s          0 s
       
  Memory: 6.764884948730469 GB (2834.98828125 MB free)
  Uptime: 762.0 sec
  Load Avg:  1.02880859375  1.02099609375  0.67578125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      28068 s          0 s       1414 s      72822 s          0 s
       #2  2294 MHz      69884 s          0 s       2021 s      30489 s          0 s
       
  Memory: 6.764884948730469 GB (2778.53125 MB free)
  Uptime: 1043.0 sec
  Load Avg:  1.01513671875  1.02783203125  0.7841796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 1:17
* Package commit: ae8ba5
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
| `["append!!", "eduction"]`               |  20.000 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  16.300 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.590 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.690 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          |  91.100 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  78.900 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 279.101 μs (5%) |         | 705.00 KiB (1%) |       16657 |
| `["dict", "base"]`                       |   4.107 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   3.987 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   2.278 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.278 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   3.063 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   3.138 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  67.801 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 545.902 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 194.900 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 195.000 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 792.102 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 762.903 μs (5%) |         |   3.05 MiB (1%) |       99959 |
| `["findall", "xf-iter"]`                 |   3.164 ms (5%) |         |   9.63 MiB (1%) |      299928 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.342 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.782 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   8.118 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.103 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.302 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 617.101 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  11.393 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.527 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.211 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.688 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 315.880 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.442 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.925 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 361.165 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.498 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.080 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 373.659 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.460 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.875 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 340.553 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.530 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.503 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.486 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.617 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 365.854 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.587 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.975 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 371.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 224.901 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 169.500 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 165.701 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.490 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.600 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.600 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              | 941.667 ns (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.122 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.111 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               | 931.250 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.180 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.057 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  | 938.235 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             | 954.286 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 180.500 μs (5%) |         |  71.97 KiB (1%) |        3736 |
| `["missing_dot", "xf_nota"]`             | 186.701 μs (5%) |         |  72.17 KiB (1%) |        3742 |
| `["overhead", "foldl"]`                  |   4.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 157.757 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.720 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.694 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.860 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.121 ms (5%) |         |  49.63 KiB (1%) |          21 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
- `["cat"]`
- `["collect"]`
- `["dict"]`
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
- `["mapcat_eduction"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`
- `["set"]`

## Julia versioninfo
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      27121 s          0 s       1332 s      45859 s          0 s
       #2  2294 MHz      42956 s          0 s       1916 s      29592 s          0 s
       
  Memory: 6.764884948730469 GB (2834.98828125 MB free)
  Uptime: 762.0 sec
  Load Avg:  1.02880859375  1.02099609375  0.67578125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 1:22
* Package commit: b79014
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
| `["append!!", "eduction"]`               |  16.000 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  16.300 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.500 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.660 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          |  89.100 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  72.900 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 284.001 μs (5%) |         | 704.95 KiB (1%) |       16656 |
| `["dict", "base"]`                       |   4.199 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.075 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   2.256 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.267 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   3.050 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   3.138 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  68.300 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 534.301 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 194.900 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 194.900 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 773.602 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 729.401 μs (5%) |         |   3.02 MiB (1%) |       98807 |
| `["findall", "xf-iter"]`                 |   3.117 ms (5%) |         |   9.63 MiB (1%) |      299918 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.441 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.796 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.794 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.153 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.293 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 617.901 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.936 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.582 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.299 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.593 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.498 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.487 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.593 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.000 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.469 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.600 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.584 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 206.300 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 156.700 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 158.100 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.480 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.600 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.610 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              | 912.500 ns (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.144 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.133 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               | 914.583 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.060 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.057 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  | 926.471 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             | 945.714 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 186.000 μs (5%) |         |  72.25 KiB (1%) |        3748 |
| `["missing_dot", "xf_nota"]`             | 186.000 μs (5%) |         |  72.11 KiB (1%) |        3742 |
| `["overhead", "foldl"]`                  |   3.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 161.018 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.668 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.719 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.740 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.189 ms (5%) |         |  49.63 KiB (1%) |          21 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
- `["cat"]`
- `["collect"]`
- `["dict"]`
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
- `["mapcat_eduction"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`
- `["set"]`

## Julia versioninfo
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      28068 s          0 s       1414 s      72822 s          0 s
       #2  2294 MHz      69884 s          0 s       2021 s      30489 s          0 s
       
  Memory: 6.764884948730469 GB (2778.53125 MB free)
  Uptime: 1043.0 sec
  Load Avg:  1.01513671875  1.02783203125  0.7841796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
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
    Model:               79
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz
    Stepping:            1
    CPU MHz:             2294.686
    BogoMIPS:            4589.37
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            51200K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Broadwell                                              |
| Model              | Family: 0x06, Model: 0x4f, Stepping: 0x01, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 44 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

