# Benchmark result

* Pull request commit: [`f52308193eed15fbd74bc61d17a481f8073c2f52`](https://github.com/JuliaFolds/Transducers.jl/commit/f52308193eed15fbd74bc61d17a481f8073c2f52)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/354> (Deprecate mapfoldl and mapreduce)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 11 Jul 2020 - 20:28
    - Baseline: 11 Jul 2020 - 20:32
* Package commits:
    - Target: 728af3
    - Baseline: e1048e
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
| `["append!!", "xf"]`                     |                1.13 (5%) :x: |   1.00 (1%)  |
| `["cat", "base"]`                        |                1.15 (5%) :x: |   1.00 (1%)  |
| `["collect", "filter-missing"]`          |                1.09 (5%) :x: |   1.00 (1%)  |
| `["collect", "identity-float"]`          |                1.06 (5%) :x: |   1.00 (1%)  |
| `["dot", "blas"]`                        |                1.06 (5%) :x: |   1.00 (1%)  |
| `["dot", "man"]`                         |                1.06 (5%) :x: |   1.00 (1%)  |
| `["dot", "rf"]`                          |                1.14 (5%) :x: |   1.00 (1%)  |
| `["dot", "xf"]`                          |                1.13 (5%) :x: |   1.00 (1%)  |
| `["filter_map_map!", "man"]`             |                1.06 (5%) :x: |   1.00 (1%)  |
| `["findall", "base"]`                    |                1.11 (5%) :x: |   1.00 (1%)  |
| `["findall", "xf-array"]`                |                1.13 (5%) :x: |   1.00 (1%)  |
| `["findall", "xf-iter"]`                 |                1.10 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "16"]`     | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "2"]`      |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "8"]`      |                1.06 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.82 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        |                1.14 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       |                1.16 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.77 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       |                1.14 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` |                1.13 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  |                1.13 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.82 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.11 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.34 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.83 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "equiv"]`               |                1.13 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "naive"]`               |                1.15 (5%) :x: |   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "xf"]`                  |                1.12 (5%) :x: |   0.99 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.21 (5%) :x: |   1.00 (1%)  |
| `["overhead", "reduce_basecase"]`        |                1.19 (5%) :x: |   1.00 (1%)  |
| `["partition_by", "man"]`                |                1.06 (5%) :x: |   1.00 (1%)  |
| `["partition_by", "xf"]`                 |                1.13 (5%) :x: |   1.00 (1%)  |

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
       #1  2095 MHz       7549 s          0 s       1505 s      56721 s          0 s
       #2  2095 MHz      54204 s          0 s       1792 s       9971 s          0 s
       
  Memory: 6.764884948730469 GB (2720.84375 MB free)
  Uptime: 676.0 sec
  Load Avg:  1.0458984375  1.0537109375  0.68701171875
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
       #1  2095 MHz       9131 s          0 s       1617 s      81262 s          0 s
       #2  2095 MHz      78836 s          0 s       1975 s      11384 s          0 s
       
  Memory: 6.764884948730469 GB (2644.296875 MB free)
  Uptime: 940.0 sec
  Load Avg:  1.0947265625  1.07080078125  0.7978515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 20:28
* Package commit: 728af3
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
| `["append!!", "eduction"]`               |  66.301 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  67.501 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.930 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.030 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 118.201 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  85.801 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 338.304 μs (5%) |         | 704.92 KiB (1%) |       16654 |
| `["dot", "blas"]`                        |   1.430 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.390 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.411 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.389 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  62.800 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 675.404 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 223.402 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 223.402 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 905.610 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 880.408 μs (5%) |         |   3.06 MiB (1%) |      100057 |
| `["findall", "xf-iter"]`                 |   3.610 ms (5%) |         |   9.63 MiB (1%) |      299907 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.169 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.283 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.939 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.605 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   3.772 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 519.203 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.808 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.835 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 986.908 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.350 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 270.159 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.782 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.743 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 368.342 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.625 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.225 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 368.844 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.882 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.257 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 442.929 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.660 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.743 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 419.598 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.646 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.086 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 402.990 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.678 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.014 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 366.332 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 247.102 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 190.801 μs (5%) |         | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 179.701 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.978 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.789 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.900 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.610 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.330 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.243 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.350 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 227.002 μs (5%) |         |  71.69 KiB (1%) |        3723 |
| `["missing_dot", "xf_nota"]`             | 234.402 μs (5%) |         |  71.86 KiB (1%) |        3731 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 206.252 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.215 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.273 ms (5%) |         |   6.10 MiB (1%) |      200009 |

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
       #1  2095 MHz       7549 s          0 s       1505 s      56721 s          0 s
       #2  2095 MHz      54204 s          0 s       1792 s       9971 s          0 s
       
  Memory: 6.764884948730469 GB (2720.84375 MB free)
  Uptime: 676.0 sec
  Load Avg:  1.0458984375  1.0537109375  0.68701171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 20:32
* Package commit: e1048e
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
| `["append!!", "eduction"]`               |  65.600 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  59.601 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.680 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.030 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          | 108.800 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  81.000 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 333.301 μs (5%) |         | 705.22 KiB (1%) |       16673 |
| `["dot", "blas"]`                        |   1.350 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.310 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.122 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.122 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  59.200 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 670.711 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 222.801 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 223.801 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 817.204 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 782.004 μs (5%) |         |   3.06 MiB (1%) |      100052 |
| `["findall", "xf-iter"]`                 |   3.297 ms (5%) |         |   9.63 MiB (1%) |      299932 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.451 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.121 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.153 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.391 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.576 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 455.202 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   7.592 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.372 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 867.004 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.576 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.565 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.300 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.671 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.583 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.584 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.594 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 296.305 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 223.403 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 192.203 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.978 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.789 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.778 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.330 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.571 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.340 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.590 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 203.001 μs (5%) |         |  72.22 KiB (1%) |        3747 |
| `["missing_dot", "xf_nota"]`             | 193.701 μs (5%) |         |  72.20 KiB (1%) |        3745 |
| `["overhead", "foldl"]`                  |   4.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 173.491 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.093 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.899 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2095 MHz       9131 s          0 s       1617 s      81262 s          0 s
       #2  2095 MHz      78836 s          0 s       1975 s      11384 s          0 s
       
  Memory: 6.764884948730469 GB (2644.296875 MB free)
  Uptime: 940.0 sec
  Load Avg:  1.0947265625  1.07080078125  0.7978515625
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

