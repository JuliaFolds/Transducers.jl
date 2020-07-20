# Benchmark result

* Pull request commit: [`a3bc972f5610e762853103223bf4e23bdeac7d14`](https://github.com/JuliaFolds/Transducers.jl/commit/a3bc972f5610e762853103223bf4e23bdeac7d14)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/367> (Update to Documenter 0.25.1)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 20 Jul 2020 - 23:21
    - Baseline: 20 Jul 2020 - 23:26
* Package commits:
    - Target: 69310d
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

| ID                                       | time ratio                   | memory ratio |
|------------------------------------------|------------------------------|--------------|
| `["append!!", "eduction"]`               | 0.81 (5%) :white_check_mark: |   1.00 (1%)  |
| `["append!!", "xf"]`                     | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["cat", "base"]`                        |                1.15 (5%) :x: |   1.00 (1%)  |
| `["cat", "xf"]`                          | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "filter-missing"]`          | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "identity-float"]`          | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "identity-union"]`          | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dict", "base"]`                       | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dict", "xf"]`                         | 0.81 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dot", "blas"]`                        | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dot", "man"]`                         | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dot", "rf"]`                          | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dot", "xf"]`                          | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_reduce", "man"]`           | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_reduce", "xf"]`            | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["findall", "xf-array"]`                | 0.90 (5%) :white_check_mark: |   1.01 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        |                1.12 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.74 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "256"]` | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`  | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.73 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "256"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.05 (5%) :x: |   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.76 (5%) :white_check_mark: |   1.00 (1%)  |
| `["mapcat_eduction", "base"]`            | 0.81 (5%) :white_check_mark: |   1.00 (1%)  |
| `["mapcat_eduction", "xf-eduction"]`     |                1.15 (5%) :x: |   1.00 (1%)  |
| `["mapcat_eduction", "xf-xf"]`           | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "naive"]`               | 0.76 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.14 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "xf"]`                  | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "xf_nota"]`             | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["overhead", "foldl"]`                  | 0.75 (5%) :white_check_mark: |   1.00 (1%)  |
| `["overhead", "reduce_basecase"]`        | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["partition_by", "man"]`                | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["partition_by", "xf"]`                 | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      47038 s          0 s       1439 s      23040 s          0 s
       #2  2095 MHz      20808 s          0 s       1692 s      49236 s          0 s
       
  Memory: 6.764884948730469 GB (2843.5 MB free)
  Uptime: 734.0 sec
  Load Avg:  1.009765625  1.0  0.658203125
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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      65058 s          0 s       1567 s      33869 s          0 s
       #2  2095 MHz      31724 s          0 s       1740 s      67236 s          0 s
       
  Memory: 6.764884948730469 GB (2811.0 MB free)
  Uptime: 1025.0 sec
  Load Avg:  1.10986328125  1.029296875  0.775390625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 20 Jul 2020 - 23:21
* Package commit: 69310d
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
| `["append!!", "eduction"]`               |  16.802 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  16.302 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.930 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.920 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          |  94.906 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  72.705 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 272.620 μs (5%) |         | 705.06 KiB (1%) |       16663 |
| `["dict", "base"]`                       |   3.763 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   3.723 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.150 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.190 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.830 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.880 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  59.602 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 664.630 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.913 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 191.913 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 754.653 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 718.848 μs (5%) |         |   3.05 MiB (1%) |      100014 |
| `["findall", "xf-iter"]`                 |   3.540 ms (5%) |         |   9.63 MiB (1%) |      299918 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.934 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.705 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.388 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.773 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.060 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 526.525 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.262 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.226 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 761.946 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.934 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 253.769 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.504 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.472 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 367.652 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.526 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.675 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 423.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.532 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 421.550 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.501 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.450 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 364.923 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.543 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.550 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 408.520 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.487 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.543 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 421.631 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 242.611 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 155.007 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 178.608 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.820 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.133 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.860 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.600 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.556 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.456 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.250 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.320 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   3.972 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.320 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.660 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 174.911 μs (5%) |         |  72.06 KiB (1%) |        3740 |
| `["missing_dot", "xf_nota"]`             | 174.611 μs (5%) |         |  72.05 KiB (1%) |        3738 |
| `["overhead", "foldl"]`                  |   3.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 162.776 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.672 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.035 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.307 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.985 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      47038 s          0 s       1439 s      23040 s          0 s
       #2  2095 MHz      20808 s          0 s       1692 s      49236 s          0 s
       
  Memory: 6.764884948730469 GB (2843.5 MB free)
  Uptime: 734.0 sec
  Load Avg:  1.009765625  1.0  0.658203125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 20 Jul 2020 - 23:26
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
| `["append!!", "eduction"]`               |  20.801 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  20.401 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.680 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.200 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 109.004 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  79.204 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 299.012 μs (5%) |         | 704.95 KiB (1%) |       16656 |
| `["dict", "base"]`                       |   4.327 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.578 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.280 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.300 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.090 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.170 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  60.407 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 701.579 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 227.109 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 223.209 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 728.729 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 795.432 μs (5%) |         |   3.03 MiB (1%) |       99299 |
| `["findall", "xf-iter"]`                 |   3.391 ms (5%) |         |   9.63 MiB (1%) |      299931 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.865 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.587 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.385 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.829 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.290 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 509.419 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.240 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.985 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 875.334 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.722 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.633 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.300 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.655 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.300 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.734 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.665 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.718 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 281.930 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 204.822 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 180.220 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.240 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.856 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.120 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.600 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.789 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.522 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.450 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.340 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.257 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.350 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.460 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 208.408 μs (5%) |         |  72.09 KiB (1%) |        3740 |
| `["missing_dot", "xf_nota"]`             | 208.408 μs (5%) |         |  71.73 KiB (1%) |        3726 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 204.240 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.983 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.370 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.317 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.073 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      65058 s          0 s       1567 s      33869 s          0 s
       #2  2095 MHz      31724 s          0 s       1740 s      67236 s          0 s
       
  Memory: 6.764884948730469 GB (2811.0 MB free)
  Uptime: 1025.0 sec
  Load Avg:  1.10986328125  1.029296875  0.775390625
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
    CPU MHz:             2095.194
    BogoMIPS:            4190.38
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

