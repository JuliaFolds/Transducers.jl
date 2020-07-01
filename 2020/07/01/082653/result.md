# Benchmark result

* Pull request commit: [`ad319fbb6102d91fd5df384e336b2957835d190a`](https://github.com/JuliaFolds/Transducers.jl/commit/ad319fbb6102d91fd5df384e336b2957835d190a)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 08:22
    - Baseline: 1 Jul 2020 - 08:26
* Package commits:
    - Target: ee9ff6
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
| `["cat", "base"]`                        |                1.15 (5%) :x: |    1.00 (1%)  |
| `["collect", "identity-union"]`          | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["dot", "blas"]`                        | 0.87 (5%) :white_check_mark: |    1.00 (1%)  |
| `["dot", "man"]`                         | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.16 (5%) :x: |    1.00 (1%)  |
| `["filter_map_reduce", "man"]`           | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findall", "xf-array"]`                |                1.06 (5%) :x: | 1.01 (1%) :x: |
| `["gemm", "fusedmul", "xf", "2"]`        |                1.06 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       |                1.06 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         |                1.12 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.13 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.16 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   |                1.07 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.22 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.18 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.19 (5%) :x: |    1.00 (1%)  |
| `["groupby", "sum", "sac"]`              |                1.07 (5%) :x: |    1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  |                1.14 (5%) :x: |    1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.87 (5%) :white_check_mark: |    1.00 (1%)  |
| `["missing_argmax", "xf"]`               | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["missing_dot", "man"]`                 | 0.89 (5%) :white_check_mark: |    1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.19 (5%) :x: |    1.00 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.08 (5%) :x: |    1.00 (1%)  |
| `["overhead", "foldl"]`                  | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["partition_by", "xf"]`                 | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      21994 s          0 s       1947 s      88645 s          0 s
       #2  2294 MHz      44492 s          0 s       1726 s      66247 s          0 s
       
  Memory: 6.764884948730469 GB (2997.52734375 MB free)
  Uptime: 1143.0 sec
  Load Avg:  1.08251953125  0.97265625  0.603515625
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
       #1  2294 MHz      23980 s          0 s       2068 s     113044 s          0 s
       #2  2294 MHz      69089 s          0 s       1870 s      68049 s          0 s
       
  Memory: 6.764884948730469 GB (2932.5546875 MB free)
  Uptime: 1410.0 sec
  Load Avg:  1.12060546875  1.0302734375  0.7294921875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 8:22
* Package commit: ee9ff6
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
| `["cat", "base"]`                        |   1.890 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.840 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 112.600 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  93.100 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 321.201 μs (5%) |         | 704.86 KiB (1%) |       16650 |
| `["dot", "blas"]`                        |   2.300 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.300 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.667 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.867 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  73.600 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 678.402 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 219.300 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 226.400 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 961.303 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 907.303 μs (5%) |         |   3.05 MiB (1%) |       99987 |
| `["findall", "xf-iter"]`                 |   3.704 ms (5%) |         |   9.63 MiB (1%) |      299917 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.853 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   4.172 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   8.952 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.383 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.443 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 674.002 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  11.025 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.696 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.400 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   4.314 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 335.747 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.796 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   8.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 453.333 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.705 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 462.564 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.758 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   8.367 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 487.435 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.798 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.833 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 480.311 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.712 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.540 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 472.539 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.814 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.833 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 477.949 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 255.801 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 197.300 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 201.301 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.160 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.344 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.511 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.310 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.270 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.900 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.290 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.460 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 229.400 μs (5%) |         |  72.19 KiB (1%) |        3747 |
| `["missing_dot", "xf_nota"]`             | 228.201 μs (5%) |         |  71.91 KiB (1%) |        3733 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 186.384 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.127 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.067 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      21994 s          0 s       1947 s      88645 s          0 s
       #2  2294 MHz      44492 s          0 s       1726 s      66247 s          0 s
       
  Memory: 6.764884948730469 GB (2997.52734375 MB free)
  Uptime: 1143.0 sec
  Load Avg:  1.08251953125  0.97265625  0.603515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 8:26
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
| `["cat", "base"]`                        |   1.640 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.840 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 112.300 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  95.600 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 341.901 μs (5%) |         | 705.20 KiB (1%) |       16672 |
| `["dot", "blas"]`                        |   2.633 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.511 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.867 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  70.800 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 587.002 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 233.900 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 219.301 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 919.003 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 852.303 μs (5%) |         |   3.01 MiB (1%) |       98615 |
| `["findall", "xf-iter"]`                 |   3.754 ms (5%) |         |   9.63 MiB (1%) |      299921 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.735 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   4.007 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   8.530 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.347 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.679 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 633.102 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  11.017 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.683 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.319 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   4.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.830 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.811 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.600 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.822 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   7.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.813 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.780 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.400 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.821 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 238.300 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 201.300 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 177.201 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.190 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.700 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.644 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.410 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.430 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.886 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.320 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.230 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 219.400 μs (5%) |         |  72.17 KiB (1%) |        3741 |
| `["missing_dot", "xf_nota"]`             | 210.801 μs (5%) |         |  71.94 KiB (1%) |        3735 |
| `["overhead", "foldl"]`                  |   5.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 181.242 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.191 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.382 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      23980 s          0 s       2068 s     113044 s          0 s
       #2  2294 MHz      69089 s          0 s       1870 s      68049 s          0 s
       
  Memory: 6.764884948730469 GB (2932.5546875 MB free)
  Uptime: 1410.0 sec
  Load Avg:  1.12060546875  1.0302734375  0.7294921875
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
    CPU MHz:             2294.685
    BogoMIPS:            4589.37
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            51200K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt
    

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

