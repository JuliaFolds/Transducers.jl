# Benchmark result

* Pull request commit: [`139b6a2ff5d6bdb0a0795a18997d8c0c6f67550a`](https://github.com/JuliaFolds/Transducers.jl/commit/139b6a2ff5d6bdb0a0795a18997d8c0c6f67550a)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/363> (Re-transform iterator passed in Cat)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 07:18
    - Baseline: 12 Jul 2020 - 07:22
* Package commits:
    - Target: b596c4
    - Baseline: dd298a
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
| `["append!!", "eduction"]`               | 0.32 (5%) :white_check_mark: | 0.99 (1%) :white_check_mark: |
| `["append!!", "xf"]`                     | 0.33 (5%) :white_check_mark: | 0.96 (1%) :white_check_mark: |
| `["cat", "xf"]`                          |                1.07 (5%) :x: | 0.00 (1%) :white_check_mark: |
| `["collect", "filter-missing"]`          |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["dict", "xf"]`                         | 0.54 (5%) :white_check_mark: | 0.72 (1%) :white_check_mark: |
| `["dot", "blas"]`                        |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["dot", "rf"]`                          |                1.16 (5%) :x: |                   1.00 (1%)  |
| `["dot", "xf"]`                          |                   1.02 (5%)  |                 Inf (1%) :x: |
| `["filter_map_map!", "xf"]`              | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["filter_map_reduce", "xf"]`            |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["findall", "base"]`                    | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.01 (5%)  | 0.98 (1%) :white_check_mark: |
| `["findall", "xf-iter"]`                 | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "2"]`      |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.72 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        |                1.17 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       | 0.78 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.78 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.80 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     |                1.14 (5%) :x: |                   1.00 (1%)  |
| `["mapcat_eduction", "base"]`            | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["mapcat_eduction", "xf-eduction"]`     | 0.00 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["mapcat_eduction", "xf-xf"]`           | 0.83 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["missing_dot", "man"]`                 |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "xf"]`                  |                1.22 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.17 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "reduce_basecase"]`        | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["set", "base"]`                        |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["set", "xf"]`                          | 0.83 (5%) :white_check_mark: | 0.97 (1%) :white_check_mark: |

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
       #1  2095 MHz      36117 s          0 s       1673 s      33046 s          0 s
       #2  2095 MHz      31482 s          0 s       1806 s      37498 s          0 s
       
  Memory: 6.764884948730469 GB (2840.33984375 MB free)
  Uptime: 728.0 sec
  Load Avg:  1.0  0.99853515625  0.6591796875
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
       #1  2095 MHz      42020 s          0 s       1820 s      56739 s          0 s
       #2  2095 MHz      55390 s          0 s       1959 s      43188 s          0 s
       
  Memory: 6.764884948730469 GB (2597.02734375 MB free)
  Uptime: 1027.0 sec
  Load Avg:  1.0185546875  1.0087890625  0.76953125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:18
* Package commit: b596c4
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
| `["append!!", "eduction"]`               |  21.602 μs (5%) |          |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  21.302 μs (5%) |          |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.930 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   2.200 μs (5%) |          |                 |             |
| `["collect", "filter-missing"]`          | 120.210 μs (5%) |          | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  84.708 μs (5%) |          | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 299.828 μs (5%) |          | 705.16 KiB (1%) |       16669 |
| `["dict", "base"]`                       |   4.511 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |  20.994 ms (5%) |          |  38.40 MiB (1%) |     1001040 |
| `["dot", "blas"]`                        |   1.440 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   1.420 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   2.434 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   2.200 μs (5%) |          |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  57.603 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 669.435 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 242.619 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 255.721 μs (5%) |          |                 |             |
| `["findall", "base"]`                    | 836.173 μs (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 864.973 μs (5%) |          |   3.00 MiB (1%) |       98314 |
| `["findall", "xf-iter"]`                 |   3.638 ms (5%) |          |   9.63 MiB (1%) |      299913 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.614 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.566 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.654 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.793 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   3.886 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 571.632 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.023 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.533 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 875.863 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.900 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 239.067 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.902 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.133 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 422.141 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.815 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.214 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 423.648 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.883 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.100 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 483.621 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.847 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.117 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 419.121 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.783 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.057 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 408.699 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.879 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.217 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 421.633 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 306.015 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 213.811 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 198.310 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.845 μs (5%) |          |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.133 μs (5%) |          |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.134 μs (5%) |          |                 |             |
| `["missing_argmax", "man"]`              |   2.975 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.878 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.845 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.580 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.520 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.284 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.520 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.480 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 243.819 μs (5%) |          |  72.13 KiB (1%) |        3742 |
| `["missing_dot", "xf_nota"]`             | 232.718 μs (5%) |          |  72.02 KiB (1%) |        3736 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 180.253 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.310 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.429 ms (5%) |          |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.650 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |  65.366 ms (5%) | 6.718 ms |  57.94 MiB (1%) |     1787979 |

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
       #1  2095 MHz      36117 s          0 s       1673 s      33046 s          0 s
       #2  2095 MHz      31482 s          0 s       1806 s      37498 s          0 s
       
  Memory: 6.764884948730469 GB (2840.33984375 MB free)
  Uptime: 728.0 sec
  Load Avg:  1.0  0.99853515625  0.6591796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:22
* Package commit: dd298a
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
| `["append!!", "eduction"]`               |  67.903 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  64.503 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.930 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   2.056 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 111.505 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  85.504 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 312.314 μs (5%) |          | 704.95 KiB (1%) |       16654 |
| `["dict", "base"]`                       |   4.645 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |  38.645 ms (5%) | 5.762 ms |  53.71 MiB (1%) |     1502541 |
| `["dot", "blas"]`                        |   1.330 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   1.410 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   2.089 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   2.156 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  59.106 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 754.374 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 244.310 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 226.610 μs (5%) |          |                 |             |
| `["findall", "base"]`                    | 897.539 μs (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 858.137 μs (5%) |          |   3.06 MiB (1%) |      100074 |
| `["findall", "xf-iter"]`                 |   3.830 ms (5%) |          |   9.63 MiB (1%) |      299921 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.683 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.365 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.906 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.636 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.387 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 489.220 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.299 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.743 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 930.440 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.700 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.876 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.600 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.757 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.301 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.720 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.200 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.769 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.600 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.744 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.300 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.733 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.300 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 271.826 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 187.618 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 206.420 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.078 μs (5%) |          |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |  23.149 ms (5%) | 4.506 ms |  38.50 MiB (1%) |     1006479 |
| `["mapcat_eduction", "xf-xf"]`           |   2.578 μs (5%) |          |   48 bytes (1%) |           2 |
| `["missing_argmax", "man"]`              |   2.975 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.767 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.911 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.620 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.340 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.250 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.500 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.610 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 199.508 μs (5%) |          |  72.13 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 198.308 μs (5%) |          |  71.84 KiB (1%) |        3731 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 200.601 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.209 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.303 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   5.241 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |  78.344 ms (5%) | 6.929 ms |  59.77 MiB (1%) |     1907785 |

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
       #1  2095 MHz      42020 s          0 s       1820 s      56739 s          0 s
       #2  2095 MHz      55390 s          0 s       1959 s      43188 s          0 s
       
  Memory: 6.764884948730469 GB (2597.02734375 MB free)
  Uptime: 1027.0 sec
  Load Avg:  1.0185546875  1.0087890625  0.76953125
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
    CPU MHz:             2095.197
    BogoMIPS:            4190.39
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            1024K
    L3 cache:            36608K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves
    

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

