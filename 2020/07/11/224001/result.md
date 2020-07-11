# Multi-thread benchmark result

* Pull request commit: [`3555d8481d41e38ae598b7faf65885988f48a9b6`](https://github.com/JuliaFolds/Transducers.jl/commit/3555d8481d41e38ae598b7faf65885988f48a9b6)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/356> (Fix default basesize calculation with eduction)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 11 Jul 2020 - 22:34
    - Baseline: 11 Jul 2020 - 22:39
* Package commits:
    - Target: 72984c
    - Baseline: 062878
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
| `["collect", "assoc", "basesize=1024"]`             |                1.15 (5%) :x: |                   1.00 (1%)  |
| `["collect", "assoc", "basesize=32"]`               |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         | 0.85 (5%) :white_check_mark: | 0.96 (1%) :white_check_mark: |
| `["collect", "unordered", "basesize=32"]`           |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "default"]`                           |                1.10 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "stoppable=false"]`                   |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "stoppable=true"]`                    |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=16384"]` |                1.15 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                1.16 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |                1.15 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   1.02 (5%)  |                1.04 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                1.06 (5%) :x: | 0.96 (1%) :white_check_mark: |
| `["parallel_histogram", "seq"]`                     |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=512"]`       | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           |                1.06 (5%) :x: |                   1.01 (1%)  |
| `["words", "nthreads=4"]`                           |                1.07 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      51059 s          0 s       2301 s      14707 s          0 s
       #2  2095 MHz      48251 s          0 s       2502 s      18050 s          0 s
       
  Memory: 6.764884948730469 GB (2862.453125 MB free)
  Uptime: 704.0 sec
  Load Avg:  1.87109375  1.58740234375  0.94091796875
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
       #1  2095 MHz      75864 s          0 s       2784 s      19286 s          0 s
       #2  2095 MHz      69268 s          0 s       3037 s      26366 s          0 s
       
  Memory: 6.764884948730469 GB (2839.35546875 MB free)
  Uptime: 1005.0 sec
  Load Avg:  1.66650390625  1.61865234375  1.1318359375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 22:34
* Package commit: 72984c
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
| `["collect", "assoc", "basesize=1"]`                | 336.312 ms (5%) | 11.377 ms |  87.55 MiB (1%) |     1590796 |
| `["collect", "assoc", "basesize=1024"]`             | 208.257 ms (5%) |           |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 213.585 ms (5%) |           |   5.64 MiB (1%) |       54006 |
| `["collect", "seq"]`                                | 414.420 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 418.636 ms (5%) |           |  29.13 MiB (1%) |      401400 |
| `["collect", "unordered", "basesize=1024"]`         | 265.013 ms (5%) |           | 820.16 KiB (1%) |        5537 |
| `["collect", "unordered", "basesize=32"]`           | 233.426 ms (5%) |           |   1.46 MiB (1%) |       16229 |
| `["findfirst", "n=1000", "foldl"]`                  | 677.924 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 338.717 ms (5%) |           | 563.31 KiB (1%) |       10183 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 336.440 ms (5%) |           | 286.92 KiB (1%) |        5205 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 329.041 ms (5%) |           | 149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 492.918 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 261.971 ms (5%) |           |   1.02 MiB (1%) |       18862 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 250.312 ms (5%) |           | 525.42 KiB (1%) |        9527 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 260.650 ms (5%) |           | 266.95 KiB (1%) |        4862 |
| `["findfirst", "n=500", "foldl"]`                   |  81.797 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.854 ms (5%) |           | 157.11 KiB (1%) |        2836 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  42.771 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.449 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 173.610 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 173.711 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 287.916 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.273 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.916 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.558 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.992 ms (5%) |           |   1.22 MiB (1%) |         158 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.751 ms (5%) |           |   1.06 MiB (1%) |        4445 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.805 ms (5%) |           |   1.22 MiB (1%) |         171 |
| `["parallel_histogram", "seq"]`                     |   7.488 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.895 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.132 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.517 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.570 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.325 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.116 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.944 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.608 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  16.020 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.269 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.017 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.412 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  42.194 ms (5%) |  7.160 ms |  63.30 MiB (1%) |     2067931 |
| `["words", "nthreads=2"]`                           |  21.318 ms (5%) |           |  64.38 MiB (1%) |     2080170 |
| `["words", "nthreads=4"]`                           |  21.471 ms (5%) |           |  65.02 MiB (1%) |     2086421 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      51059 s          0 s       2301 s      14707 s          0 s
       #2  2095 MHz      48251 s          0 s       2502 s      18050 s          0 s
       
  Memory: 6.764884948730469 GB (2862.453125 MB free)
  Uptime: 704.0 sec
  Load Avg:  1.87109375  1.58740234375  0.94091796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 22:39
* Package commit: 062878
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
| `["collect", "assoc", "basesize=1"]`                | 333.989 ms (5%) | 10.142 ms |  87.55 MiB (1%) |     1590726 |
| `["collect", "assoc", "basesize=1024"]`             | 181.520 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 189.875 ms (5%) |           |   5.64 MiB (1%) |       54017 |
| `["collect", "seq"]`                                | 402.541 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 401.866 ms (5%) |           |  29.15 MiB (1%) |      402484 |
| `["collect", "unordered", "basesize=1024"]`         | 312.004 ms (5%) |           | 857.00 KiB (1%) |        7559 |
| `["collect", "unordered", "basesize=32"]`           | 207.594 ms (5%) |           |   1.46 MiB (1%) |       16144 |
| `["findfirst", "n=1000", "foldl"]`                  | 647.135 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 331.276 ms (5%) |           | 563.20 KiB (1%) |       10176 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 333.951 ms (5%) |           | 286.89 KiB (1%) |        5203 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 333.170 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 483.082 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 252.321 ms (5%) |           |   1.02 MiB (1%) |       18851 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 246.826 ms (5%) |           | 525.55 KiB (1%) |        9535 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 244.648 ms (5%) |           | 267.00 KiB (1%) |        4865 |
| `["findfirst", "n=500", "foldl"]`                   |  82.252 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.338 ms (5%) |           | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  42.261 ms (5%) |           |  84.41 KiB (1%) |        1528 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.883 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 158.006 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 156.007 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 266.911 μs (5%) |           | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.725 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.228 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.973 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.861 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.337 ms (5%) |           |   1.01 MiB (1%) |        2774 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.649 ms (5%) |           |   1.27 MiB (1%) |        3448 |
| `["parallel_histogram", "seq"]`                     |   6.744 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.732 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.257 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.902 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.450 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.474 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.120 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.949 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.829 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.816 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.208 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.998 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.875 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  42.125 ms (5%) |  6.250 ms |  63.42 MiB (1%) |     2072026 |
| `["words", "nthreads=2"]`                           |  20.138 ms (5%) |           |  64.03 MiB (1%) |     2080139 |
| `["words", "nthreads=4"]`                           |  20.018 ms (5%) |           |  64.99 MiB (1%) |     2088346 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      75864 s          0 s       2784 s      19286 s          0 s
       #2  2095 MHz      69268 s          0 s       3037 s      26366 s          0 s
       
  Memory: 6.764884948730469 GB (2839.35546875 MB free)
  Uptime: 1005.0 sec
  Load Avg:  1.66650390625  1.61865234375  1.1318359375
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

