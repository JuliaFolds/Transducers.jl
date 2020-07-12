# Benchmark result

* Pull request commit: [`d82f8a555e58ddaa9c3bbcb3fe157d7c20202e6f`](https://github.com/JuliaFolds/Transducers.jl/commit/d82f8a555e58ddaa9c3bbcb3fe157d7c20202e6f)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/363> (Re-transform iterator passed in Cat)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 08:09
    - Baseline: 12 Jul 2020 - 08:14
* Package commits:
    - Target: c4de78
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
| `["append!!", "eduction"]`               | 0.31 (5%) :white_check_mark: | 0.99 (1%) :white_check_mark: |
| `["append!!", "xf"]`                     | 0.30 (5%) :white_check_mark: | 0.96 (1%) :white_check_mark: |
| `["cat", "base"]`                        | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["cat", "xf"]`                          |                   1.01 (5%)  | 0.00 (1%) :white_check_mark: |
| `["collect", "filter-missing"]`          | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["dict", "xf"]`                         | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["dot", "blas"]`                        | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["dot", "rf"]`                          | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["dot", "xf"]`                          | 0.92 (5%) :white_check_mark: |                 Inf (1%) :x: |
| `["filter_map_reduce", "xf"]`            | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findall", "xf-iter"]`                 | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "16"]`     | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "2"]`      | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "8"]`      | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.84 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.23 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["mapcat_eduction", "xf-eduction"]`     | 0.00 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["mapcat_eduction", "xf-xf"]`           | 0.82 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["missing_dot", "equiv"]`               | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "man"]`                 | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "rf"]`                  | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["set", "xf"]`                          | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      14764 s          0 s       1446 s      59635 s          0 s
       #2  2294 MHz      56060 s          0 s       1850 s      18292 s          0 s
       
  Memory: 6.764884948730469 GB (2718.57421875 MB free)
  Uptime: 780.0 sec
  Load Avg:  1.08740234375  1.03076171875  0.68310546875
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
       #1  2294 MHz      21186 s          0 s       1562 s      83127 s          0 s
       #2  2294 MHz      79736 s          0 s       1988 s      24512 s          0 s
       
  Memory: 6.764884948730469 GB (2586.82421875 MB free)
  Uptime: 1082.0 sec
  Load Avg:  1.21923828125  1.09326171875  0.81982421875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 8:9
* Package commit: c4de78
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
| `["append!!", "eduction"]`               |  18.401 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  18.900 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.570 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.790 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          |  93.101 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  80.401 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 296.202 μs (5%) |         | 704.52 KiB (1%) |       16621 |
| `["dict", "base"]`                       |   4.077 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   3.822 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   2.256 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.411 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.667 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.763 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  73.000 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 578.603 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 206.401 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 195.001 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 851.105 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 781.505 μs (5%) |         |   3.05 MiB (1%) |       99925 |
| `["findall", "xf-iter"]`                 |   3.140 ms (5%) |         |   9.63 MiB (1%) |      299947 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.449 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.687 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   8.193 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.974 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.121 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 620.403 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.627 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.539 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.281 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   4.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 312.083 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.485 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 364.039 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.721 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.520 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 369.802 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.425 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.540 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 367.773 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.454 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.375 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 398.010 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.581 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.567 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 359.809 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.441 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 357.005 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 207.301 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 155.400 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 152.901 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.580 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.710 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.700 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              | 985.714 ns (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.333 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.344 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               | 993.478 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.130 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.286 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.054 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             | 983.333 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 196.201 μs (5%) |         |  72.11 KiB (1%) |        3738 |
| `["missing_dot", "xf_nota"]`             | 198.901 μs (5%) |         |  72.22 KiB (1%) |        3746 |
| `["overhead", "foldl"]`                  |   4.300 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 169.329 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.708 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.576 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.633 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.112 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      14764 s          0 s       1446 s      59635 s          0 s
       #2  2294 MHz      56060 s          0 s       1850 s      18292 s          0 s
       
  Memory: 6.764884948730469 GB (2718.57421875 MB free)
  Uptime: 780.0 sec
  Load Avg:  1.08740234375  1.03076171875  0.68310546875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 8:14
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
| `["append!!", "eduction"]`               |  58.800 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  62.001 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.710 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   1.770 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 101.700 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  82.500 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 310.201 μs (5%) |          | 705.48 KiB (1%) |       16686 |
| `["dict", "base"]`                       |   4.213 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.164 ms (5%) |          |  92.47 KiB (1%) |          26 |
| `["dot", "blas"]`                        |   2.544 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   2.511 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   2.978 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   3.000 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  73.101 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 587.402 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 212.601 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 206.401 μs (5%) |          |                 |             |
| `["findall", "base"]`                    | 848.103 μs (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 793.003 μs (5%) |          |   3.05 MiB (1%) |      100025 |
| `["findall", "xf-iter"]`                 |   3.454 ms (5%) |          |   9.63 MiB (1%) |      299932 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.769 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   4.022 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   8.430 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.392 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.532 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 665.303 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  11.105 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.678 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.355 ms (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   4.200 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.828 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   8.100 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.647 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.800 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 300.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.661 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   7.700 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.787 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   8.500 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.793 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.500 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.756 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   8.100 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 228.701 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 177.900 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 170.901 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.630 μs (5%) |          |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |  24.340 ms (5%) | 5.112 ms |  38.50 MiB (1%) |     1006479 |
| `["mapcat_eduction", "xf-xf"]`           |   2.080 μs (5%) |          |   48 bytes (1%) |           2 |
| `["missing_argmax", "man"]`              |   1.014 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.422 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.378 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.124 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.230 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.329 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.196 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.044 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 206.201 μs (5%) |          |  72.11 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 204.800 μs (5%) |          |  72.25 KiB (1%) |        3749 |
| `["overhead", "foldl"]`                  |   4.400 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 176.612 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.644 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.624 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   4.860 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.439 ms (5%) |          |  49.81 KiB (1%) |          29 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      21186 s          0 s       1562 s      83127 s          0 s
       #2  2294 MHz      79736 s          0 s       1988 s      24512 s          0 s
       
  Memory: 6.764884948730469 GB (2586.82421875 MB free)
  Uptime: 1082.0 sec
  Load Avg:  1.21923828125  1.09326171875  0.81982421875
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
    CPU MHz:             2294.684
    BogoMIPS:            4589.36
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

