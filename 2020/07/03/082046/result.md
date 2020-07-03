# Benchmark result

* Pull request commit: [`226ba50af649c68ea5b2a97ccc1cd0d7b43e488d`](https://github.com/JuliaFolds/Transducers.jl/commit/226ba50af649c68ea5b2a97ccc1cd0d7b43e488d)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Jul 2020 - 08:16
    - Baseline: 3 Jul 2020 - 08:20
* Package commits:
    - Target: 724379
    - Baseline: 3534ae
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
| `["cat", "base"]`                        |                1.08 (5%) :x: |   1.00 (1%)  |
| `["filter_map_map!", "man"]`             |                1.09 (5%) :x: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        |                1.06 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.77 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   |                1.05 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "rf"]`               |                1.30 (5%) :x: |   1.00 (1%)  |
| `["missing_argmax", "xf"]`               | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.15 (5%) :x: |   1.00 (1%)  |
| `["overhead", "foldl"]`                  | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2095 MHz      16780 s          0 s       1506 s      80975 s          0 s
       #2  2095 MHz      47504 s          0 s       2047 s      46411 s          0 s
       
  Memory: 6.764884948730469 GB (2943.1171875 MB free)
  Uptime: 1067.0 sec
  Load Avg:  1.009765625  0.98291015625  0.69873046875
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
       #1  2095 MHz      28912 s          0 s       1680 s      94147 s          0 s
       #2  2095 MHz      60842 s          0 s       2160 s      58445 s          0 s
       
  Memory: 6.764884948730469 GB (2982.83984375 MB free)
  Uptime: 1323.0 sec
  Load Avg:  1.04931640625  1.0439453125  0.8076171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 8:16
* Package commit: 724379
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
| `["append!!", "eduction"]`               |  77.103 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  77.903 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.344 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.289 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 130.605 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  91.703 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 388.614 μs (5%) |         | 705.20 KiB (1%) |       16670 |
| `["dot", "blas"]`                        |   1.490 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.450 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.656 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.667 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  62.006 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 870.584 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.609 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.609 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 999.735 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 955.433 μs (5%) |         |   3.05 MiB (1%) |       99839 |
| `["findall", "xf-iter"]`                 |   4.007 ms (5%) |         |   9.63 MiB (1%) |      299921 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.102 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.811 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.305 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.993 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.320 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 547.854 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.259 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.043 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.112 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.763 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 304.135 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   2.019 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.000 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 478.622 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   2.050 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.758 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 478.112 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   2.030 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.181 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 613.206 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   2.025 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.784 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 474.031 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   2.049 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.572 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 566.913 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   2.033 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.041 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 475.056 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 311.129 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 231.221 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 230.322 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   4.014 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.188 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   2.100 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.720 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.133 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.740 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   2.090 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 263.009 μs (5%) |         |  72.19 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 255.208 μs (5%) |         |  72.41 KiB (1%) |        3753 |
| `["overhead", "foldl"]`                  |   5.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 228.249 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.583 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.780 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2095 MHz      16780 s          0 s       1506 s      80975 s          0 s
       #2  2095 MHz      47504 s          0 s       2047 s      46411 s          0 s
       
  Memory: 6.764884948730469 GB (2943.1171875 MB free)
  Uptime: 1067.0 sec
  Load Avg:  1.009765625  0.98291015625  0.69873046875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 8:20
* Package commit: 3534ae
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
| `["append!!", "eduction"]`               |  75.606 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  76.206 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.167 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.278 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 131.910 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  89.507 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 391.631 μs (5%) |         | 705.17 KiB (1%) |       16670 |
| `["dot", "blas"]`                        |   1.490 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.450 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  57.004 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 936.357 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.621 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.522 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 998.377 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 947.772 μs (5%) |         |   3.02 MiB (1%) |       98948 |
| `["findall", "xf-iter"]`                 |   4.084 ms (5%) |         |   9.63 MiB (1%) |      299911 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.102 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.764 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.227 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.966 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.495 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 518.433 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.134 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.296 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.108 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.924 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.958 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.932 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 600.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.925 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.500 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.982 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.600 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 600.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.930 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 331.320 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 257.015 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 265.816 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.086 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   4.000 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   2.100 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.680 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.084 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.740 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.810 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 267.019 μs (5%) |         |  72.25 KiB (1%) |        3747 |
| `["missing_dot", "xf_nota"]`             | 261.619 μs (5%) |         |  72.02 KiB (1%) |        3739 |
| `["overhead", "foldl"]`                  |   6.300 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 223.657 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.532 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.797 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2095 MHz      28912 s          0 s       1680 s      94147 s          0 s
       #2  2095 MHz      60842 s          0 s       2160 s      58445 s          0 s
       
  Memory: 6.764884948730469 GB (2982.83984375 MB free)
  Uptime: 1323.0 sec
  Load Avg:  1.04931640625  1.0439453125  0.8076171875
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
    CPU MHz:             2095.190
    BogoMIPS:            4190.38
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

