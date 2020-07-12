# Benchmark result

* Pull request commit: [`dd298a64ba3913c559e53fd71cfa4271572b924c`](https://github.com/JuliaFolds/Transducers.jl/commit/dd298a64ba3913c559e53fd71cfa4271572b924c)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/362> (Benchmark MapCat with eduction)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 07:16
    - Baseline: 12 Jul 2020 - 07:20
* Package commits:
    - Target: da44a6
    - Baseline: cbc633
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
| `["findall", "xf-array"]`                |                   1.00 (5%)  | 0.96 (1%) :white_check_mark: |
| `["gemm", "fusedmul", "xf", "32"]`       | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.18 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.20 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.14 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.21 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.22 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "reduce_basecase"]`        |                1.05 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      35021 s          0 s       1366 s      35696 s          0 s
       #2  2394 MHz      35685 s          0 s       1633 s      35714 s          0 s
       
  Memory: 6.764884948730469 GB (2784.01171875 MB free)
  Uptime: 744.0 sec
  Load Avg:  1.00244140625  0.97119140625  0.62255859375
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
       #1  2394 MHz      42876 s          0 s       1464 s      55645 s          0 s
       #2  2394 MHz      55803 s          0 s       1726 s      43415 s          0 s
       
  Memory: 6.764884948730469 GB (2701.26953125 MB free)
  Uptime: 1024.0 sec
  Load Avg:  1.0  0.99853515625  0.7333984375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:16
* Package commit: da44a6
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
| `["append!!", "eduction"]`               |  72.200 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  72.700 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.990 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   2.156 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 124.000 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          | 101.999 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 362.399 μs (5%) |          | 705.14 KiB (1%) |       16668 |
| `["dict", "base"]`                       |   5.100 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |  40.167 ms (5%) | 6.794 ms |  53.71 MiB (1%) |     1502541 |
| `["dot", "blas"]`                        |   2.344 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   2.322 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   2.722 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   2.722 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  65.699 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 711.698 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 259.899 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 259.899 μs (5%) |          |                 |             |
| `["findall", "base"]`                    |   1.058 ms (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 939.397 μs (5%) |          |   2.88 MiB (1%) |       94156 |
| `["findall", "xf-iter"]`                 |   3.915 ms (5%) |          |   9.63 MiB (1%) |      299926 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.828 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.559 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.498 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.707 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.504 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 696.298 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.659 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.658 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.005 ms (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.562 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 312.029 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.411 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.000 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 471.277 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.290 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.220 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 481.026 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.315 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.840 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 449.995 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.410 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.075 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 455.497 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.390 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.817 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 483.505 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.322 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.920 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 486.154 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 275.999 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 211.600 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 206.500 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.970 μs (5%) |          |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |  19.803 ms (5%) |          |  38.50 MiB (1%) |     1006479 |
| `["mapcat_eduction", "xf-xf"]`           |   2.733 μs (5%) |          |   48 bytes (1%) |           2 |
| `["missing_argmax", "man"]`              |   1.410 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.911 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.944 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.540 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.430 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.433 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.350 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.460 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 252.900 μs (5%) |          |  72.14 KiB (1%) |        3741 |
| `["missing_dot", "xf_nota"]`             | 248.900 μs (5%) |          |  72.34 KiB (1%) |        3752 |
| `["overhead", "foldl"]`                  |   5.599 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 223.818 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.196 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.328 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   5.843 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |  80.449 ms (5%) | 7.805 ms |  59.77 MiB (1%) |     1907785 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      35021 s          0 s       1366 s      35696 s          0 s
       #2  2394 MHz      35685 s          0 s       1633 s      35714 s          0 s
       
  Memory: 6.764884948730469 GB (2784.01171875 MB free)
  Uptime: 744.0 sec
  Load Avg:  1.00244140625  0.97119140625  0.62255859375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:20
* Package commit: cbc633
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
| `["append!!", "eduction"]`               |  73.900 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  73.099 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.980 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   2.055 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 122.899 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  99.199 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 369.898 μs (5%) |          | 705.39 KiB (1%) |       16682 |
| `["dict", "base"]`                       |   5.264 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |  39.931 ms (5%) | 6.551 ms |  53.71 MiB (1%) |     1502541 |
| `["dot", "blas"]`                        |   2.333 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   2.322 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   2.733 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   2.733 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  65.701 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 713.116 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 259.899 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 259.899 μs (5%) |          |                 |             |
| `["findall", "base"]`                    |   1.040 ms (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 940.897 μs (5%) |          |   3.01 MiB (1%) |       98447 |
| `["findall", "xf-iter"]`                 |   3.956 ms (5%) |          |   9.63 MiB (1%) |      299933 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.823 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.549 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.490 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.702 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.313 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 675.816 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  11.228 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.709 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.005 ms (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.699 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 299.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.451 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.100 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.330 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.300 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.441 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.900 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.425 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.100 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.315 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.900 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.348 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.999 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 306.806 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 232.004 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 223.105 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.420 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.911 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.933 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.500 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.370 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.417 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.360 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.450 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 250.400 μs (5%) |          |  72.08 KiB (1%) |        3741 |
| `["missing_dot", "xf_nota"]`             | 257.899 μs (5%) |          |  72.17 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   5.599 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 213.091 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.204 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.381 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   6.026 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |  77.731 ms (5%) | 7.481 ms |  59.77 MiB (1%) |     1907785 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2394 MHz      42876 s          0 s       1464 s      55645 s          0 s
       #2  2394 MHz      55803 s          0 s       1726 s      43415 s          0 s
       
  Memory: 6.764884948730469 GB (2701.26953125 MB free)
  Uptime: 1024.0 sec
  Load Avg:  1.0  0.99853515625  0.7333984375
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
    CPU MHz:             2394.453
    BogoMIPS:            4788.90
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

