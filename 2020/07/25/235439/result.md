# Benchmark result

* Pull request commit: [`4b07c10a16e3dc975a24840abe6ae1394f330a97`](https://github.com/JuliaFolds/Transducers.jl/commit/4b07c10a16e3dc975a24840abe6ae1394f330a97)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/371> (Modernize missing value tutorial)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 25 Jul 2020 - 23:49
    - Baseline: 25 Jul 2020 - 23:54
* Package commits:
    - Target: 6e3db4
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

| ID                                       | time ratio                   | memory ratio |
|------------------------------------------|------------------------------|--------------|
| `["cat", "base"]`                        |                1.07 (5%) :x: |   1.00 (1%)  |
| `["cat", "xf"]`                          |                1.15 (5%) :x: |   1.00 (1%)  |
| `["collect", "filter-missing"]`          | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "identity-float"]`          | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.07 (5%) :x: |   1.00 (1%)  |
| `["findall", "base"]`                    | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["findall", "xf-array"]`                | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "32"]`     | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       |                1.13 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.07 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.36 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.76 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |                1.16 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.26 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   |                1.07 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.07 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              |                1.09 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     |                1.12 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  |                1.13 (5%) :x: |   1.00 (1%)  |
| `["mapcat_eduction", "base"]`            |                1.16 (5%) :x: |   1.00 (1%)  |
| `["mapcat_eduction", "xf-eduction"]`     |                1.15 (5%) :x: |   1.00 (1%)  |
| `["mapcat_eduction", "xf-xf"]`           |                1.07 (5%) :x: |   1.00 (1%)  |
| `["missing_argmax", "man"]`              |                1.15 (5%) :x: |   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.70 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "xf"]`               |                1.10 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "man"]`                 |                1.10 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "rf"]`                  |                1.11 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.20 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "xf"]`                  |                1.13 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.14 (5%) :x: |   1.00 (1%)  |
| `["overhead", "reduce_basecase"]`        | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["partition_by", "xf"]`                 |                1.07 (5%) :x: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      51615 s          0 s       1435 s      17671 s          0 s
       #2  2095 MHz      15877 s          0 s       1688 s      54326 s          0 s
       
  Memory: 6.765071868896484 GB (2794.74609375 MB free)
  Uptime: 731.0 sec
  Load Avg:  1.0  1.0  0.65966796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

### Baseline
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      73409 s          0 s       1520 s      24017 s          0 s
       #2  2095 MHz      22283 s          0 s       1766 s      76088 s          0 s
       
  Memory: 6.765071868896484 GB (2783.13671875 MB free)
  Uptime: 1015.0 sec
  Load Avg:  1.0  1.0  0.7587890625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 23:49
* Package commit: 6e3db4
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
| `["append!!", "eduction"]`               |  17.600 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  18.300 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.930 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.200 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 108.401 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  77.600 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 318.903 μs (5%) |         | 704.95 KiB (1%) |       16656 |
| `["dict", "base"]`                       |   3.930 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.056 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.220 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.300 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.111 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.456 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  56.500 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 734.704 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 223.401 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 223.301 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 826.206 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 799.605 μs (5%) |         |   3.03 MiB (1%) |       99061 |
| `["findall", "xf-iter"]`                 |   3.455 ms (5%) |         |   9.63 MiB (1%) |      299930 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.222 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.207 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.297 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.339 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.357 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 579.303 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.306 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.015 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 987.506 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.325 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 273.899 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.519 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 370.854 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.546 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.357 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 426.131 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.568 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.417 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 545.213 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.531 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 378.788 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.557 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 503.114 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.747 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.117 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 428.643 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 272.201 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 197.601 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 205.301 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.080 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.100 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.240 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.978 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.500 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.112 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.620 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.450 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.517 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.510 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.700 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 230.802 μs (5%) |         |  72.20 KiB (1%) |        3744 |
| `["missing_dot", "xf_nota"]`             | 232.002 μs (5%) |         |  72.17 KiB (1%) |        3744 |
| `["overhead", "foldl"]`                  |   5.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 185.595 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.020 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.198 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.344 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.681 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      51615 s          0 s       1435 s      17671 s          0 s
       #2  2095 MHz      15877 s          0 s       1688 s      54326 s          0 s
       
  Memory: 6.765071868896484 GB (2794.74609375 MB free)
  Uptime: 731.0 sec
  Load Avg:  1.0  1.0  0.65966796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 23:54
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
| `["append!!", "eduction"]`               |  17.900 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  17.800 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.810 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.911 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 121.000 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  82.200 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 310.501 μs (5%) |         | 705.28 KiB (1%) |       16677 |
| `["dict", "base"]`                       |   3.930 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.055 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.180 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.250 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.133 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.444 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  59.000 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 686.804 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 223.001 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 222.901 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 897.804 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 888.004 μs (5%) |         |   3.03 MiB (1%) |       99061 |
| `["findall", "xf-iter"]`                 |   3.420 ms (5%) |         |   9.63 MiB (1%) |      299923 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.308 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.221 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.770 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.221 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.732 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 594.502 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.984 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.279 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 875.803 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.645 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.620 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.634 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.641 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.614 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.628 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 248.601 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 177.200 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 181.601 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.800 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.830 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.090 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.600 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.567 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.837 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.870 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.320 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.450 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.360 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 204.700 μs (5%) |         |  72.27 KiB (1%) |        3748 |
| `["missing_dot", "xf_nota"]`             | 202.701 μs (5%) |         |  72.13 KiB (1%) |        3742 |
| `["overhead", "foldl"]`                  |   5.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 201.358 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.967 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.996 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.169 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.491 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      73409 s          0 s       1520 s      24017 s          0 s
       #2  2095 MHz      22283 s          0 s       1766 s      76088 s          0 s
       
  Memory: 6.765071868896484 GB (2783.13671875 MB free)
  Uptime: 1015.0 sec
  Load Avg:  1.0  1.0  0.7587890625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
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
    Model:               85
    Model name:          Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    Stepping:            4
    CPU MHz:             2095.073
    BogoMIPS:            4190.14
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            1024K
    L3 cache:            36608K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x04, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 44 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

