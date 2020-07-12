# Benchmark result

* Pull request commit: [`d924e9dab57e98918e8e9f7dc6ddad2877356cd5`](https://github.com/JuliaFolds/Transducers.jl/commit/d924e9dab57e98918e8e9f7dc6ddad2877356cd5)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/361> (Define `Set(foldable)` and `Dict(foldable)`)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 06:55
    - Baseline: 12 Jul 2020 - 07:00
* Package commits:
    - Target: 57dbcd
    - Baseline: cbc633
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
| `["cat", "xf"]`                          |                1.41 (5%) :x: |                   1.00 (1%)  |
| `["collect", "identity-float"]`          |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["dict", "xf"]`                         | 0.13 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |
| `["filter_map_map!", "man"]`             |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "blas", "8"]`      |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        |                1.42 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        |                1.16 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  |                1.10 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   |                1.25 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 0.76 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    |                1.14 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "xf-with-init"]`     | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.77 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_argmax", "xf"]`               |                1.28 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "equiv"]`               | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             | 0.86 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["missing_dot", "xf"]`                  |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                  |                1.15 (5%) :x: |                   1.00 (1%)  |
| `["set", "base"]`                        | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["set", "xf"]`                          | 0.06 (5%) :white_check_mark: | 0.00 (1%) :white_check_mark: |

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
       #1  2095 MHz      22668 s          0 s       1382 s      43676 s          0 s
       #2  2095 MHz      41832 s          0 s       1626 s      25036 s          0 s
       
  Memory: 6.764884948730469 GB (2415.078125 MB free)
  Uptime: 700.0 sec
  Load Avg:  1.0  0.955078125  0.60205078125
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
       #1  2095 MHz      48538 s          0 s       1500 s      44958 s          0 s
       #2  2095 MHz      43190 s          0 s       1680 s      50891 s          0 s
       
  Memory: 6.764884948730469 GB (2442.00390625 MB free)
  Uptime: 973.0 sec
  Load Avg:  1.12890625  1.0302734375  0.73193359375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 6:55
* Package commit: 57dbcd
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
| `["append!!", "eduction"]`               |  51.904 μs (5%) |         |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  52.303 μs (5%) |         |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.440 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.150 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  91.705 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  66.104 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 262.517 μs (5%) |         | 705.31 KiB (1%) |       16679 |
| `["dict", "base"]`                       |   3.781 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   3.886 ms (5%) |         |  92.47 KiB (1%) |          26 |
| `["dot", "blas"]`                        |   1.040 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.000 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.800 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.790 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  67.903 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 637.521 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.910 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 191.711 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 685.639 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 641.436 μs (5%) |         |   3.04 MiB (1%) |       99641 |
| `["findall", "xf-iter"]`                 |   2.864 ms (5%) |         |   9.63 MiB (1%) |      299949 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.105 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.023 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.613 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.176 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.561 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 570.820 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.906 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.558 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 755.535 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 210.189 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.448 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.950 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 319.322 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.440 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.238 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 375.624 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.445 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.013 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 332.896 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.450 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.938 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 319.664 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.435 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.125 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 303.980 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.454 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.572 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 319.755 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 215.507 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 157.705 μs (5%) |         | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 159.405 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.233 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.067 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.656 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.210 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.160 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.038 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.210 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 179.509 μs (5%) |         |  72.14 KiB (1%) |        3741 |
| `["missing_dot", "xf_nota"]`             | 175.609 μs (5%) |         |  72.00 KiB (1%) |        3734 |
| `["overhead", "foldl"]`                  |   4.500 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 153.065 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.738 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.584 ms (5%) |         |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   4.489 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.212 ms (5%) |         |  49.81 KiB (1%) |          29 |

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
       #1  2095 MHz      22668 s          0 s       1382 s      43676 s          0 s
       #2  2095 MHz      41832 s          0 s       1626 s      25036 s          0 s
       
  Memory: 6.764884948730469 GB (2415.078125 MB free)
  Uptime: 700.0 sec
  Load Avg:  1.0  0.955078125  0.60205078125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:0
* Package commit: cbc633
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
| `["append!!", "eduction"]`               |  53.901 μs (5%) |          |  65.63 KiB (1%) |          74 |
| `["append!!", "xf"]`                     |  55.002 μs (5%) |          |  67.19 KiB (1%) |         124 |
| `["cat", "base"]`                        |   1.440 μs (5%) |          |                 |             |
| `["cat", "xf"]`                          |   1.520 μs (5%) |          |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  88.903 μs (5%) |          | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  61.802 μs (5%) |          | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 265.607 μs (5%) |          | 705.23 KiB (1%) |       16672 |
| `["dict", "base"]`                       |   3.750 ms (5%) |          |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |  30.385 ms (5%) | 3.336 ms |  53.71 MiB (1%) |     1502541 |
| `["dot", "blas"]`                        |   1.020 μs (5%) |          |                 |             |
| `["dot", "man"]`                         | 980.000 ns (5%) |          |                 |             |
| `["dot", "rf"]`                          |   1.800 μs (5%) |          |                 |             |
| `["dot", "xf"]`                          |   1.790 μs (5%) |          |                 |             |
| `["filter_map_map!", "man"]`             |  62.405 μs (5%) |          |                 |             |
| `["filter_map_map!", "xf"]`              | 634.454 μs (5%) |          |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.705 μs (5%) |          |                 |             |
| `["filter_map_reduce", "xf"]`            | 191.605 μs (5%) |          |                 |             |
| `["findall", "base"]`                    | 672.618 μs (5%) |          |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 638.217 μs (5%) |          |   3.05 MiB (1%) |       99720 |
| `["findall", "xf-iter"]`                 |   2.790 ms (5%) |          |   9.63 MiB (1%) |      299921 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.037 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   2.991 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.552 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   2.870 ms (5%) |          |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.729 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 598.153 μs (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   9.517 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.795 ms (5%) |          |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 760.320 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.500 μs (5%) |          |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 200.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.402 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.600 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 300.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.388 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.300 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 300.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.394 ms (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.200 μs (5%) |          |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |          |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.402 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.700 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 300.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.392 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.200 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 400.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.415 ms (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.000 μs (5%) |          |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 300.000 ns (5%) |          |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 212.318 μs (5%) |          | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 167.914 μs (5%) |          | 157.47 KiB (1%) |       10010 |
| `["groupby", "sum", "xf-without-init"]`  | 160.514 μs (5%) |          | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.233 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.689 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.078 μs (5%) |          |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.430 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.140 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.050 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.160 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.400 μs (5%) |          |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 168.904 μs (5%) |          |  72.14 KiB (1%) |        3745 |
| `["missing_dot", "xf_nota"]`             | 170.304 μs (5%) |          |  72.17 KiB (1%) |        3745 |
| `["overhead", "foldl"]`                  |   3.900 ns (5%) |          |                 |             |
| `["overhead", "reduce_basecase"]`        | 149.026 ns (5%) |          |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.740 ms (5%) |          |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.631 ms (5%) |          |   6.10 MiB (1%) |      200009 |
| `["set", "base"]`                        |   4.731 ms (5%) |          |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |  66.463 ms (5%) | 4.637 ms |  59.77 MiB (1%) |     1907785 |

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
       #1  2095 MHz      48538 s          0 s       1500 s      44958 s          0 s
       #2  2095 MHz      43190 s          0 s       1680 s      50891 s          0 s
       
  Memory: 6.764884948730469 GB (2442.00390625 MB free)
  Uptime: 973.0 sec
  Load Avg:  1.12890625  1.0302734375  0.73193359375
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
    CPU MHz:             2095.160
    BogoMIPS:            4190.32
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

