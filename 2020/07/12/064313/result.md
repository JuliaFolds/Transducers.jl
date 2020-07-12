# Benchmark result

* Pull request commit: [`371e3d0961f5745440e40cd255d1f23bc5b981df`](https://github.com/JuliaFolds/Transducers.jl/commit/371e3d0961f5745440e40cd255d1f23bc5b981df)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/361> (Define Set(eduction(...)) and Dict(eduction(...)))

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 06:37
    - Baseline: 12 Jul 2020 - 06:42
* Package commits:
    - Target: 3efb5f
    - Baseline: ee0589
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
| `["cat", "xf"]`                          |                1.23 (5%) :x: |                   1.00 (1%)  |
| `["dict", "xf"]`                         | 0.14 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["filter_map_map!", "man"]`             |                1.15 (5%) :x: |                   1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.02 (5%)  |                1.03 (1%) :x: |
| `["gemm", "fusedmul", "xf", "16"]`       |                1.21 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        |                1.27 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        |                1.21 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.14 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.84 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 0.76 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    |                1.14 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.78 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "xf"]`               |                1.29 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.16 (5%) :x: |                   1.00 (1%)  |
| `["set", "xf"]`                          | 0.07 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      16644 s          0 s       1410 s      54412 s          0 s
       #2  2095 MHz      51947 s          0 s       1781 s      18849 s          0 s
       
  Memory: 6.764884948730469 GB (2720.55078125 MB free)
  Uptime: 745.0 sec
  Load Avg:  1.0048828125  1.0  0.671875
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
       #1  2095 MHz      31715 s          0 s       1556 s      68851 s          0 s
       #2  2095 MHz      66466 s          0 s       1922 s      33837 s          0 s
       
  Memory: 6.764884948730469 GB (2634.5546875 MB free)
  Uptime: 1043.0 sec
  Load Avg:  1.033203125  1.0166015625  0.783203125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 6:37
* Package commit: 3efb5f
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
| `["append!!", "eduction"]`               |  76.301 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  77.501 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.167 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.778 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 132.802 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  90.201 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 384.705 μs (5%) |         | 705.14 KiB (1%) |       16668 |
| `["dict", "base"]`                       |   5.067 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   5.258 ms (5%) |         |  92.47 KiB (1%) |          26 |
| `["dot", "blas"]`                        |   1.500 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.490 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.667 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  68.001 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 948.004 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.602 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.602 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 997.410 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 945.009 μs (5%) |         |   3.04 MiB (1%) |       99426 |
| `["findall", "xf-iter"]`                 |   3.999 ms (5%) |         |   9.63 MiB (1%) |      299915 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.186 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.865 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.157 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.173 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.913 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 673.703 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.843 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.667 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.106 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.725 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 305.691 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.973 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.783 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 484.103 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.999 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.757 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 568.108 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.978 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.867 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 506.186 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.979 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.767 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 481.633 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   2.007 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.600 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 458.883 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.966 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.640 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 483.163 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 315.302 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 229.401 μs (5%) |         | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 233.301 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.125 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.987 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.790 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.730 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.083 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.680 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.800 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 266.202 μs (5%) |         |  72.16 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 258.203 μs (5%) |         |  72.17 KiB (1%) |        3741 |
| `["overhead", "foldl"]`                  |   6.700 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 221.759 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.599 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.834 ms (5%) |         |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   6.402 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.661 ms (5%) |         |  49.81 KiB (1%) |          29 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      16644 s          0 s       1410 s      54412 s          0 s
       #2  2095 MHz      51947 s          0 s       1781 s      18849 s          0 s
       
  Memory: 6.764884948730469 GB (2720.55078125 MB free)
  Uptime: 745.0 sec
  Load Avg:  1.0048828125  1.0  0.671875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 6:42
* Package commit: ee0589
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
| `["append!!", "eduction"]`               |  73.901 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  74.300 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.167 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   2.267 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 132.801 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  89.200 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 391.002 μs (5%) |          | 705.16 KiB (1%) |       16665 |
| `["dict", "base"]`                       |   5.110 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |  38.697 ms (5%) | 4.978 ms |  53.71 MiB (1%) |     1502541 |
| `["dot", "blas"]`                        |   1.490 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   1.470 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   2.667 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   2.678 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  59.000 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 948.409 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.601 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.501 μs (5%) |          |                 |             |
| `["findall", "base"]`                    | 981.104 μs (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 926.503 μs (5%) |          |   2.95 MiB (1%) |       96647 |
| `["findall", "xf-iter"]`                 |   4.013 ms (5%) |          |   9.63 MiB (1%) |      299913 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.056 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.859 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.175 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.085 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.050 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 531.205 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.226 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.202 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.110 ms (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.800 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.939 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.400 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.990 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.800 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.956 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.200 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 600.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.947 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.400 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   2.010 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.600 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 600.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.942 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.800 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 309.703 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 248.302 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 239.503 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   4.013 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.100 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   2.160 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.710 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.150 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.750 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   2.060 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 257.201 μs (5%) |          |  71.75 KiB (1%) |        3725 |
| `["missing_dot", "xf_nota"]`             | 253.601 μs (5%) |          |  72.16 KiB (1%) |        3740 |
| `["overhead", "foldl"]`                  |   5.800 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 223.222 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.590 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.779 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   6.244 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |  83.161 ms (5%) | 6.276 ms |  59.77 MiB (1%) |     1907785 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      31715 s          0 s       1556 s      68851 s          0 s
       #2  2095 MHz      66466 s          0 s       1922 s      33837 s          0 s
       
  Memory: 6.764884948730469 GB (2634.5546875 MB free)
  Uptime: 1043.0 sec
  Load Avg:  1.033203125  1.0166015625  0.783203125
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
    CPU MHz:             2095.075
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

