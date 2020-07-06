# Multi-thread benchmark result

* Pull request commit: [`6823f80e9c6d1f86ae6935a00c9b3ee1a8ef33f5`](https://github.com/JuliaFolds/Transducers.jl/commit/6823f80e9c6d1f86ae6935a00c9b3ee1a8ef33f5)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/341> (Refactoring initializer API; define Init in Transducers.jl)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 6 Jul 2020 - 01:35
    - Baseline: 6 Jul 2020 - 01:40
* Package commits:
    - Target: 77a3ba
    - Baseline: 9a0223
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
| `["collect", "unordered", "basesize=1024"]`         |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   0.99 (5%)  |                1.15 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.95 (5%) :white_check_mark: | 0.98 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                1.15 (5%) :x: |                1.02 (1%) :x: |

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
       #1  2095 MHz      53018 s          0 s       2279 s      14405 s          0 s
       #2  2095 MHz      45254 s          0 s       2591 s      22121 s          0 s
       
  Memory: 6.764884948730469 GB (2993.96875 MB free)
  Uptime: 717.0 sec
  Load Avg:  1.708984375  1.5634765625  0.93798828125
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
       #1  2095 MHz      73793 s          0 s       2870 s      21850 s          0 s
       #2  2095 MHz      68940 s          0 s       3118 s      26682 s          0 s
       
  Memory: 6.764884948730469 GB (3013.76953125 MB free)
  Uptime: 1007.0 sec
  Load Avg:  1.6611328125  1.6083984375  1.12451171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 6 Jul 2020 - 1:35
* Package commit: 77a3ba
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
| `["collect", "assoc", "basesize=1"]`                | 339.344 ms (5%) | 10.765 ms |  87.55 MiB (1%) |     1590778 |
| `["collect", "assoc", "basesize=1024"]`             | 212.019 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 217.663 ms (5%) |           |   5.64 MiB (1%) |       54008 |
| `["collect", "seq"]`                                | 412.984 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 419.951 ms (5%) |           |  29.15 MiB (1%) |      402366 |
| `["collect", "unordered", "basesize=1024"]`         | 252.007 ms (5%) |           | 768.14 KiB (1%) |        2208 |
| `["collect", "unordered", "basesize=32"]`           | 240.550 ms (5%) |           |   1.46 MiB (1%) |       15970 |
| `["findfirst", "n=1000", "foldl"]`                  | 637.701 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 338.368 ms (5%) |           | 563.64 KiB (1%) |       10204 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 339.319 ms (5%) |           | 287.13 KiB (1%) |        5218 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 345.232 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 481.625 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 257.458 ms (5%) |           |   1.02 MiB (1%) |       18916 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 250.218 ms (5%) |           | 525.70 KiB (1%) |        9545 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 255.461 ms (5%) |           | 267.00 KiB (1%) |        4865 |
| `["findfirst", "n=500", "foldl"]`                   |  78.705 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  43.223 ms (5%) |           | 157.16 KiB (1%) |        2839 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  43.497 ms (5%) |           |  84.42 KiB (1%) |        1529 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  45.819 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 155.910 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=false"]`                   | 157.909 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 287.017 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.903 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.817 ms (5%) |           |   2.07 MiB (1%) |         500 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.627 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.179 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.443 ms (5%) |           |   1.06 MiB (1%) |        4171 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.775 ms (5%) |           |   1.27 MiB (1%) |        3144 |
| `["parallel_histogram", "seq"]`                     |   6.918 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  14.575 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.030 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.876 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.516 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  14.423 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.900 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.588 ms (5%) |           | 155.13 KiB (1%) |        3013 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.652 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  14.775 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.811 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.075 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.824 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  32.680 ms (5%) |  6.322 ms |  65.06 MiB (1%) |     2105193 |
| `["words", "nthreads=2"]`                           |  20.168 ms (5%) |           |  65.78 MiB (1%) |     2105347 |
| `["words", "nthreads=4"]`                           |  20.921 ms (5%) |           |  66.23 MiB (1%) |     2105495 |

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
       #1  2095 MHz      53018 s          0 s       2279 s      14405 s          0 s
       #2  2095 MHz      45254 s          0 s       2591 s      22121 s          0 s
       
  Memory: 6.764884948730469 GB (2993.96875 MB free)
  Uptime: 717.0 sec
  Load Avg:  1.708984375  1.5634765625  0.93798828125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 6 Jul 2020 - 1:40
* Package commit: 9a0223
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
| `["collect", "assoc", "basesize=1"]`                | 343.530 ms (5%) | 10.746 ms |  87.55 MiB (1%) |     1590818 |
| `["collect", "assoc", "basesize=1024"]`             | 213.789 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 217.841 ms (5%) |           |   5.64 MiB (1%) |       54017 |
| `["collect", "seq"]`                                | 410.106 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 426.038 ms (5%) |           |  29.11 MiB (1%) |      399761 |
| `["collect", "unordered", "basesize=1024"]`         | 237.857 ms (5%) |           | 767.56 KiB (1%) |        2171 |
| `["collect", "unordered", "basesize=32"]`           | 241.162 ms (5%) |           |   1.46 MiB (1%) |       15991 |
| `["findfirst", "n=1000", "foldl"]`                  | 645.435 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 340.580 ms (5%) |           | 563.61 KiB (1%) |       10202 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 340.636 ms (5%) |           | 287.19 KiB (1%) |        5222 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 349.352 ms (5%) |           | 149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 481.904 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 255.556 ms (5%) |           |   1.02 MiB (1%) |       18894 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 252.401 ms (5%) |           | 525.63 KiB (1%) |        9540 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 253.266 ms (5%) |           | 267.05 KiB (1%) |        4868 |
| `["findfirst", "n=500", "foldl"]`                   |  79.013 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.603 ms (5%) |           | 157.20 KiB (1%) |        2842 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  42.371 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  45.472 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 161.307 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 161.107 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 282.013 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.849 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.873 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.498 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.101 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.695 ms (5%) |           |   1.08 MiB (1%) |        6381 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.105 ms (5%) |           |   1.24 MiB (1%) |        1693 |
| `["parallel_histogram", "seq"]`                     |   7.059 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  14.583 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.262 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.050 ms (5%) |           | 155.13 KiB (1%) |        3013 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.652 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  14.417 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.162 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.743 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.798 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.125 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.198 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.185 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.872 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  33.549 ms (5%) |  5.980 ms |  64.83 MiB (1%) |     2097891 |
| `["words", "nthreads=2"]`                           |  20.313 ms (5%) |           |  65.55 MiB (1%) |     2098044 |
| `["words", "nthreads=4"]`                           |  21.136 ms (5%) |           |  66.00 MiB (1%) |     2098191 |

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
       #1  2095 MHz      73793 s          0 s       2870 s      21850 s          0 s
       #2  2095 MHz      68940 s          0 s       3118 s      26682 s          0 s
       
  Memory: 6.764884948730469 GB (3013.76953125 MB free)
  Uptime: 1007.0 sec
  Load Avg:  1.6611328125  1.6083984375  1.12451171875
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
    CPU MHz:             2095.198
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

