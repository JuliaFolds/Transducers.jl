# Benchmark result

* Pull request commit: [`7ee68cdae889341d29db8668c26b5157a69f8c05`](https://github.com/JuliaFolds/Transducers.jl/commit/7ee68cdae889341d29db8668c26b5157a69f8c05)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/344> (Associative string-splitting transducer)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 9 Jul 2020 - 20:58
    - Baseline: 9 Jul 2020 - 21:03
* Package commits:
    - Target: 3b5316
    - Baseline: 31b233
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
| `["cat", "base"]`                        | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.00 (5%)  | 0.99 (1%) :white_check_mark: |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.80 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.81 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.80 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "xf"]`               |                1.29 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "xf"]`                  |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.08 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       6747 s          0 s       1494 s      62381 s          0 s
       #2  2095 MHz      57822 s          0 s       1690 s      11824 s          0 s
       
  Memory: 6.764884948730469 GB (2866.30859375 MB free)
  Uptime: 728.0 sec
  Load Avg:  1.10595703125  0.994140625  0.6201171875
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
       #1  2095 MHz       9246 s          0 s       1603 s      87822 s          0 s
       #2  2095 MHz      83314 s          0 s       1925 s      14145 s          0 s
       
  Memory: 6.764884948730469 GB (2749.3203125 MB free)
  Uptime: 1010.0 sec
  Load Avg:  1.03515625  1.0224609375  0.73974609375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 20:58
* Package commit: 3b5316
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
| `["append!!", "eduction"]`               |  74.407 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  75.107 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.167 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.467 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 136.712 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  95.309 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 386.136 μs (5%) |         | 705.36 KiB (1%) |       16680 |
| `["dot", "blas"]`                        |   1.500 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.490 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.667 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  62.504 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 934.751 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.622 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.423 μs (5%) |         |                 |             |
| `["findall", "base"]`                    |   1.030 ms (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 969.282 μs (5%) |         |   2.96 MiB (1%) |       96903 |
| `["findall", "xf-iter"]`                 |   4.303 ms (5%) |         |   9.63 MiB (1%) |      299940 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.297 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.955 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.302 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.131 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.613 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 596.334 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.424 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.362 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.110 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.750 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 307.191 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.942 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.550 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 620.272 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.974 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.986 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 478.487 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.955 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.684 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 499.515 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.944 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.584 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 484.724 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.989 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.729 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 453.838 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.925 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.240 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 604.585 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 320.218 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 247.213 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 238.713 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.213 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   4.000 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.830 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.730 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.200 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.730 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   2.060 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 270.620 μs (5%) |         |  72.09 KiB (1%) |        3738 |
| `["missing_dot", "xf_nota"]`             | 269.621 μs (5%) |         |  72.23 KiB (1%) |        3745 |
| `["overhead", "foldl"]`                  |   5.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 224.612 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.531 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.806 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       6747 s          0 s       1494 s      62381 s          0 s
       #2  2095 MHz      57822 s          0 s       1690 s      11824 s          0 s
       
  Memory: 6.764884948730469 GB (2866.30859375 MB free)
  Uptime: 728.0 sec
  Load Avg:  1.10595703125  0.994140625  0.6201171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 21:3
* Package commit: 31b233
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
| `["append!!", "eduction"]`               |  76.203 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  77.203 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.344 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.456 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 136.806 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  95.005 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 387.418 μs (5%) |         | 704.98 KiB (1%) |       16656 |
| `["dot", "blas"]`                        |   1.500 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.480 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  62.108 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 873.220 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.513 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.613 μs (5%) |         |                 |             |
| `["findall", "base"]`                    |   1.004 ms (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 969.545 μs (5%) |         |   2.99 MiB (1%) |       98017 |
| `["findall", "xf-iter"]`                 |   4.413 ms (5%) |         |   9.63 MiB (1%) |      299950 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.256 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   4.018 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.352 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.149 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.767 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 594.185 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.472 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.189 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.110 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   2.099 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 600.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   2.070 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   5.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   2.087 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.000 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   2.104 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.500 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 600.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   2.059 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   2.096 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 600.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 316.242 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 251.534 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 239.132 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   4.013 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.100 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.860 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.740 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.234 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.720 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   2.060 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 256.411 μs (5%) |         |  72.30 KiB (1%) |        3749 |
| `["missing_dot", "xf_nota"]`             | 250.611 μs (5%) |         |  72.13 KiB (1%) |        3739 |
| `["overhead", "foldl"]`                  |   5.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 226.433 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.537 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.826 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       9246 s          0 s       1603 s      87822 s          0 s
       #2  2095 MHz      83314 s          0 s       1925 s      14145 s          0 s
       
  Memory: 6.764884948730469 GB (2749.3203125 MB free)
  Uptime: 1010.0 sec
  Load Avg:  1.03515625  1.0224609375  0.73974609375
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
    CPU MHz:             2095.246
    BogoMIPS:            4190.49
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

