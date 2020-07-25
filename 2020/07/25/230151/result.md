# Benchmark result

* Pull request commit: [`5f515501135be5e671a4f28e8dc59d702d72a39e`](https://github.com/JuliaFolds/Transducers.jl/commit/5f515501135be5e671a4f28e8dc59d702d72a39e)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/371> (Modernize missing value tutorial)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 25 Jul 2020 - 22:56
    - Baseline: 25 Jul 2020 - 23:01
* Package commits:
    - Target: 2f7702
    - Baseline: 525658
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

| ID                                       | time ratio    | memory ratio  |
|------------------------------------------|---------------|---------------|
| `["append!!", "xf"]`                     | 1.05 (5%) :x: |    1.00 (1%)  |
| `["collect", "identity-float"]`          | 1.11 (5%) :x: |    1.00 (1%)  |
| `["findall", "xf-array"]`                | 1.07 (5%) :x: | 1.02 (1%) :x: |
| `["gemm", "mul", "man", "false", "8"]`   | 1.13 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 1.12 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 1.18 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 1.16 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 1.14 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 1.15 (5%) :x: |    1.00 (1%)  |
| `["missing_dot", "rf"]`                  | 1.05 (5%) :x: |    1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      12008 s          0 s       1207 s      58434 s          0 s
       #2  2394 MHz      55124 s          0 s       1433 s      14810 s          0 s
       
  Memory: 6.764884948730469 GB (2841.6875 MB free)
  Uptime: 733.0 sec
  Load Avg:  1.0009765625  0.97802734375  0.63330078125
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
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      13693 s          0 s       1256 s      83502 s          0 s
       #2  2394 MHz      80078 s          0 s       1569 s      16427 s          0 s
       
  Memory: 6.764884948730469 GB (2803.296875 MB free)
  Uptime: 1002.0 sec
  Load Avg:  1.15380859375  1.033203125  0.74755859375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 22:56
* Package commit: 2f7702
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
| `["append!!", "eduction"]`               |  19.900 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  19.700 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.730 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.033 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 108.102 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  91.000 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 320.603 μs (5%) |         | 705.05 KiB (1%) |       16660 |
| `["dict", "base"]`                       |   4.626 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.444 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   2.167 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.156 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.544 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.622 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  62.101 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 619.307 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 226.302 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 226.302 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 927.010 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 859.009 μs (5%) |         |   2.99 MiB (1%) |       97756 |
| `["findall", "xf-iter"]`                 |   3.476 ms (5%) |         |   9.63 MiB (1%) |      299938 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.485 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.344 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.933 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.470 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.081 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 632.107 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.510 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.605 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 940.210 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.325 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 285.277 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.180 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.640 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 453.305 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.169 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   5.967 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 448.490 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.057 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.600 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 471.434 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.066 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.780 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 463.964 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.040 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.450 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 455.843 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.067 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.660 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 460.919 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 248.103 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 183.002 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 183.002 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.720 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.978 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.980 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   1.240 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.544 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.567 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.350 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.154 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.729 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.250 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.300 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 213.902 μs (5%) |         |  72.31 KiB (1%) |        3747 |
| `["missing_dot", "xf_nota"]`             | 215.303 μs (5%) |         |  71.92 KiB (1%) |        3734 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 186.959 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.915 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.929 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.149 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.628 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      12008 s          0 s       1207 s      58434 s          0 s
       #2  2394 MHz      55124 s          0 s       1433 s      14810 s          0 s
       
  Memory: 6.764884948730469 GB (2841.6875 MB free)
  Uptime: 733.0 sec
  Load Avg:  1.0009765625  0.97802734375  0.63330078125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 23:1
* Package commit: 525658
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
| `["append!!", "eduction"]`               |  19.000 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  18.700 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.730 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.033 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 103.501 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  81.801 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 315.804 μs (5%) |         | 705.16 KiB (1%) |       16667 |
| `["dict", "base"]`                       |   4.431 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.378 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   2.167 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.156 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.533 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.611 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  61.301 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 619.307 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 226.302 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 226.302 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 915.911 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 802.709 μs (5%) |         |   2.94 MiB (1%) |       96260 |
| `["findall", "xf-iter"]`                 |   3.450 ms (5%) |         |   9.63 MiB (1%) |      299928 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.476 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.335 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.034 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.463 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.057 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 632.207 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.478 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.602 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 940.311 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.229 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.188 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   5.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.107 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.231 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.191 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.500 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.232 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.600 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 245.802 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 183.901 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 181.101 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.680 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.956 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.980 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   1.240 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.500 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.567 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.330 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.138 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.729 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.190 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.260 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 215.003 μs (5%) |         |  72.08 KiB (1%) |        3740 |
| `["missing_dot", "xf_nota"]`             | 216.302 μs (5%) |         |  72.11 KiB (1%) |        3738 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 185.219 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.925 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.862 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.139 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.577 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      13693 s          0 s       1256 s      83502 s          0 s
       #2  2394 MHz      80078 s          0 s       1569 s      16427 s          0 s
       
  Memory: 6.764884948730469 GB (2803.296875 MB free)
  Uptime: 1002.0 sec
  Load Avg:  1.15380859375  1.033203125  0.74755859375
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
    CPU MHz:             2394.455
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

