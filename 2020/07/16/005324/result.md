# Benchmark result

* Pull request commit: [`eed419221c225038b7bd2e16196dacccbc059ec5`](https://github.com/JuliaFolds/Transducers.jl/commit/eed419221c225038b7bd2e16196dacccbc059ec5)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 16 Jul 2020 - 00:47
    - Baseline: 16 Jul 2020 - 00:52
* Package commits:
    - Target: bb9651
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
| `["append!!", "eduction"]`               |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["append!!", "xf"]`                     |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["cat", "base"]`                        | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["cat", "xf"]`                          | 0.75 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["dict", "base"]`                       |                1.21 (5%) :x: |                   1.00 (1%)  |
| `["dict", "xf"]`                         |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["dot", "blas"]`                        |                1.10 (5%) :x: |                   1.00 (1%)  |
| `["dot", "man"]`                         | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findall", "xf-array"]`                | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.73 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.67 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   | 0.69 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "256"]` | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "32"]`  | 0.71 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.64 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.39 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.63 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "256"]`  | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 0.75 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.79 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.71 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.68 (5%) :white_check_mark: | 0.50 (1%) :white_check_mark: |
| `["mapcat_eduction", "base"]`            | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "rf"]`               |                1.17 (5%) :x: |                   1.00 (1%)  |
| `["missing_argmax", "xf"]`               | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.84 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                  | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["partition_by", "xf"]`                 |                1.06 (5%) :x: |                   1.00 (1%)  |

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
       #1  2095 MHz      44020 s          0 s       1604 s      26487 s          0 s
       #2  2095 MHz      25018 s          0 s       1971 s      45792 s          0 s
       
  Memory: 6.7648773193359375 GB (2609.16796875 MB free)
  Uptime: 751.0 sec
  Load Avg:  1.0  0.9599609375  0.62548828125
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
       #1  2095 MHz      55483 s          0 s       1775 s      49238 s          0 s
       #2  2095 MHz      47476 s          0 s       2351 s      57319 s          0 s
       
  Memory: 6.7648773193359375 GB (2574.9921875 MB free)
  Uptime: 1096.0 sec
  Load Avg:  1.0107421875  1.0  0.759765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 16 Jul 2020 - 0:47
* Package commit: bb9651
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
| `["append!!", "eduction"]`               |  17.400 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  16.500 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.560 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.650 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          |  94.200 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  70.900 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 266.200 μs (5%) |         | 705.00 KiB (1%) |       16657 |
| `["dict", "base"]`                       |   4.121 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   3.901 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.210 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.080 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.810 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.850 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  63.900 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 591.700 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 192.800 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 193.001 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 721.601 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 724.201 μs (5%) |         |   3.06 MiB (1%) |      100042 |
| `["findall", "xf-iter"]`                 |   2.737 ms (5%) |         |   9.63 MiB (1%) |      299929 |
| `["gemm", "fusedmul", "blas", "16"]`     |   3.865 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.077 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.666 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.168 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   3.689 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 454.600 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   7.911 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.823 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 746.201 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.489 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 202.098 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.340 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.950 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 346.977 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.353 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.263 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 318.298 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.344 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   3.925 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 332.673 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.343 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.150 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 316.883 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.363 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.150 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 300.392 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.345 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.014 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 356.459 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 143.700 μs (5%) |         | 157.84 KiB (1%) |       10019 |
| `["groupby", "sum", "xf-with-init"]`     | 155.300 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 153.401 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.570 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.590 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.600 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.233 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.489 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.100 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.240 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   3.962 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.150 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.260 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 176.700 μs (5%) |         |  72.05 KiB (1%) |        3740 |
| `["missing_dot", "xf_nota"]`             | 176.900 μs (5%) |         |  72.30 KiB (1%) |        3748 |
| `["overhead", "foldl"]`                  |   3.600 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 154.479 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.668 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.780 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.444 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   3.845 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
       #1  2095 MHz      44020 s          0 s       1604 s      26487 s          0 s
       #2  2095 MHz      25018 s          0 s       1971 s      45792 s          0 s
       
  Memory: 6.7648773193359375 GB (2609.16796875 MB free)
  Uptime: 751.0 sec
  Load Avg:  1.0  0.9599609375  0.62548828125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 16 Jul 2020 - 0:52
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
| `["append!!", "eduction"]`               |  16.100 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  15.700 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.680 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.200 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          |  93.200 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  73.900 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 267.100 μs (5%) |         | 705.47 KiB (1%) |       16685 |
| `["dict", "base"]`                       |   3.418 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   3.493 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.100 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.170 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.820 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.860 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  61.700 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 573.900 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.900 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 191.900 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 740.201 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 775.100 μs (5%) |         |   3.05 MiB (1%) |       99754 |
| `["findall", "xf-iter"]`                 |   2.815 ms (5%) |         |   9.63 MiB (1%) |      299930 |
| `["gemm", "fusedmul", "blas", "16"]`     |   3.884 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.114 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.509 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.138 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   3.790 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 452.301 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.009 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.887 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 757.201 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.469 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.200 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.447 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.600 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.458 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.470 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.440 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.469 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.100 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 210.200 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 154.500 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 152.600 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.840 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.600 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.600 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.233 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.133 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.444 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.480 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   3.950 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.200 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 176.000 μs (5%) |         |  71.80 KiB (1%) |        3728 |
| `["missing_dot", "xf_nota"]`             | 174.700 μs (5%) |         |  72.19 KiB (1%) |        3744 |
| `["overhead", "foldl"]`                  |   3.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 154.479 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.691 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.618 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.452 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   3.791 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
       #1  2095 MHz      55483 s          0 s       1775 s      49238 s          0 s
       #2  2095 MHz      47476 s          0 s       2351 s      57319 s          0 s
       
  Memory: 6.7648773193359375 GB (2574.9921875 MB free)
  Uptime: 1096.0 sec
  Load Avg:  1.0107421875  1.0  0.759765625
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

