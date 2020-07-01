# Multi-thread benchmark result

* Target commit: [`6832388aa44348527afb02566f1bd7d3498e4e3a`](https://github.com/JuliaFolds/Transducers.jl/commit/6832388aa44348527afb02566f1bd7d3498e4e3a)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/323> (Re-enable "full" method ambiguity test)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 05:46
    - Baseline: 1 Jul 2020 - 05:51
* Package commits:
    - Target: 9d62c4
    - Baseline: 9b48d8
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
| `["collect", "unordered", "basesize=1024"]`         |                1.09 (5%) :x: | 1.04 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=16384"]` | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=8192"]`  | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.90 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "seq"]`                     | 0.88 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "random", "foldl"]`                        |                1.08 (5%) :x: |    1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=128"]`       | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |
| `["sum", "valley", "foldl"]`                        |                1.08 (5%) :x: |    1.00 (1%)  |

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
       #1  2095 MHz      50790 s          0 s       2312 s      20230 s          0 s
       #2  2095 MHz      50870 s          0 s       2536 s      20572 s          0 s
       
  Memory: 6.764884948730469 GB (3105.10546875 MB free)
  Uptime: 758.0 sec
  Load Avg:  1.69140625  1.57080078125  0.99853515625
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
       #1  2095 MHz      72547 s          0 s       2890 s      27976 s          0 s
       #2  2095 MHz      74950 s          0 s       3091 s      25960 s          0 s
       
  Memory: 6.764884948730469 GB (3121.33203125 MB free)
  Uptime: 1060.0 sec
  Load Avg:  1.76318359375  1.6171875  1.17041015625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:46
* Package commit: 9d62c4
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
| `["collect", "assoc", "basesize=1"]`                | 386.321 ms (5%) | 13.572 ms |  87.55 MiB (1%) |     1590738 |
| `["collect", "assoc", "basesize=1024"]`             | 245.564 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 248.765 ms (5%) |           |   5.64 MiB (1%) |       54005 |
| `["collect", "seq"]`                                | 480.061 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 494.897 ms (5%) |           |  29.16 MiB (1%) |      403315 |
| `["collect", "unordered", "basesize=1024"]`         | 327.012 ms (5%) |           | 827.70 KiB (1%) |        6020 |
| `["collect", "unordered", "basesize=32"]`           | 271.991 ms (5%) |           |   1.47 MiB (1%) |       16825 |
| `["findfirst", "n=1000", "foldl"]`                  | 757.285 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 383.776 ms (5%) |           | 564.17 KiB (1%) |       10238 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 385.794 ms (5%) |           | 287.17 KiB (1%) |        5221 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 386.206 ms (5%) |           | 149.31 KiB (1%) |        2725 |
| `["findfirst", "n=400", "foldl"]`                   | 578.941 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 289.077 ms (5%) |           |   1.02 MiB (1%) |       18988 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 284.068 ms (5%) |           | 526.25 KiB (1%) |        9580 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 289.071 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  97.906 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  50.514 ms (5%) |           | 157.33 KiB (1%) |        2850 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  50.110 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  52.191 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 204.209 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 184.608 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 341.014 μs (5%) |           | 146.38 KiB (1%) |        2643 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.543 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.087 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.181 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.920 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.627 ms (5%) |           |   1.05 MiB (1%) |        3562 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.308 ms (5%) |           |   1.24 MiB (1%) |        1637 |
| `["parallel_histogram", "seq"]`                     |   8.523 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  19.065 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.164 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.706 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.698 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.374 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.710 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.992 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.351 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  19.004 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.889 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.876 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.192 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  41.650 ms (5%) |  7.452 ms |  64.28 MiB (1%) |     2080372 |
| `["words", "nthreads=2"]`                           |  22.381 ms (5%) |           |  64.64 MiB (1%) |     2080448 |
| `["words", "nthreads=4"]`                           |  23.948 ms (5%) |           |  65.36 MiB (1%) |     2080603 |

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
       #1  2095 MHz      50790 s          0 s       2312 s      20230 s          0 s
       #2  2095 MHz      50870 s          0 s       2536 s      20572 s          0 s
       
  Memory: 6.764884948730469 GB (3105.10546875 MB free)
  Uptime: 758.0 sec
  Load Avg:  1.69140625  1.57080078125  0.99853515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:51
* Package commit: 9b48d8
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
| `["collect", "assoc", "basesize=1"]`                | 389.769 ms (5%) | 11.646 ms |  87.55 MiB (1%) |     1590799 |
| `["collect", "assoc", "basesize=1024"]`             | 242.786 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 246.892 ms (5%) |           |   5.64 MiB (1%) |       54005 |
| `["collect", "seq"]`                                | 479.890 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 511.915 ms (5%) |           |  29.16 MiB (1%) |      403062 |
| `["collect", "unordered", "basesize=1024"]`         | 299.330 ms (5%) |           | 797.05 KiB (1%) |        4103 |
| `["collect", "unordered", "basesize=32"]`           | 272.213 ms (5%) |           |   1.47 MiB (1%) |       16918 |
| `["findfirst", "n=1000", "foldl"]`                  | 756.363 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 383.395 ms (5%) |           | 564.08 KiB (1%) |       10232 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 382.037 ms (5%) |           | 287.30 KiB (1%) |        5229 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 387.830 ms (5%) |           | 149.25 KiB (1%) |        2721 |
| `["findfirst", "n=400", "foldl"]`                   | 564.012 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 288.558 ms (5%) |           |   1.02 MiB (1%) |       18990 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 288.035 ms (5%) |           | 526.23 KiB (1%) |        9579 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 287.294 ms (5%) |           | 267.20 KiB (1%) |        4878 |
| `["findfirst", "n=500", "foldl"]`                   |  97.034 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  50.050 ms (5%) |           | 157.38 KiB (1%) |        2853 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  49.851 ms (5%) |           |  84.42 KiB (1%) |        1529 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  52.817 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 203.817 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 185.715 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 339.026 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.850 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.993 ms (5%) |           |   1.80 MiB (1%) |         494 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.644 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  16.008 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  27.379 ms (5%) |           |   1.05 MiB (1%) |        4847 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.803 ms (5%) |           |   1.24 MiB (1%) |        1302 |
| `["parallel_histogram", "seq"]`                     |   9.642 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  17.665 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |  10.103 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.690 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.675 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "uniform", "foldl"]`                       |  18.181 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.728 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.853 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.398 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  17.530 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |  10.144 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.740 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.343 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  42.004 ms (5%) |  7.391 ms |  64.35 MiB (1%) |     2082510 |
| `["words", "nthreads=2"]`                           |  21.703 ms (5%) |           |  64.71 MiB (1%) |     2082586 |
| `["words", "nthreads=4"]`                           |  23.404 ms (5%) |           |  65.61 MiB (1%) |     2082883 |

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
       #1  2095 MHz      72547 s          0 s       2890 s      27976 s          0 s
       #2  2095 MHz      74950 s          0 s       3091 s      25960 s          0 s
       
  Memory: 6.764884948730469 GB (3121.33203125 MB free)
  Uptime: 1060.0 sec
  Load Avg:  1.76318359375  1.6171875  1.17041015625
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
    CPU MHz:             2095.192
    BogoMIPS:            4190.38
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

