# Benchmark result

* Pull request commit: [`c348022d830577b532f4e486d729dac6f82630a8`](https://github.com/JuliaFolds/Transducers.jl/commit/c348022d830577b532f4e486d729dac6f82630a8)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Jul 2020 - 07:31
    - Baseline: 3 Jul 2020 - 07:35
* Package commits:
    - Target: 85ac34
    - Baseline: b4848b
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
| `["append!!", "eduction"]`               | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["cat", "base"]`                        |                1.08 (5%) :x: |   1.00 (1%)  |
| `["dot", "man"]`                         | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["dot", "xf"]`                          | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "man"]`             |                1.07 (5%) :x: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.05 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "32"]`     |                1.06 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        | 0.83 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  |                1.07 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.06 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.23 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.21 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.07 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.79 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.36 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.05 (5%) :x: |   1.00 (1%)  |
| `["missing_argmax", "man"]`              | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "xf"]`               | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_dot", "man"]`                 |                1.19 (5%) :x: |   1.00 (1%)  |
| `["partition_by", "xf"]`                 | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2095 MHz      34108 s          0 s       1591 s      27325 s          0 s
       #2  2095 MHz      25410 s          0 s       1496 s      36749 s          0 s
       
  Memory: 6.764884948730469 GB (2981.1484375 MB free)
  Uptime: 651.0 sec
  Load Avg:  1.15576171875  1.0185546875  0.61865234375
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
       #1  2095 MHz      45817 s          0 s       1726 s      38997 s          0 s
       #2  2095 MHz      37265 s          0 s       1570 s      48316 s          0 s
       
  Memory: 6.764884948730469 GB (2956.9765625 MB free)
  Uptime: 887.0 sec
  Load Avg:  1.00439453125  1.01806640625  0.72314453125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 7:31
* Package commit: 85ac34
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
| `["append!!", "eduction"]`               |  52.207 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  52.107 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.570 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.540 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  92.011 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  67.708 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 256.632 μs (5%) |         | 704.94 KiB (1%) |       16653 |
| `["dot", "blas"]`                        |   1.080 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.030 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.800 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.822 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  71.905 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 590.939 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.820 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 192.020 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 689.980 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 647.673 μs (5%) |         |   3.05 MiB (1%) |       99914 |
| `["findall", "xf-iter"]`                 |   2.795 ms (5%) |         |   9.63 MiB (1%) |      299919 |
| `["gemm", "fusedmul", "blas", "16"]`     |   3.848 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   2.977 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.447 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.064 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.520 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 548.637 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.691 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.897 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 749.171 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 205.364 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.359 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.963 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 317.415 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.380 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.250 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 368.536 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.367 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   3.938 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 362.708 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.361 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.950 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 315.678 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.379 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.138 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 408.052 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.359 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.043 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 316.265 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 209.314 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 156.110 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 151.309 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.234 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.089 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.145 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.220 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.340 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   3.957 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.240 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 178.118 μs (5%) |         |  72.13 KiB (1%) |        3744 |
| `["missing_dot", "xf_nota"]`             | 179.318 μs (5%) |         |  72.13 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   3.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 152.438 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.663 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.500 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2095 MHz      34108 s          0 s       1591 s      27325 s          0 s
       #2  2095 MHz      25410 s          0 s       1496 s      36749 s          0 s
       
  Memory: 6.764884948730469 GB (2981.1484375 MB free)
  Uptime: 651.0 sec
  Load Avg:  1.15576171875  1.0185546875  0.61865234375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 7:35
* Package commit: b4848b
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
| `["append!!", "eduction"]`               |  57.503 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  51.703 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.450 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.510 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  89.005 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  65.703 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 267.014 μs (5%) |         | 705.11 KiB (1%) |       16662 |
| `["dot", "blas"]`                        |   1.100 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.150 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.789 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.089 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  67.303 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 561.825 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.809 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 191.909 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 686.036 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 645.533 μs (5%) |         |   3.05 MiB (1%) |       99782 |
| `["findall", "xf-iter"]`                 |   2.696 ms (5%) |         |   9.63 MiB (1%) |      299929 |
| `["gemm", "fusedmul", "blas", "16"]`     |   3.816 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   2.953 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.138 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.111 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.559 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 600.227 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.010 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.274 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 749.137 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.500 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 200.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.448 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.700 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.432 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.300 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.445 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.451 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.426 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.200 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.439 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   3.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 208.309 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 155.607 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 151.607 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.600 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.078 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.467 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.190 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.130 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   3.915 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.170 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.230 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 170.508 μs (5%) |         |  72.17 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 177.008 μs (5%) |         |  72.27 KiB (1%) |        3747 |
| `["overhead", "foldl"]`                  |   3.900 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 149.524 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.676 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.898 ms (5%) |         |   6.10 MiB (1%) |      200007 |

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
       #1  2095 MHz      45817 s          0 s       1726 s      38997 s          0 s
       #2  2095 MHz      37265 s          0 s       1570 s      48316 s          0 s
       
  Memory: 6.764884948730469 GB (2956.9765625 MB free)
  Uptime: 887.0 sec
  Load Avg:  1.00439453125  1.01806640625  0.72314453125
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
    CPU MHz:             2095.247
    BogoMIPS:            4190.49
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

