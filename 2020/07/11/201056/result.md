# Multi-thread benchmark result

* Pull request commit: [`d861b926e97959a381e92db9b9817a04eaa4dc5f`](https://github.com/JuliaFolds/Transducers.jl/commit/d861b926e97959a381e92db9b9817a04eaa4dc5f)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/354> (Deprecate mapfoldl and mapreduce)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 11 Jul 2020 - 20:05
    - Baseline: 11 Jul 2020 - 20:10
* Package commits:
    - Target: a1676c
    - Baseline: e1048e
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
| `["collect", "unordered", "basesize=1024"]`         | 0.84 (5%) :white_check_mark: | 0.89 (1%) :white_check_mark: |
| `["findfirst", "n=1000", "foldl"]`                  |                   1.00 (5%)  |                 Inf (1%) :x: |
| `["findfirst", "n=400", "foldl"]`                   |                   0.99 (5%)  |                 Inf (1%) :x: |
| `["findfirst", "n=500", "foldl"]`                   |                   1.02 (5%)  |                 Inf (1%) :x: |
| `["overhead", "stoppable=true"]`                    |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=16384"]` |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   1.01 (5%)  |                1.30 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.10 (5%) :x: |                1.03 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "seq"]`                     |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["sum", "random", "foldl"]`                        |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=128"]`      | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "valley", "foldl"]`                        | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |

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
       #1  2095 MHz      45194 s          0 s       2343 s      47262 s          0 s
       #2  2095 MHz      55841 s          0 s       2614 s      36621 s          0 s
       
  Memory: 6.764884948730469 GB (2816.0390625 MB free)
  Uptime: 973.0 sec
  Load Avg:  1.7421875  1.53125  0.96728515625
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
       #1  2095 MHz      67584 s          0 s       2840 s      55191 s          0 s
       #2  2095 MHz      80472 s          0 s       3087 s      42478 s          0 s
       
  Memory: 6.764884948730469 GB (2852.2578125 MB free)
  Uptime: 1285.0 sec
  Load Avg:  1.888671875  1.68798828125  1.19091796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 20:5
* Package commit: a1676c
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
| `["collect", "assoc", "basesize=1"]`                | 380.072 ms (5%) | 12.523 ms |  87.55 MiB (1%) |     1590861 |
| `["collect", "assoc", "basesize=1024"]`             | 232.912 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 245.860 ms (5%) |           |   5.64 MiB (1%) |       54012 |
| `["collect", "seq"]`                                | 471.205 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 473.423 ms (5%) |           |  29.14 MiB (1%) |      402286 |
| `["collect", "unordered", "basesize=1024"]`         | 288.188 ms (5%) |           | 793.59 KiB (1%) |        3882 |
| `["collect", "unordered", "basesize=32"]`           | 266.356 ms (5%) |           |   1.47 MiB (1%) |       16555 |
| `["findfirst", "n=1000", "foldl"]`                  | 742.932 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 375.830 ms (5%) |           | 564.17 KiB (1%) |       10238 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 376.740 ms (5%) |           | 287.08 KiB (1%) |        5215 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 378.543 ms (5%) |           | 149.19 KiB (1%) |        2717 |
| `["findfirst", "n=400", "foldl"]`                   | 556.370 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 285.019 ms (5%) |           |   1.02 MiB (1%) |       18975 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 280.696 ms (5%) |           | 526.06 KiB (1%) |        9568 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 283.820 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  94.685 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.999 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  48.600 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  51.557 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 159.601 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 155.201 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 304.101 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.710 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.175 ms (5%) |           |   2.33 MiB (1%) |         508 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.333 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.463 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  25.380 ms (5%) |           |   1.07 MiB (1%) |        5747 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.379 ms (5%) |           |   1.25 MiB (1%) |        1902 |
| `["parallel_histogram", "seq"]`                     |   8.579 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  17.874 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.435 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.932 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.140 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  16.412 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.715 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.588 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.388 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  17.342 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.121 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.127 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.176 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  47.578 ms (5%) |  7.805 ms |  63.07 MiB (1%) |     2061110 |
| `["words", "nthreads=2"]`                           |  24.366 ms (5%) |           |  63.68 MiB (1%) |     2069249 |
| `["words", "nthreads=4"]`                           |  24.563 ms (5%) |           |  64.95 MiB (1%) |     2081708 |

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
       #1  2095 MHz      45194 s          0 s       2343 s      47262 s          0 s
       #2  2095 MHz      55841 s          0 s       2614 s      36621 s          0 s
       
  Memory: 6.764884948730469 GB (2816.0390625 MB free)
  Uptime: 973.0 sec
  Load Avg:  1.7421875  1.53125  0.96728515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 20:10
* Package commit: e1048e
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
| `["collect", "assoc", "basesize=1"]`                | 377.348 ms (5%) | 11.870 ms |  87.55 MiB (1%) |     1590444 |
| `["collect", "assoc", "basesize=1024"]`             | 236.359 ms (5%) |           |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 242.904 ms (5%) |           |   5.64 MiB (1%) |       54017 |
| `["collect", "seq"]`                                | 470.046 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 462.677 ms (5%) |           |  29.15 MiB (1%) |      402346 |
| `["collect", "unordered", "basesize=1024"]`         | 343.462 ms (5%) |           | 895.45 KiB (1%) |       10065 |
| `["collect", "unordered", "basesize=32"]`           | 269.582 ms (5%) |           |   1.46 MiB (1%) |       15769 |
| `["findfirst", "n=1000", "foldl"]`                  | 741.629 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 378.307 ms (5%) |           | 563.97 KiB (1%) |       10225 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 377.657 ms (5%) |           | 287.30 KiB (1%) |        5229 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 377.871 ms (5%) |           | 149.30 KiB (1%) |        2724 |
| `["findfirst", "n=400", "foldl"]`                   | 559.240 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 284.216 ms (5%) |           |   1.02 MiB (1%) |       18963 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 283.052 ms (5%) |           | 526.05 KiB (1%) |        9567 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 285.364 ms (5%) |           | 267.23 KiB (1%) |        4880 |
| `["findfirst", "n=500", "foldl"]`                   |  92.934 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  47.942 ms (5%) |           | 157.36 KiB (1%) |        2852 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  48.261 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  51.442 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 157.301 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 152.800 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 286.001 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.160 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.129 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.007 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.717 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.097 ms (5%) |           |   1.04 MiB (1%) |        4446 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.599 ms (5%) |           |   1.24 MiB (1%) |        1590 |
| `["parallel_histogram", "seq"]`                     |   7.960 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.992 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.063 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.711 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.880 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  15.955 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.349 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.924 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.405 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.361 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.475 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.200 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.338 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  49.880 ms (5%) |  7.490 ms |  63.05 MiB (1%) |     2059999 |
| `["words", "nthreads=2"]`                           |  24.725 ms (5%) |           |  64.14 MiB (1%) |     2072210 |
| `["words", "nthreads=4"]`                           |  25.527 ms (5%) |           |  65.09 MiB (1%) |     2082677 |

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
       #1  2095 MHz      67584 s          0 s       2840 s      55191 s          0 s
       #2  2095 MHz      80472 s          0 s       3087 s      42478 s          0 s
       
  Memory: 6.764884948730469 GB (2852.2578125 MB free)
  Uptime: 1285.0 sec
  Load Avg:  1.888671875  1.68798828125  1.19091796875
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
    CPU MHz:             2095.079
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

