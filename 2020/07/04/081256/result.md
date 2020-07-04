# Benchmark result

* Pull request commit: [`293432167ee0fc6abc9cbb5dcf185986623c7cbe`](https://github.com/JuliaFolds/Transducers.jl/commit/293432167ee0fc6abc9cbb5dcf185986623c7cbe)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/334> (Use mergewith! in parallel tutorial)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Jul 2020 - 08:08
    - Baseline: 4 Jul 2020 - 08:12
* Package commits:
    - Target: 955d6b
    - Baseline: ccb36f
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
| `["collect", "identity-float"]`          | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.00 (5%)  | 0.99 (1%) :white_check_mark: |
| `["gemm", "mul", "man", "ivdep", "32"]`  |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "man"]`                 |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.13 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz      45024 s          0 s       1511 s     117754 s          0 s
       #2  2397 MHz      21046 s          0 s       1896 s     142192 s          0 s
       
  Memory: 6.764884948730469 GB (2906.3828125 MB free)
  Uptime: 1666.0 sec
  Load Avg:  1.080078125  0.92724609375  0.5546875
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
       #1  2397 MHz      53506 s          0 s       1673 s     134828 s          0 s
       #2  2397 MHz      38273 s          0 s       1980 s     150503 s          0 s
       
  Memory: 6.764884948730469 GB (2893.27734375 MB free)
  Uptime: 1925.0 sec
  Load Avg:  1.4580078125  1.099609375  0.7138671875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 8:8
* Package commit: 955d6b
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
| `["append!!", "eduction"]`               |  71.902 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  72.601 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.980 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.033 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 124.203 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  98.402 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 363.209 μs (5%) |         | 705.09 KiB (1%) |       16665 |
| `["dot", "blas"]`                        |   2.344 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.311 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.722 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.733 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  65.101 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 707.116 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 259.606 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 259.606 μs (5%) |         |                 |             |
| `["findall", "base"]`                    |   1.046 ms (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 948.424 μs (5%) |         |   3.01 MiB (1%) |       98531 |
| `["findall", "xf-iter"]`                 |   4.190 ms (5%) |         |   9.63 MiB (1%) |      299918 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.776 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.526 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.343 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.685 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.573 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 661.415 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.610 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.655 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.003 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.575 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.935 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.318 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.625 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 519.382 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.378 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.720 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 513.552 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.313 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   7.575 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 540.751 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.315 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.975 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 530.537 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.287 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.440 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 522.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.316 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.625 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 528.958 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 283.506 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 216.005 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 213.705 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.420 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.945 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.922 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.480 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.450 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.433 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.360 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.460 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 249.306 μs (5%) |         |  72.14 KiB (1%) |        3741 |
| `["missing_dot", "xf_nota"]`             | 241.206 μs (5%) |         |  72.02 KiB (1%) |        3735 |
| `["overhead", "foldl"]`                  |   6.300 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 216.828 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.190 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.341 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2397 MHz      45024 s          0 s       1511 s     117754 s          0 s
       #2  2397 MHz      21046 s          0 s       1896 s     142192 s          0 s
       
  Memory: 6.764884948730469 GB (2906.3828125 MB free)
  Uptime: 1666.0 sec
  Load Avg:  1.080078125  0.92724609375  0.5546875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 8:12
* Package commit: ccb36f
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
| `["append!!", "eduction"]`               |  70.901 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  71.602 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.990 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.033 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 122.403 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          | 105.903 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 365.508 μs (5%) |         | 704.72 KiB (1%) |       16639 |
| `["dot", "blas"]`                        |   2.333 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.322 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.722 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.722 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  66.401 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 713.516 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 259.605 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 259.605 μs (5%) |         |                 |             |
| `["findall", "base"]`                    |   1.048 ms (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 947.121 μs (5%) |         |   3.05 MiB (1%) |       99910 |
| `["findall", "xf-iter"]`                 |   4.164 ms (5%) |         |   9.63 MiB (1%) |      299916 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.811 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.568 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.374 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.694 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.424 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 673.914 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.879 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.705 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.006 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.429 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.408 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 600.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.425 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   7.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.429 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   8.500 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.399 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.432 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 295.706 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 230.905 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 227.505 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   1.410 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.922 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.900 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.480 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.370 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.400 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.410 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.460 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 248.806 μs (5%) |         |  72.17 KiB (1%) |        3745 |
| `["missing_dot", "xf_nota"]`             | 248.305 μs (5%) |         |  72.23 KiB (1%) |        3747 |
| `["overhead", "foldl"]`                  |   5.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 217.015 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.196 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.363 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2397 MHz      53506 s          0 s       1673 s     134828 s          0 s
       #2  2397 MHz      38273 s          0 s       1980 s     150503 s          0 s
       
  Memory: 6.764884948730469 GB (2893.27734375 MB free)
  Uptime: 1925.0 sec
  Load Avg:  1.4580078125  1.099609375  0.7138671875
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
    CPU MHz:             2397.220
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

