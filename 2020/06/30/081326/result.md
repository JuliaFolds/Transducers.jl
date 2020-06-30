# Benchmark result

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 30 Jun 2020 - 08:09
    - Baseline: 30 Jun 2020 - 08:13
* Package commits:
    - Target: e3a36a
    - Baseline: 8ccb58
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
| `["cat", "base"]`                        | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["cat", "xf"]`                          |                1.14 (5%) :x: |    1.00 (1%)  |
| `["dot", "man"]`                         |                1.08 (5%) :x: |    1.00 (1%)  |
| `["filter_map_map!", "man"]`             |                1.41 (5%) :x: |    1.00 (1%)  |
| `["filter_map_map!", "xf"]`              | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.01 (5%)  | 1.02 (1%) :x: |
| `["gemm", "fusedmul", "blas", "16"]`     |                1.05 (5%) :x: |    1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "32"]`     |                1.09 (5%) :x: |    1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        |                1.10 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.84 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.71 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.09 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`  | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.88 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.85 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.05 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.80 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 0.77 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    |                1.29 (5%) :x: |    1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.07 (5%) :x: |    1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     |                1.06 (5%) :x: |    1.00 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.08 (5%) :x: |    1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.24 (5%) :x: |    1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      42322 s          0 s       1672 s      20960 s          0 s
       #2  2095 MHz      17114 s          0 s       1485 s      46356 s          0 s
       
  Memory: 6.764884948730469 GB (3016.77734375 MB free)
  Uptime: 667.0 sec
  Load Avg:  1.05419921875  1.0  0.60400390625
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
       #1  2095 MHz      46561 s          0 s       1815 s      39901 s          0 s
       #2  2095 MHz      36293 s          0 s       1577 s      50429 s          0 s
       
  Memory: 6.764884948730469 GB (2975.98828125 MB free)
  Uptime: 902.0 sec
  Load Avg:  1.0986328125  1.0283203125  0.71337890625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 8:9
* Package commit: e3a36a
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
| `["cat", "base"]`                        |   1.450 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.850 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  93.809 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  69.107 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 275.427 μs (5%) |         | 704.88 KiB (1%) |       16651 |
| `["dot", "blas"]`                        |   1.100 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.100 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.790 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.810 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  72.704 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 592.932 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.816 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 192.017 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 716.266 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 650.059 μs (5%) |         |   3.02 MiB (1%) |       98980 |
| `["findall", "xf-iter"]`                 |   2.789 ms (5%) |         |   9.63 MiB (1%) |      299935 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.134 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.173 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.924 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.230 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.524 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 553.232 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.047 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.540 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 756.657 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.522 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 212.164 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.325 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.875 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 325.884 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.354 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.475 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 376.610 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.338 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.114 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 341.199 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.332 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 321.800 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.378 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.275 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 306.903 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.321 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.172 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 322.025 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 215.211 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 168.509 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 160.108 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.234 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.689 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.145 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.210 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.180 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.115 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.410 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 172.514 μs (5%) |         |  71.88 KiB (1%) |        3733 |
| `["missing_dot", "xf_nota"]`             | 179.615 μs (5%) |         |  72.14 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   5.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 149.472 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.718 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.605 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      42322 s          0 s       1672 s      20960 s          0 s
       #2  2095 MHz      17114 s          0 s       1485 s      46356 s          0 s
       
  Memory: 6.764884948730469 GB (3016.77734375 MB free)
  Uptime: 667.0 sec
  Load Avg:  1.05419921875  1.0  0.60400390625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 8:13
* Package commit: 8ccb58
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
| `["cat", "base"]`                        |   1.570 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.620 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  92.004 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  69.303 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 279.213 μs (5%) |         | 705.39 KiB (1%) |       16682 |
| `["dot", "blas"]`                        |   1.110 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.020 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.800 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.800 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  51.702 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 637.926 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.809 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 192.008 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 695.032 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 642.029 μs (5%) |         |   2.96 MiB (1%) |       96788 |
| `["findall", "xf-iter"]`                 |   2.795 ms (5%) |         |   9.63 MiB (1%) |      299925 |
| `["gemm", "fusedmul", "blas", "16"]`     |   3.921 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.078 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.444 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.149 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.379 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 537.022 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.836 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.319 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 756.332 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.000 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.402 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.392 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.396 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.404 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.395 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.418 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.000 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 211.309 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 159.306 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 164.406 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.233 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.711 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.100 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.210 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.160 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.157 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.410 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 168.408 μs (5%) |         |  71.95 KiB (1%) |        3733 |
| `["missing_dot", "xf_nota"]`             | 166.307 μs (5%) |         |  72.20 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   4.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 152.238 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.705 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.596 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      46561 s          0 s       1815 s      39901 s          0 s
       #2  2095 MHz      36293 s          0 s       1577 s      50429 s          0 s
       
  Memory: 6.764884948730469 GB (2975.98828125 MB free)
  Uptime: 902.0 sec
  Load Avg:  1.0986328125  1.0283203125  0.71337890625
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
    CPU MHz:             2095.192
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

