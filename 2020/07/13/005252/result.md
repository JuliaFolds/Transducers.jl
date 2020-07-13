# Benchmark result

* Pull request commit: [`a13ff3bc7c1d012f35dc69dcfd3b63c373ea217b`](https://github.com/JuliaFolds/Transducers.jl/commit/a13ff3bc7c1d012f35dc69dcfd3b63c373ea217b)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 13 Jul 2020 - 00:47
    - Baseline: 13 Jul 2020 - 00:52
* Package commits:
    - Target: 459cf9
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
| `["append!!", "xf"]`                     | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["cat", "base"]`                        |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["dot", "man"]`                         |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["dot", "xf"]`                          |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["filter_map_map!", "man"]`             | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              | 0.84 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["filter_map_reduce", "xf"]`            | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findall", "xf-array"]`                |                   1.01 (5%)  | 0.99 (1%) :white_check_mark: |
| `["gemm", "fusedmul", "blas", "8"]`      | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "256"]`       |                1.10 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` |                1.14 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "256"]` |                1.17 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`  | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.74 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.77 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "256"]`  | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.75 (5%) :white_check_mark: | 0.50 (1%) :white_check_mark: |
| `["groupby", "sum", "xf-without-init"]`  | 0.81 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["mapcat_eduction", "xf-eduction"]`     | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["mapcat_eduction", "xf-xf"]`           | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "xf"]`               |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "rf"]`                  | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             |                1.21 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "xf_nota"]`             |                1.12 (5%) :x: |                   1.00 (1%)  |

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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      36298 s          0 s       1541 s      31934 s          0 s
       #2  2095 MHz      29675 s          0 s       1725 s      38625 s          0 s
       
  Memory: 6.764884948730469 GB (2720.34375 MB free)
  Uptime: 717.0 sec
  Load Avg:  1.046875  0.99267578125  0.642578125
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
       #1  2095 MHz      61150 s          0 s       1764 s      39097 s          0 s
       #2  2095 MHz      36774 s          0 s       1972 s      63549 s          0 s
       
  Memory: 6.764884948730469 GB (2653.37109375 MB free)
  Uptime: 1041.0 sec
  Load Avg:  1.0  1.0  0.76171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 13 Jul 2020 - 0:47
* Package commit: 459cf9
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
| `["append!!", "eduction"]`               |  20.502 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  20.402 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   2.089 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.611 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 113.009 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  82.307 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 348.229 μs (5%) |         | 705.31 KiB (1%) |       16679 |
| `["dict", "base"]`                       |   4.532 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.819 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.390 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.420 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.434 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.467 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  56.502 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 709.034 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 255.818 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 226.616 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 906.370 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 886.667 μs (5%) |         |   3.00 MiB (1%) |       98160 |
| `["findall", "xf-iter"]`                 |   3.698 ms (5%) |         |   9.63 MiB (1%) |      299917 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.797 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.581 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.361 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.630 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.419 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 538.527 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.532 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.371 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 971.463 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.363 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 271.120 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.819 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.129 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 551.898 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.839 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.686 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 369.367 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.829 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.234 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 443.965 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.805 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.133 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 424.146 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.640 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 401.020 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.592 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.184 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 470.457 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 194.109 μs (5%) |         | 157.84 KiB (1%) |       10019 |
| `["groupby", "sum", "xf-with-init"]`     | 208.810 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 189.908 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.067 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.245 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.133 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.978 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.856 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.600 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.710 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.520 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.500 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.980 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 231.116 μs (5%) |         |  72.25 KiB (1%) |        3746 |
| `["missing_dot", "xf_nota"]`             | 235.916 μs (5%) |         |  72.30 KiB (1%) |        3748 |
| `["overhead", "foldl"]`                  |   5.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 200.016 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.286 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.410 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.538 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.174 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      36298 s          0 s       1541 s      31934 s          0 s
       #2  2095 MHz      29675 s          0 s       1725 s      38625 s          0 s
       
  Memory: 6.764884948730469 GB (2720.34375 MB free)
  Uptime: 717.0 sec
  Load Avg:  1.046875  0.99267578125  0.642578125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 13 Jul 2020 - 0:52
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
| `["append!!", "eduction"]`               |  21.001 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  21.901 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.933 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.611 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 112.505 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  81.203 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 344.313 μs (5%) |         | 705.17 KiB (1%) |       16670 |
| `["dict", "base"]`                       |   4.616 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.778 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.390 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.340 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.411 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.222 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  63.406 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 845.374 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 256.010 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 255.710 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 912.436 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 880.534 μs (5%) |         |   3.03 MiB (1%) |       99224 |
| `["findall", "xf-iter"]`                 |   3.771 ms (5%) |         |   9.63 MiB (1%) |      299940 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.869 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.606 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   6.678 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.822 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   3.918 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 539.650 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.199 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.233 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 886.733 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.590 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 600.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.576 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.201 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.732 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.721 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   6.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.747 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.400 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.713 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.000 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 259.222 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 213.418 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 233.220 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.078 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.367 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.367 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.978 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.822 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.200 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.970 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.550 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   5.417 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.520 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.640 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 232.709 μs (5%) |         |  72.28 KiB (1%) |        3746 |
| `["missing_dot", "xf_nota"]`             | 210.908 μs (5%) |         |  72.14 KiB (1%) |        3740 |
| `["overhead", "foldl"]`                  |   5.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 202.664 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.351 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.496 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.540 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.121 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      61150 s          0 s       1764 s      39097 s          0 s
       #2  2095 MHz      36774 s          0 s       1972 s      63549 s          0 s
       
  Memory: 6.764884948730469 GB (2653.37109375 MB free)
  Uptime: 1041.0 sec
  Load Avg:  1.0  1.0  0.76171875
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
    CPU MHz:             2095.195
    BogoMIPS:            4190.39
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

