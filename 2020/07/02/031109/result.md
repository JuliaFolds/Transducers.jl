# Multi-thread benchmark result

* Pull request commit: [`770bf1288c8391687907c4c812cbefd0d5ea4f17`](https://github.com/JuliaFolds/Transducers.jl/commit/770bf1288c8391687907c4c812cbefd0d5ea4f17)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/324> (Optimize append!!(dest, src::Foldable))

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 2 Jul 2020 - 03:05
    - Baseline: 2 Jul 2020 - 03:10
* Package commits:
    - Target: 091e34
    - Baseline: 146085
* Julia commits:
    - Target: 44fa15
    - Baseline: 44fa15
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: `JULIA_NUM_THREADS => 2`
    - Baseline: `JULIA_NUM_THREADS => 2`

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                                                  | time ratio                   | memory ratio  |
|-----------------------------------------------------|------------------------------|---------------|
| `["collect", "unordered", "basesize=1024"]`         |                1.12 (5%) :x: | 1.17 (1%) :x: |
| `["findfirst", "n=1000", "foldl"]`                  | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=500", "foldl"]`                   | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  | 0.89 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |
| `["overhead", "default"]`                           | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["overhead", "stoppable=false"]`                   |                1.08 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=16384"]` |                1.13 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                1.09 (5%) :x: | 1.15 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |                1.08 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=16384"]`  |                1.06 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.05 (5%) :x: | 1.02 (1%) :x: |
| `["parallel_histogram", "seq"]`                     |                1.08 (5%) :x: |    1.00 (1%)  |
| `["sum", "random", "foldl"]`                        | 0.90 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=128"]`       | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=256"]`       | 0.86 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=512"]`       | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "uniform", "foldl"]`                       | 0.88 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=128"]`      | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=256"]`      |                1.06 (5%) :x: |    1.00 (1%)  |
| `["sum", "valley", "foldl"]`                        | 0.86 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=128"]`       | 0.88 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=256"]`       | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["words", "nthreads=1"]`                           |                1.07 (5%) :x: | 1.01 (1%) :x: |
| `["words", "nthreads=2"]`                           |                   1.02 (5%)  | 1.01 (1%) :x: |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["collect", "assoc"]`
- `["collect"]`
- `["collect", "unordered"]`
- `["findfirst", "n=1000"]`
- `["findfirst", "n=1000", "reduce"]`
- `["findfirst", "n=400"]`
- `["findfirst", "n=400", "reduce"]`
- `["findfirst", "n=500"]`
- `["findfirst", "n=500", "reduce"]`
- `["overhead"]`
- `["parallel_histogram", "assoc"]`
- `["parallel_histogram", "comm"]`
- `["parallel_histogram"]`
- `["sum", "random"]`
- `["sum", "random", "reduce"]`
- `["sum", "uniform"]`
- `["sum", "uniform", "reduce"]`
- `["sum", "valley"]`
- `["sum", "valley", "reduce"]`
- `["words"]`

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
       #1  2294 MHz      54141 s          0 s       2304 s      17112 s          0 s
       #2  2294 MHz      49296 s          0 s       2894 s      21710 s          0 s
       
  Memory: 6.764884948730469 GB (2996.99609375 MB free)
  Uptime: 756.0 sec
  Load Avg:  1.68505859375  1.50439453125  0.90869140625
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
       #1  2294 MHz      77634 s          0 s       2966 s      23741 s          0 s
       #2  2294 MHz      72555 s          0 s       3549 s      28598 s          0 s
       
  Memory: 6.764884948730469 GB (3003.24609375 MB free)
  Uptime: 1066.0 sec
  Load Avg:  1.740234375  1.6201171875  1.12451171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 3:5
* Package commit: 091e34
* Julia commit: 44fa15
* Julia command flags: None
* Environment variables: `JULIA_NUM_THREADS => 2`

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                                  | time            | GC time   | memory          | allocations |
|-----------------------------------------------------|----------------:|----------:|----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 343.800 ms (5%) | 11.335 ms |  87.55 MiB (1%) |     1590754 |
| `["collect", "assoc", "basesize=1024"]`             | 189.228 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 191.289 ms (5%) |           |   5.64 MiB (1%) |       54010 |
| `["collect", "seq"]`                                | 363.319 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 468.834 ms (5%) |           |  29.19 MiB (1%) |      405064 |
| `["collect", "unordered", "basesize=1024"]`         | 272.427 ms (5%) |           | 898.70 KiB (1%) |       10609 |
| `["collect", "unordered", "basesize=32"]`           | 216.215 ms (5%) |           |   1.50 MiB (1%) |       18380 |
| `["findfirst", "n=1000", "foldl"]`                  | 588.229 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 304.490 ms (5%) |           | 563.98 KiB (1%) |       10226 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 305.562 ms (5%) |           | 287.23 KiB (1%) |        5225 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 304.308 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 439.298 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 228.180 ms (5%) |           |   1.02 MiB (1%) |       18980 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 227.393 ms (5%) |           | 526.08 KiB (1%) |        9569 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 223.347 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  72.295 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  35.265 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  35.438 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  38.921 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 184.001 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 198.801 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 355.102 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.070 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.868 ms (5%) |           |   2.07 MiB (1%) |         501 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.396 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.319 ms (5%) |           |   1.22 MiB (1%) |         266 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.112 ms (5%) |           |   1.05 MiB (1%) |        3785 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.983 ms (5%) |           |   1.22 MiB (1%) |         243 |
| `["parallel_histogram", "seq"]`                     |   7.266 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  12.166 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.194 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.587 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.412 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.699 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.655 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.803 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.563 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  12.171 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.739 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.801 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.826 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  44.848 ms (5%) |  8.944 ms |  65.03 MiB (1%) |     2103878 |
| `["words", "nthreads=2"]`                           |  22.640 ms (5%) |           |  65.39 MiB (1%) |     2103954 |
| `["words", "nthreads=4"]`                           |  23.116 ms (5%) |           |  66.10 MiB (1%) |     2104108 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["collect", "assoc"]`
- `["collect"]`
- `["collect", "unordered"]`
- `["findfirst", "n=1000"]`
- `["findfirst", "n=1000", "reduce"]`
- `["findfirst", "n=400"]`
- `["findfirst", "n=400", "reduce"]`
- `["findfirst", "n=500"]`
- `["findfirst", "n=500", "reduce"]`
- `["overhead"]`
- `["parallel_histogram", "assoc"]`
- `["parallel_histogram", "comm"]`
- `["parallel_histogram"]`
- `["sum", "random"]`
- `["sum", "random", "reduce"]`
- `["sum", "uniform"]`
- `["sum", "uniform", "reduce"]`
- `["sum", "valley"]`
- `["sum", "valley", "reduce"]`
- `["words"]`

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
       #1  2294 MHz      54141 s          0 s       2304 s      17112 s          0 s
       #2  2294 MHz      49296 s          0 s       2894 s      21710 s          0 s
       
  Memory: 6.764884948730469 GB (2996.99609375 MB free)
  Uptime: 756.0 sec
  Load Avg:  1.68505859375  1.50439453125  0.90869140625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 3:10
* Package commit: 146085
* Julia commit: 44fa15
* Julia command flags: None
* Environment variables: `JULIA_NUM_THREADS => 2`

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                                  | time            | GC time   | memory          | allocations |
|-----------------------------------------------------|----------------:|----------:|----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 330.847 ms (5%) | 11.689 ms |  87.55 MiB (1%) |     1590644 |
| `["collect", "assoc", "basesize=1024"]`             | 185.790 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 189.781 ms (5%) |           |   5.64 MiB (1%) |       54001 |
| `["collect", "seq"]`                                | 365.325 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 475.620 ms (5%) |           |  29.19 MiB (1%) |      405367 |
| `["collect", "unordered", "basesize=1024"]`         | 243.933 ms (5%) |           | 770.17 KiB (1%) |        2383 |
| `["collect", "unordered", "basesize=32"]`           | 220.646 ms (5%) |           |   1.50 MiB (1%) |       18505 |
| `["findfirst", "n=1000", "foldl"]`                  | 630.268 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 319.474 ms (5%) |           | 563.92 KiB (1%) |       10222 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 316.015 ms (5%) |           | 287.23 KiB (1%) |        5225 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 321.190 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 454.512 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 241.735 ms (5%) |           |   1.02 MiB (1%) |       18967 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 234.134 ms (5%) |           | 526.11 KiB (1%) |        9571 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 238.065 ms (5%) |           | 267.11 KiB (1%) |        4872 |
| `["findfirst", "n=500", "foldl"]`                   |  79.724 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  39.578 ms (5%) |           | 157.36 KiB (1%) |        2852 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  38.995 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  42.763 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 196.502 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 183.902 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 351.404 μs (5%) |           | 146.38 KiB (1%) |        2643 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.601 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.486 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.061 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.559 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.063 ms (5%) |           |   1.03 MiB (1%) |        2463 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.462 ms (5%) |           |   1.23 MiB (1%) |         872 |
| `["parallel_histogram", "seq"]`                     |   6.727 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  13.590 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.602 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.680 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.776 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  13.367 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.212 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.437 ms (5%) |           | 155.13 KiB (1%) |        3013 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.731 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  14.129 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.626 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.367 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.811 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  41.764 ms (5%) |  7.756 ms |  64.37 MiB (1%) |     2082484 |
| `["words", "nthreads=2"]`                           |  22.092 ms (5%) |           |  64.72 MiB (1%) |     2082560 |
| `["words", "nthreads=4"]`                           |  22.907 ms (5%) |           |  65.63 MiB (1%) |     2082857 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["collect", "assoc"]`
- `["collect"]`
- `["collect", "unordered"]`
- `["findfirst", "n=1000"]`
- `["findfirst", "n=1000", "reduce"]`
- `["findfirst", "n=400"]`
- `["findfirst", "n=400", "reduce"]`
- `["findfirst", "n=500"]`
- `["findfirst", "n=500", "reduce"]`
- `["overhead"]`
- `["parallel_histogram", "assoc"]`
- `["parallel_histogram", "comm"]`
- `["parallel_histogram"]`
- `["sum", "random"]`
- `["sum", "random", "reduce"]`
- `["sum", "uniform"]`
- `["sum", "uniform", "reduce"]`
- `["sum", "valley"]`
- `["sum", "valley", "reduce"]`
- `["words"]`

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
       #1  2294 MHz      77634 s          0 s       2966 s      23741 s          0 s
       #2  2294 MHz      72555 s          0 s       3549 s      28598 s          0 s
       
  Memory: 6.764884948730469 GB (3003.24609375 MB free)
  Uptime: 1066.0 sec
  Load Avg:  1.740234375  1.6201171875  1.12451171875
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
    CPU MHz:             2294.683
    BogoMIPS:            4589.36
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

