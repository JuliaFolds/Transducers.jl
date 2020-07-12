# Multi-thread benchmark result

* Pull request commit: [`371e3d0961f5745440e40cd255d1f23bc5b981df`](https://github.com/JuliaFolds/Transducers.jl/commit/371e3d0961f5745440e40cd255d1f23bc5b981df)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/361> (Define Set(eduction(...)) and Dict(eduction(...)))

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 06:37
    - Baseline: 12 Jul 2020 - 06:42
* Package commits:
    - Target: 3efb5f
    - Baseline: f40a1e
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
| `["collect", "unordered", "basesize=1024"]`         |                1.13 (5%) :x: | 1.04 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=4096"]`  | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=16384"]`  |                1.06 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "seq"]`                     | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "valley", "foldl"]`                        |                1.06 (5%) :x: |    1.00 (1%)  |
| `["words", "nthreads=1"]`                           |                1.06 (5%) :x: |    1.00 (1%)  |
| `["words", "nthreads=2"]`                           | 0.93 (5%) :white_check_mark: |    0.99 (1%)  |
| `["words", "nthreads=4"]`                           | 0.94 (5%) :white_check_mark: |    0.99 (1%)  |

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
       #1  2095 MHz      48357 s          0 s       2615 s      19627 s          0 s
       #2  2095 MHz      53056 s          0 s       2276 s      15109 s          0 s
       
  Memory: 6.764884948730469 GB (2802.4140625 MB free)
  Uptime: 726.0 sec
  Load Avg:  1.66259765625  1.49755859375  0.8857421875
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
       #1  2095 MHz      70190 s          0 s       3143 s      27895 s          0 s
       #2  2095 MHz      77944 s          0 s       2707 s      20427 s          0 s
       
  Memory: 6.764884948730469 GB (2785.6328125 MB free)
  Uptime: 1035.0 sec
  Load Avg:  1.74169921875  1.58251953125  1.09375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 6:37
* Package commit: 3efb5f
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
| `["collect", "assoc", "basesize=1"]`                | 369.129 ms (5%) | 11.152 ms |  87.55 MiB (1%) |     1590780 |
| `["collect", "assoc", "basesize=1024"]`             | 231.318 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 236.193 ms (5%) |           |   5.64 MiB (1%) |       54013 |
| `["collect", "seq"]`                                | 455.166 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 480.592 ms (5%) |           |  29.16 MiB (1%) |      403245 |
| `["collect", "unordered", "basesize=1024"]`         | 357.020 ms (5%) |           | 888.09 KiB (1%) |        9930 |
| `["collect", "unordered", "basesize=32"]`           | 259.044 ms (5%) |           |   1.47 MiB (1%) |       16954 |
| `["findfirst", "n=1000", "foldl"]`                  | 732.081 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 371.876 ms (5%) |           | 563.72 KiB (1%) |       10209 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 371.276 ms (5%) |           | 287.03 KiB (1%) |        5212 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 379.272 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 537.617 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 281.489 ms (5%) |           |   1.02 MiB (1%) |       18884 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 279.920 ms (5%) |           | 525.86 KiB (1%) |        9555 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 281.062 ms (5%) |           | 267.16 KiB (1%) |        4875 |
| `["findfirst", "n=500", "foldl"]`                   |  92.301 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.050 ms (5%) |           | 157.19 KiB (1%) |        2841 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.912 ms (5%) |           |  84.41 KiB (1%) |        1528 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  50.465 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 180.100 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 183.900 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=true"]`                    | 347.600 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.716 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.247 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.082 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  16.066 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.809 ms (5%) |           |   1.05 MiB (1%) |        3255 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.395 ms (5%) |           |   1.25 MiB (1%) |        2384 |
| `["parallel_histogram", "seq"]`                     |   8.136 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  17.200 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.294 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.882 ms (5%) |           | 155.03 KiB (1%) |        3007 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.794 ms (5%) |           |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  16.839 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.848 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.891 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.619 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  17.680 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.337 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.248 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.979 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  49.212 ms (5%) |  7.633 ms |  63.34 MiB (1%) |     2069888 |
| `["words", "nthreads=2"]`                           |  23.865 ms (5%) |           |  63.95 MiB (1%) |     2078082 |
| `["words", "nthreads=4"]`                           |  24.888 ms (5%) |           |  64.91 MiB (1%) |     2086314 |

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
       #1  2095 MHz      48357 s          0 s       2615 s      19627 s          0 s
       #2  2095 MHz      53056 s          0 s       2276 s      15109 s          0 s
       
  Memory: 6.764884948730469 GB (2802.4140625 MB free)
  Uptime: 726.0 sec
  Load Avg:  1.66259765625  1.49755859375  0.8857421875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 6:42
* Package commit: f40a1e
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
| `["collect", "assoc", "basesize=1"]`                | 369.033 ms (5%) | 10.125 ms |  87.55 MiB (1%) |     1590806 |
| `["collect", "assoc", "basesize=1024"]`             | 233.791 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 239.803 ms (5%) |           |   5.64 MiB (1%) |       54015 |
| `["collect", "seq"]`                                | 453.540 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 475.191 ms (5%) |           |  29.16 MiB (1%) |      403479 |
| `["collect", "unordered", "basesize=1024"]`         | 314.559 ms (5%) |           | 854.20 KiB (1%) |        7380 |
| `["collect", "unordered", "basesize=32"]`           | 263.745 ms (5%) |           |   1.47 MiB (1%) |       16765 |
| `["findfirst", "n=1000", "foldl"]`                  | 727.626 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 372.540 ms (5%) |           | 563.64 KiB (1%) |       10204 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 372.900 ms (5%) |           | 287.08 KiB (1%) |        5215 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 376.410 ms (5%) |           | 149.16 KiB (1%) |        2715 |
| `["findfirst", "n=400", "foldl"]`                   | 548.523 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 279.108 ms (5%) |           |   1.02 MiB (1%) |       18868 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 278.108 ms (5%) |           | 525.66 KiB (1%) |        9542 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 279.508 ms (5%) |           | 267.02 KiB (1%) |        4866 |
| `["findfirst", "n=500", "foldl"]`                   |  91.880 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  47.509 ms (5%) |           | 157.17 KiB (1%) |        2840 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.716 ms (5%) |           |  84.44 KiB (1%) |        1530 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  50.250 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 180.801 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 186.801 μs (5%) |           | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=true"]`                    | 343.402 μs (5%) |           | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.725 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.685 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.066 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.218 ms (5%) |           |   1.22 MiB (1%) |         158 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.422 ms (5%) |           |   1.06 MiB (1%) |        3856 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.268 ms (5%) |           |   1.25 MiB (1%) |        1972 |
| `["parallel_histogram", "seq"]`                     |   8.594 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  17.123 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.159 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.156 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.869 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  16.870 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.980 ms (5%) |           | 313.39 KiB (1%) |        6071 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.741 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.684 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  16.707 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.369 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.025 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.985 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  46.249 ms (5%) |  6.977 ms |  63.49 MiB (1%) |     2074127 |
| `["words", "nthreads=2"]`                           |  25.540 ms (5%) |           |  64.57 MiB (1%) |     2086369 |
| `["words", "nthreads=4"]`                           |  26.563 ms (5%) |           |  65.52 MiB (1%) |     2096791 |

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
       #1  2095 MHz      70190 s          0 s       3143 s      27895 s          0 s
       #2  2095 MHz      77944 s          0 s       2707 s      20427 s          0 s
       
  Memory: 6.764884948730469 GB (2785.6328125 MB free)
  Uptime: 1035.0 sec
  Load Avg:  1.74169921875  1.58251953125  1.09375
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

