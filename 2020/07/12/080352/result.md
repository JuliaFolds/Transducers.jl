# Benchmark result

* Pull request commit: [`0cdfa60d797c244404e448f5b3662000d70ca683`](https://github.com/JuliaFolds/Transducers.jl/commit/0cdfa60d797c244404e448f5b3662000d70ca683)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/363> (Re-transform iterator passed in Cat)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 07:58
    - Baseline: 12 Jul 2020 - 08:03
* Package commits:
    - Target: 1486af
    - Baseline: 36dfe5
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

| ID                                       | time ratio                   | memory ratio                 |
|------------------------------------------|------------------------------|------------------------------|
| `["append!!", "eduction"]`               | 0.33 (5%) :white_check_mark: | 0.99 (1%) :white_check_mark: |
| `["append!!", "xf"]`                     | 0.34 (5%) :white_check_mark: | 0.96 (1%) :white_check_mark: |
| `["cat", "xf"]`                          |                1.14 (5%) :x: | 0.00 (1%) :white_check_mark: |
| `["dot", "man"]`                         | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["dot", "xf"]`                          |                   1.03 (5%)  |                 Inf (1%) :x: |
| `["findall", "xf-array"]`                |                   1.02 (5%)  |                1.04 (1%) :x: |
| `["findall", "xf-iter"]`                 |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "2"]`      |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.29 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["mapcat_eduction", "base"]`            |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["mapcat_eduction", "xf-eduction"]`     | 0.00 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["mapcat_eduction", "xf-xf"]`           | 0.87 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["overhead", "foldl"]`                  | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["set", "base"]`                        | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |

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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      14432 s          0 s       1631 s      55297 s          0 s
       #2  2095 MHz      54356 s          0 s       1502 s      15780 s          0 s
       
  Memory: 6.764884948730469 GB (2663.74609375 MB free)
  Uptime: 735.0 sec
  Load Avg:  1.0  0.9716796875  0.6201171875
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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      14694 s          0 s       1712 s      85076 s          0 s
       #2  2095 MHz      84258 s          0 s       1668 s      15904 s          0 s
       
  Memory: 6.764884948730469 GB (2656.14453125 MB free)
  Uptime: 1038.0 sec
  Load Avg:  1.06884765625  1.041015625  0.76708984375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:58
* Package commit: 1486af
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
| `["append!!", "eduction"]`               |  22.301 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  23.701 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.930 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.378 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 121.602 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  88.701 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 365.207 μs (5%) |         | 705.13 KiB (1%) |       16665 |
| `["dict", "base"]`                       |   4.756 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.818 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.380 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.320 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.389 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.489 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  59.301 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 839.409 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 256.004 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 255.904 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 950.116 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 926.415 μs (5%) |         |   3.05 MiB (1%) |       99983 |
| `["findall", "xf-iter"]`                 |   3.974 ms (5%) |         |   9.63 MiB (1%) |      299930 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.083 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.757 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.972 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.963 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.350 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 484.505 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.781 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.295 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 993.314 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.313 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 270.630 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.973 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.450 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 425.633 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.875 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.443 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 425.633 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.896 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.517 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 545.223 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.914 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 429.653 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.899 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 503.114 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.898 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.450 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 422.618 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 285.802 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 205.302 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 213.202 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.222 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.133 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.244 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.978 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.889 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.600 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.680 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.530 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.517 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.520 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.670 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 231.903 μs (5%) |         |  72.05 KiB (1%) |        3739 |
| `["missing_dot", "xf_nota"]`             | 238.704 μs (5%) |         |  71.78 KiB (1%) |        3728 |
| `["overhead", "foldl"]`                  |   5.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 202.939 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.353 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.590 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.629 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.215 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      14432 s          0 s       1631 s      55297 s          0 s
       #2  2095 MHz      54356 s          0 s       1502 s      15780 s          0 s
       
  Memory: 6.764884948730469 GB (2663.74609375 MB free)
  Uptime: 735.0 sec
  Load Avg:  1.0  0.9716796875  0.6201171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 8:3
* Package commit: 36dfe5
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

| ID                                       | time            | GC time  | memory          | allocations |
|------------------------------------------|----------------:|---------:|----------------:|------------:|
| `["append!!", "eduction"]`               |  68.501 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  70.000 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.920 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   2.078 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 123.601 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  91.400 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 357.103 μs (5%) |          | 705.34 KiB (1%) |       16681 |
| `["dict", "base"]`                       |   4.686 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.931 ms (5%) |          |  92.47 KiB (1%) |          26 |
| `["dot", "blas"]`                        |   1.430 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   1.420 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   2.389 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   2.422 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  58.401 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 847.416 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 255.602 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 256.102 μs (5%) |          |                 |             |
| `["findall", "base"]`                    | 980.509 μs (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 912.208 μs (5%) |          |   2.94 MiB (1%) |       96202 |
| `["findall", "xf-iter"]`                 |   3.774 ms (5%) |          |   9.63 MiB (1%) |      299947 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.990 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.564 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.141 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.921 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.038 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 582.611 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.418 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.548 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 994.709 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.869 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.800 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.913 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.300 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.877 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.500 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 600.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.873 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.200 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.872 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.500 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 500.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.860 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.400 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 274.405 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 217.804 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 212.004 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.078 μs (5%) |          |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |  23.937 ms (5%) | 4.416 ms |  38.50 MiB (1%) |     1006479 |
| `["mapcat_eduction", "xf-xf"]`           |   2.578 μs (5%) |          |   48 bytes (1%) |           2 |
| `["missing_argmax", "man"]`              |   2.978 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.922 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.612 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.680 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.560 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.467 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.510 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.680 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 238.202 μs (5%) |          |  72.20 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 236.102 μs (5%) |          |  72.09 KiB (1%) |        3741 |
| `["overhead", "foldl"]`                  |   6.000 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 206.068 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.329 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.534 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   5.964 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.044 ms (5%) |          |  49.81 KiB (1%) |          29 |

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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      14694 s          0 s       1712 s      85076 s          0 s
       #2  2095 MHz      84258 s          0 s       1668 s      15904 s          0 s
       
  Memory: 6.764884948730469 GB (2656.14453125 MB free)
  Uptime: 1038.0 sec
  Load Avg:  1.06884765625  1.041015625  0.76708984375
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
    CPU MHz:             2095.078
    BogoMIPS:            4190.15
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

