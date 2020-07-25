# Benchmark result

* Pull request commit: [`9e036c7a57306ff0f908f65f30ebd4c47b051fee`](https://github.com/JuliaFolds/Transducers.jl/commit/9e036c7a57306ff0f908f65f30ebd4c47b051fee)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/368> (Use LiterateTest)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 25 Jul 2020 - 04:57
    - Baseline: 25 Jul 2020 - 05:02
* Package commits:
    - Target: 92bfc0
    - Baseline: e0e766
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
| `["cat", "xf"]`                          | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "man"]`             | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.07 (5%) :x: |   1.00 (1%)  |
| `["findall", "xf-array"]`                | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       |                1.09 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "2"]`        |                1.13 (5%) :x: |   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       |                1.09 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   |                1.09 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.23 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.42 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["groupby", "sum", "xf-without-init"]`  | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["mapcat_eduction", "xf-eduction"]`     | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2095 MHz      39047 s          0 s       1499 s      47158 s          0 s
       #2  2095 MHz      29588 s          0 s       1693 s      56974 s          0 s
       
  Memory: 6.764884948730469 GB (2877.3984375 MB free)
  Uptime: 898.0 sec
  Load Avg:  1.0537109375  1.01220703125  0.68798828125
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
       #1  2095 MHz      39507 s          0 s       1565 s      75895 s          0 s
       #2  2095 MHz      58300 s          0 s       1829 s      57329 s          0 s
       
  Memory: 6.764884948730469 GB (2822.8828125 MB free)
  Uptime: 1192.0 sec
  Load Avg:  1.0087890625  1.02880859375  0.80322265625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 4:57
* Package commit: 92bfc0
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
| `["append!!", "eduction"]`               |  22.402 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  22.502 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   2.167 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.478 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 132.108 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  90.606 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 385.725 μs (5%) |         | 705.13 KiB (1%) |       16665 |
| `["dict", "base"]`                       |   5.109 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   5.268 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.490 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.500 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.756 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  63.503 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 932.849 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.617 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.518 μs (5%) |         |                 |             |
| `["findall", "base"]`                    |   1.013 ms (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 964.259 μs (5%) |         |   2.98 MiB (1%) |       97450 |
| `["findall", "xf-iter"]`                 |   4.291 ms (5%) |         |   9.63 MiB (1%) |      299937 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.141 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.845 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.104 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.996 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.787 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 579.431 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.094 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.330 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.110 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.713 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 304.835 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.930 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.367 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 478.087 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.976 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 478.087 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.951 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   6.080 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 613.177 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.936 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.383 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 482.684 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   2.000 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.729 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 566.332 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.923 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   5.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 475.536 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 321.416 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 226.112 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 237.013 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.345 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.345 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.522 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.200 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   4.013 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.830 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.730 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.167 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.690 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.830 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 261.715 μs (5%) |         |  72.14 KiB (1%) |        3743 |
| `["missing_dot", "xf_nota"]`             | 261.016 μs (5%) |         |  72.36 KiB (1%) |        3752 |
| `["overhead", "foldl"]`                  |   5.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 223.423 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.592 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.826 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   5.999 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.624 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
       #1  2095 MHz      39047 s          0 s       1499 s      47158 s          0 s
       #2  2095 MHz      29588 s          0 s       1693 s      56974 s          0 s
       
  Memory: 6.764884948730469 GB (2877.3984375 MB free)
  Uptime: 898.0 sec
  Load Avg:  1.0537109375  1.01220703125  0.68798828125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 5:2
* Package commit: e0e766
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
| `["append!!", "eduction"]`               |  22.502 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  22.402 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   2.156 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.945 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 133.516 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  89.711 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 385.949 μs (5%) |         | 705.13 KiB (1%) |       16665 |
| `["dict", "base"]`                       |   5.112 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   5.222 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.500 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.480 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.678 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.756 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  73.407 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 875.581 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 287.533 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 287.433 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 982.220 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                |   1.050 ms (5%) |         |   2.96 MiB (1%) |       97004 |
| `["findall", "xf-iter"]`                 |   4.153 ms (5%) |         |   9.63 MiB (1%) |      299946 |
| `["gemm", "fusedmul", "blas", "16"]`     |   5.172 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.850 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   7.165 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   4.054 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.388 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 514.549 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.323 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.234 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       |   1.110 ms (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   2.031 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   5.400 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   2.004 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 600.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   2.016 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   5.600 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 500.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   2.038 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   5.400 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 600.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   2.007 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   4.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   2.042 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   6.300 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 500.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 331.230 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 266.524 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 259.923 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   2.345 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   2.522 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.522 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   3.350 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.113 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   4.013 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.820 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.730 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   6.134 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.700 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.810 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 264.329 μs (5%) |         |  72.17 KiB (1%) |        3745 |
| `["missing_dot", "xf_nota"]`             | 267.931 μs (5%) |         |  72.16 KiB (1%) |        3741 |
| `["overhead", "foldl"]`                  |   5.800 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 224.257 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.603 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.786 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   6.009 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   5.625 ms (5%) |         |  49.63 KiB (1%) |          21 |

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
       #1  2095 MHz      39507 s          0 s       1565 s      75895 s          0 s
       #2  2095 MHz      58300 s          0 s       1829 s      57329 s          0 s
       
  Memory: 6.764884948730469 GB (2822.8828125 MB free)
  Uptime: 1192.0 sec
  Load Avg:  1.0087890625  1.02880859375  0.80322265625
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
    CPU MHz:             2095.228
    BogoMIPS:            4190.45
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

