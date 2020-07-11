# Benchmark result

* Pull request commit: [`77922b1daacec54999cafe9227cfbb7b8644a9e1`](https://github.com/JuliaFolds/Transducers.jl/commit/77922b1daacec54999cafe9227cfbb7b8644a9e1)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/356> (Fix default basesize calculation with eduction)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 11 Jul 2020 - 21:00
    - Baseline: 11 Jul 2020 - 21:05
* Package commits:
    - Target: f9939a
    - Baseline: 062878
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
| `["append!!", "eduction"]`               | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["cat", "base"]`                        | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "filter-missing"]`          | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "identity-float"]`          | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "identity-union"]`          | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dot", "man"]`                         | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "man"]`             | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_reduce", "man"]`           | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_reduce", "xf"]`            | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["findall", "base"]`                    | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["findall", "xf-array"]`                | 0.92 (5%) :white_check_mark: |   1.01 (1%)  |
| `["findall", "xf-iter"]`                 | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.79 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`  | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.21 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.75 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "man"]`              | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "man"]`                 | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "rf"]`                  |                1.09 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "xf"]`                  | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["overhead", "reduce_basecase"]`        | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["partition_by", "man"]`                | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["partition_by", "xf"]`                 | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2294 MHz      53144 s          0 s       1468 s      13844 s          0 s
       #2  2294 MHz      12594 s          0 s       1720 s      53962 s          0 s
       
  Memory: 6.7648773193359375 GB (2712.78515625 MB free)
  Uptime: 701.0 sec
  Load Avg:  1.06640625  1.0498046875  0.68603515625
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
       #1  2294 MHz      78167 s          0 s       1612 s      16444 s          0 s
       #2  2294 MHz      15429 s          0 s       1870 s      78741 s          0 s
       
  Memory: 6.7648773193359375 GB (2650.21875 MB free)
  Uptime: 980.0 sec
  Load Avg:  1.02685546875  1.0771484375  0.81201171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 21:0
* Package commit: f9939a
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
| `["append!!", "eduction"]`               |  61.001 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  61.801 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.480 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.700 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  97.501 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  85.501 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 297.104 μs (5%) |         | 705.52 KiB (1%) |       16688 |
| `["dot", "blas"]`                        |   2.444 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.411 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.867 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.867 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  68.100 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 559.804 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 194.902 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 194.902 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 831.110 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 812.109 μs (5%) |         |   3.04 MiB (1%) |       99583 |
| `["findall", "xf-iter"]`                 |   3.361 ms (5%) |         |   9.63 MiB (1%) |      299929 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.638 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.972 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   8.272 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.299 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.373 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 662.305 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.962 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.633 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.380 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   4.057 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 316.525 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.635 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.775 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 386.572 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.547 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.520 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 394.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.681 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.550 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 339.336 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.697 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.825 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 418.182 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.618 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.060 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 363.054 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.710 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 407.040 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 215.801 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 169.702 μs (5%) |         | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 157.401 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.020 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.267 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.278 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.190 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 | 925.532 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.300 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.310 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.071 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 190.702 μs (5%) |         |  72.17 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 192.802 μs (5%) |         |  72.34 KiB (1%) |        3751 |
| `["overhead", "foldl"]`                  |   4.500 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 166.265 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.851 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.927 ms (5%) |         |   6.10 MiB (1%) |      200009 |

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
       #1  2294 MHz      53144 s          0 s       1468 s      13844 s          0 s
       #2  2294 MHz      12594 s          0 s       1720 s      53962 s          0 s
       
  Memory: 6.7648773193359375 GB (2712.78515625 MB free)
  Uptime: 701.0 sec
  Load Avg:  1.06640625  1.0498046875  0.68603515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 21:5
* Package commit: 062878
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
| `["append!!", "eduction"]`               |  64.701 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  64.201 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.770 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.780 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 104.801 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  96.400 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 341.902 μs (5%) |         | 705.20 KiB (1%) |       16670 |
| `["dot", "blas"]`                        |   2.500 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.544 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.978 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.978 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  74.500 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 629.404 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 219.301 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 212.702 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 956.006 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 884.406 μs (5%) |         |   3.01 MiB (1%) |       98681 |
| `["findall", "xf-iter"]`                 |   3.947 ms (5%) |         |   9.63 MiB (1%) |      299921 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.749 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   4.015 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   8.198 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.327 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.406 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 689.504 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.829 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.698 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.401 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   4.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.794 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   8.000 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.783 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   7.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.799 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   7.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.807 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.764 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.600 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.803 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 256.302 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 201.201 μs (5%) |         | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 209.401 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.200 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.389 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.367 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.370 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.017 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.443 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.200 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.221 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 207.601 μs (5%) |         |  72.22 KiB (1%) |        3746 |
| `["missing_dot", "xf_nota"]`             | 200.501 μs (5%) |         |  72.22 KiB (1%) |        3746 |
| `["overhead", "foldl"]`                  |   4.300 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 179.219 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.006 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.424 ms (5%) |         |   6.10 MiB (1%) |      200009 |

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
       #1  2294 MHz      78167 s          0 s       1612 s      16444 s          0 s
       #2  2294 MHz      15429 s          0 s       1870 s      78741 s          0 s
       
  Memory: 6.7648773193359375 GB (2650.21875 MB free)
  Uptime: 980.0 sec
  Load Avg:  1.02685546875  1.0771484375  0.81201171875
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
    CPU MHz:             2294.683
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

