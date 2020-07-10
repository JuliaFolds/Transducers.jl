# Benchmark result

* Pull request commit: [`d01450138dece0d65ddf4873512f5575412d53ba`](https://github.com/JuliaFolds/Transducers.jl/commit/d01450138dece0d65ddf4873512f5575412d53ba)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/347> (Don't run doctest via docs/make.jl outside CI)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 10 Jul 2020 - 06:44
    - Baseline: 10 Jul 2020 - 06:48
* Package commits:
    - Target: 18f3d9
    - Baseline: 938217
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
| `["collect", "identity-float"]`          |                1.06 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              |                1.05 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     |                1.09 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  |                1.09 (5%) :x: |   1.00 (1%)  |
| `["missing_argmax", "man"]`              | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["overhead", "foldl"]`                  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["overhead", "reduce_basecase"]`        | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       7403 s          0 s       1414 s      60068 s          0 s
       #2  2294 MHz      54657 s          0 s       1628 s      12456 s          0 s
       
  Memory: 6.764884948730469 GB (2815.9765625 MB free)
  Uptime: 708.0 sec
  Load Avg:  1.0  0.95947265625  0.6044921875
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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      29226 s          0 s       1598 s      62032 s          0 s
       #2  2294 MHz      56773 s          0 s       1718 s      34274 s          0 s
       
  Memory: 6.764884948730469 GB (2757.9765625 MB free)
  Uptime: 949.0 sec
  Load Avg:  1.07080078125  1.015625  0.7158203125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 10 Jul 2020 - 6:44
* Package commit: 18f3d9
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
| `["append!!", "eduction"]`               |  53.500 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  54.101 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.500 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.550 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  88.301 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  71.600 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 268.202 μs (5%) |         | 705.41 KiB (1%) |       16685 |
| `["dot", "blas"]`                        |   2.256 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.244 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.656 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.656 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  66.701 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 534.703 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 194.901 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 194.901 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 788.806 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 705.605 μs (5%) |         |   3.04 MiB (1%) |       99584 |
| `["findall", "xf-iter"]`                 |   2.902 ms (5%) |         |   9.63 MiB (1%) |      299935 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.029 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.494 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.132 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.763 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.899 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 605.103 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.094 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.426 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.209 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 285.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.220 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 390.099 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.175 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.080 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 385.714 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.216 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   7.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 406.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.230 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.225 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 398.010 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.149 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.533 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 392.574 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.191 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 398.010 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 218.301 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 171.001 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 170.301 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              | 885.438 ns (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.111 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.111 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               | 919.231 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.045 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.057 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  | 875.000 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             | 941.304 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 188.001 μs (5%) |         |  71.98 KiB (1%) |        3737 |
| `["missing_dot", "xf_nota"]`             | 182.401 μs (5%) |         |  72.17 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   3.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 159.345 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.660 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.456 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       7403 s          0 s       1414 s      60068 s          0 s
       #2  2294 MHz      54657 s          0 s       1628 s      12456 s          0 s
       
  Memory: 6.764884948730469 GB (2815.9765625 MB free)
  Uptime: 708.0 sec
  Load Avg:  1.0  0.95947265625  0.6044921875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 10 Jul 2020 - 6:48
* Package commit: 938217
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
| `["append!!", "eduction"]`               |  53.500 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  53.400 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.480 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.550 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  87.300 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  67.701 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 263.801 μs (5%) |         | 705.39 KiB (1%) |       16684 |
| `["dot", "blas"]`                        |   2.244 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.244 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.656 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.656 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  64.501 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 533.502 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 194.900 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 194.900 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 759.603 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 705.703 μs (5%) |         |   3.05 MiB (1%) |       99767 |
| `["findall", "xf-iter"]`                 |   2.884 ms (5%) |         |   9.63 MiB (1%) |      299937 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.034 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.499 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.131 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.790 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.903 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 604.202 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.909 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.426 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.212 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.272 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.281 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.270 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.260 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.244 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.600 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.286 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 207.101 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 157.100 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 156.300 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              | 947.938 ns (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.133 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.100 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               | 915.385 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.000 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.043 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  | 873.214 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             | 923.913 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 183.400 μs (5%) |         |  72.34 KiB (1%) |        3753 |
| `["missing_dot", "xf_nota"]`             | 180.100 μs (5%) |         |  71.88 KiB (1%) |        3731 |
| `["overhead", "foldl"]`                  |   4.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 179.042 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.651 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.467 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      29226 s          0 s       1598 s      62032 s          0 s
       #2  2294 MHz      56773 s          0 s       1718 s      34274 s          0 s
       
  Memory: 6.764884948730469 GB (2757.9765625 MB free)
  Uptime: 949.0 sec
  Load Avg:  1.07080078125  1.015625  0.7158203125
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
    CPU MHz:             2294.688
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

