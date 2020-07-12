# Multi-thread benchmark result

* Pull request commit: [`139b6a2ff5d6bdb0a0795a18997d8c0c6f67550a`](https://github.com/JuliaFolds/Transducers.jl/commit/139b6a2ff5d6bdb0a0795a18997d8c0c6f67550a)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/363> (Re-transform iterator passed in Cat)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 07:18
    - Baseline: 12 Jul 2020 - 07:23
* Package commits:
    - Target: b596c4
    - Baseline: cbc633
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
| `["collect", "unordered", "basesize=1024"]`         |                1.25 (5%) :x: |                1.07 (1%) :x: |
| `["findfirst", "n=1000", "foldl"]`                  |                   1.00 (5%)  | 0.00 (1%) :white_check_mark: |
| `["findfirst", "n=400", "foldl"]`                   |                   1.00 (5%)  | 0.00 (1%) :white_check_mark: |
| `["findfirst", "n=500", "foldl"]`                   |                   0.99 (5%)  | 0.00 (1%) :white_check_mark: |
| `["parallel_histogram", "assoc", "basesize=16384"]` | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   0.98 (5%)  | 0.87 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["sum", "random", "foldl"]`                        |                1.06 (5%) :x: |                 Inf (1%) :x: |
| `["sum", "random", "reduce", "basesize=512"]`       |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "foldl"]`                       |                   1.05 (5%)  |                 Inf (1%) :x: |
| `["sum", "valley", "foldl"]`                        |                   1.04 (5%)  |                 Inf (1%) :x: |

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
       #1  2294 MHz      49255 s          0 s       2432 s      21644 s          0 s
       #2  2294 MHz      55222 s          0 s       2667 s      15147 s          0 s
       
  Memory: 6.764884948730469 GB (2826.3046875 MB free)
  Uptime: 753.0 sec
  Load Avg:  1.69287109375  1.54541015625  0.94677734375
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
       #1  2294 MHz      72019 s          0 s       3004 s      28493 s          0 s
       #2  2294 MHz      78661 s          0 s       3184 s      21490 s          0 s
       
  Memory: 6.764884948730469 GB (2807.5234375 MB free)
  Uptime: 1058.0 sec
  Load Avg:  1.7158203125  1.60205078125  1.1376953125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:18
* Package commit: b596c4
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
| `["collect", "assoc", "basesize=1"]`                | 356.838 ms (5%) | 13.606 ms |  87.55 MiB (1%) |     1590707 |
| `["collect", "assoc", "basesize=1024"]`             | 197.022 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 201.478 ms (5%) |           |   5.64 MiB (1%) |       54005 |
| `["collect", "seq"]`                                | 378.448 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 496.793 ms (5%) |           |  29.19 MiB (1%) |      405232 |
| `["collect", "unordered", "basesize=1024"]`         | 297.799 ms (5%) |           | 877.77 KiB (1%) |        9269 |
| `["collect", "unordered", "basesize=32"]`           | 231.353 ms (5%) |           |   1.49 MiB (1%) |       18202 |
| `["findfirst", "n=1000", "foldl"]`                  | 625.655 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 321.450 ms (5%) |           | 564.02 KiB (1%) |       10228 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 315.484 ms (5%) |           | 287.13 KiB (1%) |        5218 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 321.338 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 451.591 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 235.200 ms (5%) |           |   1.02 MiB (1%) |       18947 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 234.217 ms (5%) |           | 526.06 KiB (1%) |        9568 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 233.098 ms (5%) |           | 267.17 KiB (1%) |        4876 |
| `["findfirst", "n=500", "foldl"]`                   |  78.989 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.405 ms (5%) |           | 157.33 KiB (1%) |        2850 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  40.159 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  43.057 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 200.400 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 202.300 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=true"]`                    | 346.200 μs (5%) |           | 146.38 KiB (1%) |        2643 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.187 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.429 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.830 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.502 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.867 ms (5%) |           |   1.04 MiB (1%) |        2271 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.077 ms (5%) |           |   1.23 MiB (1%) |         714 |
| `["parallel_histogram", "seq"]`                     |   7.743 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.873 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.264 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.980 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.010 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  14.478 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.175 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.677 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.613 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.384 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.345 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.021 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.849 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  52.249 ms (5%) |  8.388 ms |  63.06 MiB (1%) |     2060388 |
| `["words", "nthreads=2"]`                           |  26.156 ms (5%) |           |  63.67 MiB (1%) |     2068501 |
| `["words", "nthreads=4"]`                           |  26.578 ms (5%) |           |  64.63 MiB (1%) |     2076782 |

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
       #1  2294 MHz      49255 s          0 s       2432 s      21644 s          0 s
       #2  2294 MHz      55222 s          0 s       2667 s      15147 s          0 s
       
  Memory: 6.764884948730469 GB (2826.3046875 MB free)
  Uptime: 753.0 sec
  Load Avg:  1.69287109375  1.54541015625  0.94677734375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:23
* Package commit: cbc633
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
| `["collect", "assoc", "basesize=1"]`                | 344.304 ms (5%) | 12.295 ms |  87.55 MiB (1%) |     1590718 |
| `["collect", "assoc", "basesize=1024"]`             | 190.735 ms (5%) |           |   1.84 MiB (1%) |        1808 |
| `["collect", "assoc", "basesize=32"]`               | 196.320 ms (5%) |           |   5.64 MiB (1%) |       54012 |
| `["collect", "seq"]`                                | 369.412 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 482.979 ms (5%) |           |  29.19 MiB (1%) |      405317 |
| `["collect", "unordered", "basesize=1024"]`         | 237.766 ms (5%) |           | 820.86 KiB (1%) |        5291 |
| `["collect", "unordered", "basesize=32"]`           | 227.622 ms (5%) |           |   1.50 MiB (1%) |       18650 |
| `["findfirst", "n=1000", "foldl"]`                  | 622.784 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 318.297 ms (5%) |           | 563.77 KiB (1%) |       10212 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 317.159 ms (5%) |           | 287.28 KiB (1%) |        5228 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 323.994 ms (5%) |           | 149.14 KiB (1%) |        2714 |
| `["findfirst", "n=400", "foldl"]`                   | 452.172 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 239.916 ms (5%) |           |   1.02 MiB (1%) |       18973 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 235.418 ms (5%) |           | 526.23 KiB (1%) |        9579 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 234.237 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  80.063 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.312 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  40.504 ms (5%) |           |  84.44 KiB (1%) |        1530 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  43.582 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 195.201 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 199.600 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 346.400 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.412 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.565 ms (5%) |           |   2.07 MiB (1%) |         501 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.899 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.480 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  17.614 ms (5%) |           |   1.04 MiB (1%) |        2086 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.908 ms (5%) |           |   1.23 MiB (1%) |         762 |
| `["parallel_histogram", "seq"]`                     |   7.884 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.017 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.996 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.932 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.625 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  13.789 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.860 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.531 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.598 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  14.791 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.088 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.808 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.713 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  52.818 ms (5%) |  8.553 ms |  62.98 MiB (1%) |     2057833 |
| `["words", "nthreads=2"]`                           |  26.821 ms (5%) |           |  64.07 MiB (1%) |     2070069 |
| `["words", "nthreads=4"]`                           |  27.455 ms (5%) |           |  64.71 MiB (1%) |     2076308 |

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
       #1  2294 MHz      72019 s          0 s       3004 s      28493 s          0 s
       #2  2294 MHz      78661 s          0 s       3184 s      21490 s          0 s
       
  Memory: 6.764884948730469 GB (2807.5234375 MB free)
  Uptime: 1058.0 sec
  Load Avg:  1.7158203125  1.60205078125  1.1376953125
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

