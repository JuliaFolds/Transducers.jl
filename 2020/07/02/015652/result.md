# Benchmark result

* Pull request commit: [`6c04f38efd33c5f2f8ee9a5133a9afa28afc1150`](https://github.com/JuliaFolds/Transducers.jl/commit/6c04f38efd33c5f2f8ee9a5133a9afa28afc1150)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/324> (Optimize append!!(dest, src::Foldable))

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 2 Jul 2020 - 01:52
    - Baseline: 2 Jul 2020 - 01:56
* Package commits:
    - Target: fe606e
    - Baseline: 3ecdab
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

| ID                                                   | time ratio                   | memory ratio                 |
|------------------------------------------------------|------------------------------|------------------------------|
| `["append", "append!!(::Transducer, Union{}[], _)"]` | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["append", "append!!(Union{}[], ::Eduction)"]`      | 0.48 (5%) :white_check_mark: | 0.25 (1%) :white_check_mark: |
| `["cat", "xf"]`                                      |                1.21 (5%) :x: |                   1.00 (1%)  |
| `["filter_map_map!", "xf"]`                          |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`                   | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`                    |                1.27 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`                   | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`                    |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`               | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "256"]`             |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`              |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`               |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`              | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`                | 0.80 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`               | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`                | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "256"]`              |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`               | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`                | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`                 | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`                 |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["missing_argmax", "rf"]`                           | 0.78 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "equiv"]`                           | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                              | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append"]`
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
       #1  2095 MHz      22076 s          0 s       1621 s      46143 s          0 s
       #2  2095 MHz      43141 s          0 s       2067 s      25229 s          0 s
       
  Memory: 6.764884948730469 GB (2957.53515625 MB free)
  Uptime: 722.0 sec
  Load Avg:  1.08203125  0.98291015625  0.60888671875
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
       #1  2095 MHz      24803 s          0 s       1781 s      69944 s          0 s
       #2  2095 MHz      67114 s          0 s       2346 s      27733 s          0 s
       
  Memory: 6.764884948730469 GB (2921.109375 MB free)
  Uptime: 990.0 sec
  Load Avg:  1.17724609375  1.09765625  0.759765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 1:52
* Package commit: fe606e
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

| ID                                                   | time            | GC time | memory          | allocations |
|------------------------------------------------------|----------------:|--------:|----------------:|------------:|
| `["append", "append!!(::Transducer, Union{}[], _)"]` |  74.301 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append", "append!!(Union{}[], ::Eduction)"]`      |  75.101 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                                    |   2.078 μs (5%) |         |                 |             |
| `["cat", "xf"]`                                      |   2.667 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`                      | 128.202 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`                      |  95.601 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`                      | 377.305 μs (5%) |         | 705.27 KiB (1%) |       16676 |
| `["dot", "blas"]`                                    |   1.440 μs (5%) |         |                 |             |
| `["dot", "man"]`                                     |   1.440 μs (5%) |         |                 |             |
| `["dot", "rf"]`                                      |   2.578 μs (5%) |         |                 |             |
| `["dot", "xf"]`                                      |   2.567 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`                         |  71.000 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`                          | 894.006 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`                       | 276.103 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`                        | 276.103 μs (5%) |         |                 |             |
| `["findall", "base"]`                                | 984.912 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                            | 939.311 μs (5%) |         |   3.02 MiB (1%) |       98887 |
| `["findall", "xf-iter"]`                             |   4.238 ms (5%) |         |   9.63 MiB (1%) |      299927 |
| `["gemm", "fusedmul", "blas", "16"]`                 |   5.233 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`                  |   3.959 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`                 |   7.544 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`                  |   4.395 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`                   |   4.267 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`                    | 730.605 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`                   |   8.818 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`                    |   2.416 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`                   |   1.066 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`                    |   3.587 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`                     | 292.424 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]`             |   2.283 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`              |   6.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`               | 459.898 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]`             |   2.235 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`              |   5.443 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`               | 540.741 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`              |   2.054 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`               |   5.833 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`                | 478.462 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`              |   2.105 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`               |   5.517 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`                | 456.853 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`              |   2.280 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`               |   4.814 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`                | 432.323 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`               |   2.146 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`                |   5.950 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`                 | 455.330 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`                          | 308.602 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`                 | 237.502 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`              | 228.001 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`                          |   3.225 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`                           |   3.000 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`                           |   3.800 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`                           |   1.760 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                             |   1.660 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`                           |   5.967 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                              |   1.620 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`                         |   1.960 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                              | 255.902 μs (5%) |         |  72.14 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`                         | 257.402 μs (5%) |         |  71.98 KiB (1%) |        3736 |
| `["overhead", "foldl"]`                              |   5.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`                    | 216.925 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                            |   2.478 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                             |   3.672 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append"]`
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
       #1  2095 MHz      22076 s          0 s       1621 s      46143 s          0 s
       #2  2095 MHz      43141 s          0 s       2067 s      25229 s          0 s
       
  Memory: 6.764884948730469 GB (2957.53515625 MB free)
  Uptime: 722.0 sec
  Load Avg:  1.08203125  0.98291015625  0.60888671875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 1:56
* Package commit: 3ecdab
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

| ID                                                   | time            | GC time | memory          | allocations |
|------------------------------------------------------|----------------:|--------:|----------------:|------------:|
| `["append", "append!!(::Transducer, Union{}[], _)"]` |  85.201 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append", "append!!(Union{}[], ::Eduction)"]`      | 156.900 μs (5%) |         | 266.16 KiB (1%) |        5080 |
| `["cat", "base"]`                                    |   2.078 μs (5%) |         |                 |             |
| `["cat", "xf"]`                                      |   2.200 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`                      | 129.500 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`                      |  94.500 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`                      | 373.602 μs (5%) |         | 705.41 KiB (1%) |       16683 |
| `["dot", "blas"]`                                    |   1.430 μs (5%) |         |                 |             |
| `["dot", "man"]`                                     |   1.430 μs (5%) |         |                 |             |
| `["dot", "rf"]`                                      |   2.567 μs (5%) |         |                 |             |
| `["dot", "xf"]`                                      |   2.578 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`                         |  71.701 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`                          | 802.113 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`                       | 276.102 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`                        | 276.102 μs (5%) |         |                 |             |
| `["findall", "base"]`                                | 979.706 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                            | 944.405 μs (5%) |         |   3.04 MiB (1%) |       99713 |
| `["findall", "xf-iter"]`                             |   4.044 ms (5%) |         |   9.63 MiB (1%) |      299927 |
| `["gemm", "fusedmul", "blas", "16"]`                 |   5.408 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`                  |   4.076 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`                 |   7.519 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`                  |   4.314 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`                   |   4.570 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`                    | 576.010 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`                   |   9.886 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`                    |   2.240 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`                   |   1.068 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`                    |   3.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`                     | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]`             |   2.242 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`              |   6.000 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`               | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]`             |   2.043 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`              |   4.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`               | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`              |   2.308 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`               |   6.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`                | 600.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`              |   2.157 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`               |   5.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`                | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`              |   2.121 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`               |   5.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`                | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`               |   2.168 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`                |   5.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`                 | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`                          | 306.105 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`                 | 225.003 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`              | 228.503 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`                          |   3.225 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`                           |   3.833 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`                           |   3.825 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`                           |   2.030 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                             |   1.630 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`                           |   6.000 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                              |   1.680 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`                         |   2.010 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                              | 252.501 μs (5%) |         |  72.25 KiB (1%) |        3749 |
| `["missing_dot", "xf_nota"]`                         | 255.001 μs (5%) |         |  72.28 KiB (1%) |        3749 |
| `["overhead", "foldl"]`                              |   6.000 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`                    | 214.423 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                            |   2.501 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                             |   3.695 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append"]`
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
       #1  2095 MHz      24803 s          0 s       1781 s      69944 s          0 s
       #2  2095 MHz      67114 s          0 s       2346 s      27733 s          0 s
       
  Memory: 6.764884948730469 GB (2921.109375 MB free)
  Uptime: 990.0 sec
  Load Avg:  1.17724609375  1.09765625  0.759765625
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

