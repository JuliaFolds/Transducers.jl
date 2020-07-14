# Benchmark result

* Pull request commit: [`d976a871296f383f80472ea2e858185f956f3948`](https://github.com/JuliaFolds/Transducers.jl/commit/d976a871296f383f80472ea2e858185f956f3948)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 14 Jul 2020 - 00:45
    - Baseline: 14 Jul 2020 - 00:50
* Package commits:
    - Target: 0eff41
    - Baseline: 7c47b9
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
| `["filter_map_map!", "man"]`             | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         |                1.22 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.38 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.70 (5%) :white_check_mark: | 0.50 (1%) :white_check_mark: |
| `["mapcat_eduction", "xf-eduction"]`     | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["mapcat_eduction", "xf-xf"]`           | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "man"]`                 |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "rf"]`                  | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["set", "base"]`                        |                1.05 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       6153 s          0 s       1122 s     107098 s          0 s
       #2  2593 MHz      55167 s          0 s       1751 s      59045 s          0 s
       
  Memory: 6.791385650634766 GB (2947.046875 MB free)
  Uptime: 1170.0 sec
  Load Avg:  1.0  0.9150390625  0.56982421875
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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      32810 s          0 s       1330 s     110140 s          0 s
       #2  2593 MHz      58074 s          0 s       1926 s      85778 s          0 s
       
  Memory: 6.791385650634766 GB (2894.08984375 MB free)
  Uptime: 1469.0 sec
  Load Avg:  1.01171875  0.9990234375  0.71044921875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 14 Jul 2020 - 0:45
* Package commit: 0eff41
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
| `["append!!", "eduction"]`               |  18.300 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  18.501 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.850 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.356 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 110.602 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  75.901 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 307.602 μs (5%) |         | 705.45 KiB (1%) |       16686 |
| `["dict", "base"]`                       |   4.080 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.213 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.200 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.200 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.133 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.211 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  52.800 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 695.108 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 230.003 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 230.103 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 817.113 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 795.512 μs (5%) |         |   3.01 MiB (1%) |       98677 |
| `["findall", "xf-iter"]`                 |   3.242 ms (5%) |         |   9.63 MiB (1%) |      299929 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.358 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.322 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.914 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.452 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.298 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 657.408 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.571 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.641 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 897.012 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.978 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 244.726 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.701 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.286 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 495.881 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.683 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.957 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 388.894 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.692 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 399.005 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.705 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.271 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 453.066 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.678 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.825 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 413.641 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.689 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.986 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 483.600 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 174.002 μs (5%) |         | 157.84 KiB (1%) |       10019 |
| `["groupby", "sum", "xf-with-init"]`     | 189.702 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 190.002 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.870 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.022 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.910 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.678 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.556 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.200 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.720 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.490 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.886 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.380 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.700 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 205.203 μs (5%) |         |  71.83 KiB (1%) |        3730 |
| `["missing_dot", "xf_nota"]`             | 210.403 μs (5%) |         |  71.70 KiB (1%) |        3726 |
| `["overhead", "foldl"]`                  |   5.000 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 180.428 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.065 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.061 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.140 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.475 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       6153 s          0 s       1122 s     107098 s          0 s
       #2  2593 MHz      55167 s          0 s       1751 s      59045 s          0 s
       
  Memory: 6.791385650634766 GB (2947.046875 MB free)
  Uptime: 1170.0 sec
  Load Avg:  1.0  0.9150390625  0.56982421875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 14 Jul 2020 - 0:50
* Package commit: 7c47b9
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
| `["append!!", "eduction"]`               |  18.901 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  18.800 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.770 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.356 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 109.001 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  75.901 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 311.603 μs (5%) |         | 705.13 KiB (1%) |       16665 |
| `["dict", "base"]`                       |   4.076 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.174 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.190 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.180 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.144 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.211 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  59.501 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 752.106 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 231.402 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 230.102 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 806.408 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 786.807 μs (5%) |         |   3.02 MiB (1%) |       98770 |
| `["findall", "xf-iter"]`                 |   3.305 ms (5%) |         |   9.63 MiB (1%) |      299924 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.259 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.264 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.968 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.390 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.292 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 656.706 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.580 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.640 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 894.208 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.000 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 200.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.699 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.300 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.688 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.691 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.700 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.683 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.688 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.000 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 249.302 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 199.101 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 193.302 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.870 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.133 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.130 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.678 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.556 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.188 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.740 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.390 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.829 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.490 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.590 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 210.602 μs (5%) |         |  72.03 KiB (1%) |        3738 |
| `["missing_dot", "xf_nota"]`             | 211.802 μs (5%) |         |  72.27 KiB (1%) |        3749 |
| `["overhead", "foldl"]`                  |   4.700 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 181.987 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.073 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.129 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.893 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.485 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      32810 s          0 s       1330 s     110140 s          0 s
       #2  2593 MHz      58074 s          0 s       1926 s      85778 s          0 s
       
  Memory: 6.791385650634766 GB (2894.08984375 MB free)
  Uptime: 1469.0 sec
  Load Avg:  1.01171875  0.9990234375  0.71044921875
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
    Model name:          Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz
    Stepping:            7
    CPU MHz:             2593.905
    BogoMIPS:            5187.81
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
| Brand              | Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz          |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x07, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

