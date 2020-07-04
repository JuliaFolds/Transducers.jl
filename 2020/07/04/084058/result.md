# Benchmark result

* Pull request commit: [`8ec55d4984a94261dc2e233304470ce56f4eac7d`](https://github.com/JuliaFolds/Transducers.jl/commit/8ec55d4984a94261dc2e233304470ce56f4eac7d)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/334> (Use mergewith! in parallel tutorial)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Jul 2020 - 08:36
    - Baseline: 4 Jul 2020 - 08:40
* Package commits:
    - Target: a1e248
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

| ID                                       | time ratio                   | memory ratio |
|------------------------------------------|------------------------------|--------------|
| `["cat", "base"]`                        | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["cat", "xf"]`                          | 0.82 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "man"]`             | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.07 (5%) :x: |   1.00 (1%)  |
| `["findall", "base"]`                    |                1.06 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "16"]`     |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        |                1.17 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.18 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.22 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.36 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "xf"]`               | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "equiv"]`               |                1.21 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.16 (5%) :x: |   1.00 (1%)  |

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
       #1  2095 MHz      33624 s          0 s       1723 s      33322 s          0 s
       #2  2095 MHz      29633 s          0 s       1480 s      37516 s          0 s
       
  Memory: 6.764884948730469 GB (2915.609375 MB free)
  Uptime: 707.0 sec
  Load Avg:  1.025390625  0.970703125  0.58837890625
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
       #1  2095 MHz      35152 s          0 s       1880 s      56291 s          0 s
       #2  2095 MHz      52841 s          0 s       1604 s      38821 s          0 s
       
  Memory: 6.764884948730469 GB (2839.88671875 MB free)
  Uptime: 955.0 sec
  Load Avg:  1.072265625  1.0546875  0.73046875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 8:36
* Package commit: a1e248
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
| `["append!!", "eduction"]`               |  73.901 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  74.401 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.256 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.189 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 127.502 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  90.101 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 382.306 μs (5%) |         | 705.19 KiB (1%) |       16671 |
| `["dot", "blas"]`                        |   1.440 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.350 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.567 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.578 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  56.901 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 893.808 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 276.103 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 276.003 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 996.413 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 922.012 μs (5%) |         |   3.03 MiB (1%) |       99238 |
| `["findall", "xf-iter"]`                 |   4.099 ms (5%) |         |   9.63 MiB (1%) |      299910 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.191 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.722 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.898 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.855 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.269 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 608.906 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   7.980 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.954 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.068 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.575 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 292.989 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.954 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.750 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 425.888 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.921 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.743 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 458.883 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.936 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.917 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 588.894 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.963 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 456.128 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.924 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.600 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 543.622 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   2.025 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.783 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 456.350 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 323.602 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 245.802 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 248.102 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.225 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.850 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.075 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   2.060 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.620 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.934 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.680 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   2.060 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 259.403 μs (5%) |         |  72.27 KiB (1%) |        3749 |
| `["missing_dot", "xf_nota"]`             | 257.503 μs (5%) |         |  72.13 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   5.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 216.089 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.495 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.703 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2095 MHz      33624 s          0 s       1723 s      33322 s          0 s
       #2  2095 MHz      29633 s          0 s       1480 s      37516 s          0 s
       
  Memory: 6.764884948730469 GB (2915.609375 MB free)
  Uptime: 707.0 sec
  Load Avg:  1.025390625  0.970703125  0.58837890625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 8:40
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
| `["append!!", "eduction"]`               |  72.001 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  72.201 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   2.422 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.667 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 130.601 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  88.601 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 373.103 μs (5%) |         | 705.16 KiB (1%) |       16669 |
| `["dot", "blas"]`                        |   1.440 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.420 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.567 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.567 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  66.700 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 833.906 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 276.102 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 276.102 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 937.007 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 923.007 μs (5%) |         |   3.01 MiB (1%) |       98571 |
| `["findall", "xf-iter"]`                 |   3.931 ms (5%) |         |   9.63 MiB (1%) |      299916 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.930 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.756 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.045 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.847 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.153 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 519.704 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.007 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.051 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.075 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.953 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.600 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.942 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.600 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.949 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.963 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.949 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.400 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.959 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.500 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 331.202 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 261.401 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 252.002 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   3.225 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.862 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.862 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.700 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.660 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.883 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.630 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.770 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 249.702 μs (5%) |         |  72.13 KiB (1%) |        3740 |
| `["missing_dot", "xf_nota"]`             | 253.202 μs (5%) |         |  71.89 KiB (1%) |        3733 |
| `["overhead", "foldl"]`                  |   5.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 220.157 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.431 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.641 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2095 MHz      35152 s          0 s       1880 s      56291 s          0 s
       #2  2095 MHz      52841 s          0 s       1604 s      38821 s          0 s
       
  Memory: 6.764884948730469 GB (2839.88671875 MB free)
  Uptime: 955.0 sec
  Load Avg:  1.072265625  1.0546875  0.73046875
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
    CPU MHz:             2095.078
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

