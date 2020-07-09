# Benchmark result

* Pull request commit: [`09eedd805701c39ca9bfb3b35792f1123e998cbb`](https://github.com/JuliaFolds/Transducers.jl/commit/09eedd805701c39ca9bfb3b35792f1123e998cbb)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/344> (Associative string-splitting transducer)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 9 Jul 2020 - 19:37
    - Baseline: 9 Jul 2020 - 19:41
* Package commits:
    - Target: 18ec22
    - Baseline: 31b233
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
| `["append!!", "eduction"]`               |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["append!!", "xf"]`                     |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["cat", "xf"]`                          |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["findall", "xf-array"]`                | 0.95 (5%) :white_check_mark: | 0.98 (1%) :white_check_mark: |
| `["gemm", "mul", "man", "false", "32"]`  |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.30 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.29 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.33 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.31 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.33 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "man"]`                 |                1.17 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.08 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      44107 s          0 s       1290 s      25748 s          0 s
       #2  2294 MHz      17571 s          0 s       1636 s      52787 s          0 s
       
  Memory: 6.764884948730469 GB (2822.35546875 MB free)
  Uptime: 733.0 sec
  Load Avg:  1.3173828125  1.0947265625  0.66015625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      67122 s          0 s       1474 s      27783 s          0 s
       #2  2294 MHz      19773 s          0 s       1766 s      75702 s          0 s
       
  Memory: 6.764884948730469 GB (2726.95703125 MB free)
  Uptime: 986.0 sec
  Load Avg:  1.087890625  1.0966796875  0.78125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 19:37
* Package commit: 18ec22
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
| `["append!!", "eduction"]`               |  57.801 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  59.401 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.640 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.690 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  87.501 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  70.701 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 264.802 μs (5%) |         | 705.27 KiB (1%) |       16676 |
| `["dot", "blas"]`                        |   2.267 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.256 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   3.050 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   3.063 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  64.300 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 533.203 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 194.901 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 194.901 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 750.805 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 669.904 μs (5%) |         |   2.98 MiB (1%) |       97666 |
| `["findall", "xf-iter"]`                 |   2.792 ms (5%) |         |   9.63 MiB (1%) |      299934 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.973 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.488 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.068 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.757 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.809 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 606.503 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.830 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.429 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.209 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.737 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 297.421 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.204 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   7.280 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 390.050 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.171 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.060 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 387.192 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.193 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 405.500 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.185 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.860 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 398.010 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.168 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   6.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 393.564 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.184 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   7.240 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 397.512 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 213.201 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 157.800 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 157.201 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              | 950.000 ns (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.122 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.133 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               | 915.113 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.283 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.057 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  | 884.211 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             | 919.231 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 189.401 μs (5%) |         |  72.20 KiB (1%) |        3741 |
| `["missing_dot", "xf_nota"]`             | 183.301 μs (5%) |         |  71.97 KiB (1%) |        3737 |
| `["overhead", "foldl"]`                  |   4.200 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 159.138 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.633 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.474 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      44107 s          0 s       1290 s      25748 s          0 s
       #2  2294 MHz      17571 s          0 s       1636 s      52787 s          0 s
       
  Memory: 6.764884948730469 GB (2822.35546875 MB free)
  Uptime: 733.0 sec
  Load Avg:  1.3173828125  1.0947265625  0.66015625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 19:41
* Package commit: 31b233
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
| `["append!!", "eduction"]`               |  53.000 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  53.201 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.660 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.600 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  90.200 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  70.200 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 265.501 μs (5%) |         | 705.34 KiB (1%) |       16677 |
| `["dot", "blas"]`                        |   2.256 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   2.244 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   3.050 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   3.050 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  67.001 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 537.006 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 194.900 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 194.900 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 742.603 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 705.603 μs (5%) |         |   3.03 MiB (1%) |       99274 |
| `["findall", "xf-iter"]`                 |   2.921 ms (5%) |         |   9.63 MiB (1%) |      299929 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.976 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.493 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.071 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.752 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.864 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 606.507 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.733 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.439 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.210 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   4.294 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   6.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   4.169 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   6.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   4.193 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   4.182 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   7.000 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   4.162 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   5.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   4.208 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 204.603 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 157.002 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 154.101 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              | 920.000 ns (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.167 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.111 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               | 973.585 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.100 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.057 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  | 863.158 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             | 932.692 ns (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 185.001 μs (5%) |         |  72.13 KiB (1%) |        3741 |
| `["missing_dot", "xf_nota"]`             | 182.900 μs (5%) |         |  72.30 KiB (1%) |        3747 |
| `["overhead", "foldl"]`                  |   3.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 161.294 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.641 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.458 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      67122 s          0 s       1474 s      27783 s          0 s
       #2  2294 MHz      19773 s          0 s       1766 s      75702 s          0 s
       
  Memory: 6.764884948730469 GB (2726.95703125 MB free)
  Uptime: 986.0 sec
  Load Avg:  1.087890625  1.0966796875  0.78125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
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
    Model:               79
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz
    Stepping:            1
    CPU MHz:             2294.688
    BogoMIPS:            4589.37
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            51200K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Broadwell                                              |
| Model              | Family: 0x06, Model: 0x4f, Stepping: 0x01, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 44 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

