# Benchmark result

* Pull request commit: [`3dfed970f9f3f353afce5190e1d0d3edc05f4c36`](https://github.com/JuliaFolds/Transducers.jl/commit/3dfed970f9f3f353afce5190e1d0d3edc05f4c36)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/325> (Benchmark and test append!!(dest, src::Eduction))

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 2 Jul 2020 - 02:26
    - Baseline: 2 Jul 2020 - 02:30
* Package commits:
    - Target: f1358c
    - Baseline: 6b039c
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
| `["cat", "xf"]`                          |                1.06 (5%) :x: |    1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.00 (5%)  | 1.02 (1%) :x: |
| `["findall", "xf-iter"]`                 |                1.08 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.88 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.80 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`  | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.89 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.90 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.33 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.89 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |
| `["missing_dot", "man"]`                 | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.13 (5%) :x: |    1.00 (1%)  |

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
       #1  2397 MHz      18544 s          0 s       1296 s      48393 s          0 s
       #2  2397 MHz      46618 s          0 s       1734 s      20282 s          0 s
       
  Memory: 6.764884948730469 GB (2953.33203125 MB free)
  Uptime: 705.0 sec
  Load Avg:  1.01220703125  1.01171875  0.6767578125
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
       #1  2397 MHz      21512 s          0 s       1402 s      70218 s          0 s
       #2  2397 MHz      68528 s          0 s       1856 s      23087 s          0 s
       
  Memory: 6.764884948730469 GB (2971.87890625 MB free)
  Uptime: 955.0 sec
  Load Avg:  1.06689453125  1.015625  0.76806640625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 2:26
* Package commit: f1358c
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
| `["append!!", "eduction"]`               | 154.810 μs (5%) |         | 264.59 KiB (1%) |        5030 |
| `["append!!", "xf"]`                     |  77.705 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.980 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.122 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 121.207 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  98.306 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 371.321 μs (5%) |         | 704.70 KiB (1%) |       16640 |
| `["dot", "blas"]`                        |   2.322 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.322 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.722 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.733 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  64.403 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 712.823 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 259.612 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 259.612 μs (5%) |         |                 |             |
| `["findall", "base"]`                    |   1.049 ms (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 944.548 μs (5%) |         |   3.05 MiB (1%) |       99983 |
| `["findall", "xf-iter"]`                 |   4.174 ms (5%) |         |   9.63 MiB (1%) |      299903 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.816 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.543 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.519 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.720 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.324 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 687.123 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  11.121 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.642 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.005 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.588 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 306.036 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.448 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.980 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 477.061 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.317 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.280 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 464.995 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.342 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.820 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 451.530 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.344 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 530.743 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.420 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.817 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 490.790 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.445 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.020 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 495.381 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 277.409 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 214.207 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 208.806 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.410 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.889 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.933 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.550 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.360 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.434 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.360 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.460 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 253.211 μs (5%) |         |  72.31 KiB (1%) |        3746 |
| `["missing_dot", "xf_nota"]`             | 249.111 μs (5%) |         |  71.89 KiB (1%) |        3731 |
| `["overhead", "foldl"]`                  |   6.300 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 218.890 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.208 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.375 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz      18544 s          0 s       1296 s      48393 s          0 s
       #2  2397 MHz      46618 s          0 s       1734 s      20282 s          0 s
       
  Memory: 6.764884948730469 GB (2953.33203125 MB free)
  Uptime: 705.0 sec
  Load Avg:  1.01220703125  1.01171875  0.6767578125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 2:30
* Package commit: 6b039c
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
| `["cat", "base"]`                        |   1.980 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.011 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 124.603 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          | 102.803 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 369.010 μs (5%) |         | 705.41 KiB (1%) |       16685 |
| `["dot", "blas"]`                        |   2.333 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.311 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.722 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.722 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  66.201 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 710.218 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 259.606 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 259.607 μs (5%) |         |                 |             |
| `["findall", "base"]`                    |   1.044 ms (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 946.726 μs (5%) |         |   2.99 MiB (1%) |       97918 |
| `["findall", "xf-iter"]`                 |   3.852 ms (5%) |         |   9.63 MiB (1%) |      299908 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.788 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.533 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.474 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.677 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.454 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 663.116 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.686 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.652 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.004 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   4.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.313 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 600.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.381 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.303 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   7.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.309 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.274 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.500 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.307 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 283.507 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 216.405 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 212.706 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.420 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.922 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.911 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.560 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.440 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.433 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.400 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 242.807 μs (5%) |         |  72.19 KiB (1%) |        3745 |
| `["missing_dot", "xf_nota"]`             | 237.906 μs (5%) |         |  72.05 KiB (1%) |        3739 |
| `["overhead", "foldl"]`                  |   5.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 219.819 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.206 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.367 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2397 MHz      21512 s          0 s       1402 s      70218 s          0 s
       #2  2397 MHz      68528 s          0 s       1856 s      23087 s          0 s
       
  Memory: 6.764884948730469 GB (2971.87890625 MB free)
  Uptime: 955.0 sec
  Load Avg:  1.06689453125  1.015625  0.76806640625
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
    CPU MHz:             2397.221
    BogoMIPS:            4794.44
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

