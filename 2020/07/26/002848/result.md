# Multi-thread benchmark result

* Pull request commit: [`9fda5deee75154f22928eb6654cf063e21469f73`](https://github.com/JuliaFolds/Transducers.jl/commit/9fda5deee75154f22928eb6654cf063e21469f73)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/371> (Modernize missing value tutorial)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 26 Jul 2020 - 00:23
    - Baseline: 26 Jul 2020 - 00:28
* Package commits:
    - Target: 41071e
    - Baseline: 525658
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

| ID                                                  | time ratio                   | memory ratio                 |
|-----------------------------------------------------|------------------------------|------------------------------|
| `["collect", "assoc", "basesize=1"]`                | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "assoc", "basesize=1024"]`             | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "assoc", "basesize=32"]`               | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1"]`            | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                   1.01 (5%)  | 0.93 (1%) :white_check_mark: |
| `["findfirst", "n=400", "foldl"]`                   | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.92 (5%) :white_check_mark: | 0.98 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                1.07 (5%) :x: |                   1.01 (1%)  |
| `["sum", "uniform", "reduce", "basesize=128"]`      |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=256"]`      |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=512"]`      |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           | 0.85 (5%) :white_check_mark: |                   0.99 (1%)  |
| `["words", "nthreads=4"]`                           | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |

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
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      47523 s          0 s       2383 s      22522 s          0 s
       #2  2294 MHz      52576 s          0 s       2482 s      17085 s          0 s
       
  Memory: 6.764884948730469 GB (2976.859375 MB free)
  Uptime: 743.0 sec
  Load Avg:  1.73046875  1.50830078125  0.89990234375
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
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      65516 s          0 s       2978 s      32581 s          0 s
       #2  2294 MHz      79323 s          0 s       2959 s      18638 s          0 s
       
  Memory: 6.764884948730469 GB (2965.04296875 MB free)
  Uptime: 1032.0 sec
  Load Avg:  1.732421875  1.6240234375  1.11474609375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 0:23
* Package commit: 41071e
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
| `["collect", "assoc", "basesize=1"]`                | 283.039 ms (5%) | 10.065 ms |  87.55 MiB (1%) |     1590667 |
| `["collect", "assoc", "basesize=1024"]`             | 148.102 ms (5%) |           |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 150.581 ms (5%) |           |   5.64 MiB (1%) |       54014 |
| `["collect", "seq"]`                                | 303.567 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 395.607 ms (5%) |           |  29.19 MiB (1%) |      405327 |
| `["collect", "unordered", "basesize=1024"]`         | 198.975 ms (5%) |           | 779.17 KiB (1%) |        2959 |
| `["collect", "unordered", "basesize=32"]`           | 179.582 ms (5%) |           |   1.49 MiB (1%) |       18071 |
| `["findfirst", "n=1000", "foldl"]`                  | 487.094 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 247.766 ms (5%) |           | 563.92 KiB (1%) |       10222 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 253.743 ms (5%) |           | 287.16 KiB (1%) |        5220 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 256.518 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 360.354 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 185.288 ms (5%) |           |   1.02 MiB (1%) |       18966 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 183.722 ms (5%) |           | 526.05 KiB (1%) |        9567 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 188.085 ms (5%) |           | 267.13 KiB (1%) |        4873 |
| `["findfirst", "n=500", "foldl"]`                   |  60.292 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  30.440 ms (5%) |           | 157.33 KiB (1%) |        2850 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  30.773 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  32.496 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 177.299 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=false"]`                   | 171.699 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 303.098 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.381 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   3.965 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.676 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.377 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  18.505 ms (5%) |           |   1.03 MiB (1%) |        3508 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.203 ms (5%) |           |   1.24 MiB (1%) |        1698 |
| `["parallel_histogram", "seq"]`                     |   6.051 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  11.217 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.077 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   5.815 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.735 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.033 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.228 ms (5%) |           | 313.39 KiB (1%) |        6071 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.202 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.912 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.474 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.444 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.182 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.302 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  39.845 ms (5%) |  7.113 ms |  63.02 MiB (1%) |     2058818 |
| `["words", "nthreads=2"]`                           |  20.594 ms (5%) |           |  63.62 MiB (1%) |     2066924 |
| `["words", "nthreads=4"]`                           |  21.365 ms (5%) |           |  64.59 MiB (1%) |     2075169 |

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
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      47523 s          0 s       2383 s      22522 s          0 s
       #2  2294 MHz      52576 s          0 s       2482 s      17085 s          0 s
       
  Memory: 6.764884948730469 GB (2976.859375 MB free)
  Uptime: 743.0 sec
  Load Avg:  1.73046875  1.50830078125  0.89990234375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 0:28
* Package commit: 525658
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

| ID                                                  | time            | GC time  | memory          | allocations |
|-----------------------------------------------------|----------------:|---------:|----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 304.915 ms (5%) | 9.978 ms |  87.55 MiB (1%) |     1590749 |
| `["collect", "assoc", "basesize=1024"]`             | 168.552 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 173.682 ms (5%) |          |   5.64 MiB (1%) |       54003 |
| `["collect", "seq"]`                                | 296.563 ms (5%) |          |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 417.725 ms (5%) |          |  29.19 MiB (1%) |      405220 |
| `["collect", "unordered", "basesize=1024"]`         | 197.356 ms (5%) |          | 834.72 KiB (1%) |        6178 |
| `["collect", "unordered", "basesize=32"]`           | 178.657 ms (5%) |          |   1.49 MiB (1%) |       18281 |
| `["findfirst", "n=1000", "foldl"]`                  | 509.103 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 253.484 ms (5%) |          | 563.89 KiB (1%) |       10220 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 248.429 ms (5%) |          | 287.20 KiB (1%) |        5223 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 267.677 ms (5%) |          | 149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 425.892 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 194.555 ms (5%) |          |   1.02 MiB (1%) |       18965 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 208.217 ms (5%) |          | 526.14 KiB (1%) |        9573 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 198.438 ms (5%) |          | 267.02 KiB (1%) |        4866 |
| `["findfirst", "n=500", "foldl"]`                   |  58.879 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  31.034 ms (5%) |          | 157.36 KiB (1%) |        2852 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  30.576 ms (5%) |          |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  32.932 ms (5%) |          |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 177.397 μs (5%) |          | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 174.098 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 313.996 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.555 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.344 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.850 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.640 ms (5%) |          |   1.22 MiB (1%) |         253 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.086 ms (5%) |          |   1.05 MiB (1%) |        4127 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.223 ms (5%) |          |   1.23 MiB (1%) |         991 |
| `["parallel_histogram", "seq"]`                     |   6.081 ms (5%) |          | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  11.363 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.062 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   5.860 ms (5%) |          | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.782 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  10.909 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   5.861 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.666 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.583 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.238 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.367 ms (5%) |          | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.202 ms (5%) |          | 155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.129 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  41.045 ms (5%) | 6.316 ms |  63.11 MiB (1%) |     2061993 |
| `["words", "nthreads=2"]`                           |  24.226 ms (5%) |          |  64.19 MiB (1%) |     2074242 |
| `["words", "nthreads=4"]`                           |  23.374 ms (5%) |          |  64.83 MiB (1%) |     2080502 |

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
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      65516 s          0 s       2978 s      32581 s          0 s
       #2  2294 MHz      79323 s          0 s       2959 s      18638 s          0 s
       
  Memory: 6.764884948730469 GB (2965.04296875 MB free)
  Uptime: 1032.0 sec
  Load Avg:  1.732421875  1.6240234375  1.11474609375
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

