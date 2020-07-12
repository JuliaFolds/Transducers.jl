# Benchmark result

* Pull request commit: [`ee05890a18a1661a5999ab0d3e99fee4675de356`](https://github.com/JuliaFolds/Transducers.jl/commit/ee05890a18a1661a5999ab0d3e99fee4675de356)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/360> (Benchmark Set(eduction(...)) and Dict(eduction(...)))

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 06:34
    - Baseline: 12 Jul 2020 - 06:38
* Package commits:
    - Target: bac942
    - Baseline: f40a1e
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
| `["append!!", "eduction"]`               |                1.13 (5%) :x: |   1.00 (1%)  |
| `["cat", "base"]`                        | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["cat", "xf"]`                          |                1.44 (5%) :x: |   1.00 (1%)  |
| `["collect", "filter-missing"]`          |                1.11 (5%) :x: |   1.00 (1%)  |
| `["collect", "identity-union"]`          |                1.22 (5%) :x: |   1.00 (1%)  |
| `["dot", "blas"]`                        | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dot", "man"]`                         |                1.16 (5%) :x: |   1.00 (1%)  |
| `["filter_map_map!", "man"]`             | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_reduce", "xf"]`            | 0.81 (5%) :white_check_mark: |   1.00 (1%)  |
| `["findall", "base"]`                    |                1.28 (5%) :x: |   1.00 (1%)  |
| `["findall", "xf-array"]`                |                1.10 (5%) :x: |   1.01 (1%)  |
| `["gemm", "fusedmul", "blas", "8"]`      | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       |                1.18 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.82 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.74 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.79 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "256"]` | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`  | 0.78 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  |                1.16 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.11 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.81 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |                1.12 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.82 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              |                1.29 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.76 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.78 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "xf"]`               | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "equiv"]`               |                1.26 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "naive"]`               |                1.16 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "rf"]`                  |                1.18 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.06 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "xf"]`                  | 0.92 (5%) :white_check_mark: |   0.99 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.09 (5%) :x: |   1.00 (1%)  |
| `["partition_by", "man"]`                |                1.09 (5%) :x: |   1.00 (1%)  |
| `["partition_by", "xf"]`                 |                1.19 (5%) :x: |   1.00 (1%)  |

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
       #1  2095 MHz      26871 s          0 s       1968 s      16369 s          0 s
       #2  2095 MHz      39553 s          0 s       1909 s      14773 s          0 s
       
  Memory: 6.764884948730469 GB (1778.515625 MB free)
  Uptime: 713.0 sec
  Load Avg:  1.39208984375  1.798828125  1.1162109375
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
       #1  2095 MHz      37183 s          0 s       2102 s      31521 s          0 s
       #2  2095 MHz      54829 s          0 s       2041 s      24963 s          0 s
       
  Memory: 6.764884948730469 GB (1745.60546875 MB free)
  Uptime: 970.0 sec
  Load Avg:  1.01513671875  1.34375  1.08203125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 6:34
* Package commit: bac942
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
| `["append!!", "eduction"]`               |  58.003 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  65.104 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.680 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   2.189 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 108.206 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  77.603 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 321.816 μs (5%) |          | 705.31 KiB (1%) |       16679 |
| `["dict", "base"]`                       |   4.619 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |  37.223 ms (5%) | 5.419 ms |  53.71 MiB (1%) |     1502541 |
| `["dot", "blas"]`                        |   1.220 μs (5%) |          |                 |             |
| `["dot", "man"]`                         |   1.370 μs (5%) |          |                 |             |
| `["dot", "rf"]`                          |   1.867 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   1.845 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  69.902 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 720.220 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 223.009 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 192.808 μs (5%) |          |                 |             |
| `["findall", "base"]`                    | 903.241 μs (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 829.437 μs (5%) |          |   3.05 MiB (1%) |       99941 |
| `["findall", "xf-iter"]`                 |   3.476 ms (5%) |          |   9.63 MiB (1%) |      299927 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.293 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.504 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.334 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.144 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   3.921 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 589.217 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  11.549 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.987 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 828.231 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.500 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 238.074 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.523 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.157 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 347.218 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.518 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.271 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 423.198 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.669 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.883 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 444.398 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.711 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.743 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 323.360 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.761 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.086 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 401.518 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.519 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.000 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 355.622 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 276.308 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 157.504 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 154.904 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.975 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.150 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.578 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.570 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.190 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.617 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.370 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.280 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 182.907 μs (5%) |          |  71.80 KiB (1%) |        3727 |
| `["missing_dot", "xf_nota"]`             | 227.609 μs (5%) |          |  72.02 KiB (1%) |        3737 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 155.817 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.230 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.454 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   5.454 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |  77.132 ms (5%) | 6.069 ms |  59.77 MiB (1%) |     1907785 |

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
       #1  2095 MHz      26871 s          0 s       1968 s      16369 s          0 s
       #2  2095 MHz      39553 s          0 s       1909 s      14773 s          0 s
       
  Memory: 6.764884948730469 GB (1778.515625 MB free)
  Uptime: 713.0 sec
  Load Avg:  1.39208984375  1.798828125  1.1162109375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 6:38
* Package commit: f40a1e
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
| `["append!!", "eduction"]`               |  51.302 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  65.802 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.930 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.522 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  97.202 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  80.802 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 263.806 μs (5%) |         | 705.14 KiB (1%) |       16669 |
| `["dot", "blas"]`                        |   1.340 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.180 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.856 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.844 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  74.001 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 727.915 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 223.405 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 238.005 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 706.017 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 751.718 μs (5%) |         |   3.03 MiB (1%) |       99241 |
| `["findall", "xf-iter"]`                 |   3.649 ms (5%) |         |   9.63 MiB (1%) |      299933 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.284 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.514 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.661 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.688 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.333 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 612.013 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.757 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.422 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 885.520 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.596 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.710 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.436 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.805 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.572 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.861 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 214.404 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 159.103 μs (5%) |         | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 203.204 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.975 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.750 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.844 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.250 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.180 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   3.967 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.160 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.210 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 198.004 μs (5%) |         |  72.23 KiB (1%) |        3747 |
| `["missing_dot", "xf_nota"]`             | 207.905 μs (5%) |         |  72.14 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   4.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 159.242 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.043 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.894 ms (5%) |         |   6.10 MiB (1%) |      200009 |

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
       #1  2095 MHz      37183 s          0 s       2102 s      31521 s          0 s
       #2  2095 MHz      54829 s          0 s       2041 s      24963 s          0 s
       
  Memory: 6.764884948730469 GB (1745.60546875 MB free)
  Uptime: 970.0 sec
  Load Avg:  1.01513671875  1.34375  1.08203125
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
    CPU MHz:             2095.129
    BogoMIPS:            4190.25
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            1024K
    L3 cache:            36608K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves
    

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

