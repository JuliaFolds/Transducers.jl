# Multi-thread benchmark result

* Pull request commit: [`b60174ebeeae09ea0f39b73b8f09b74244c0fe07`](https://github.com/JuliaFolds/Transducers.jl/commit/b60174ebeeae09ea0f39b73b8f09b74244c0fe07)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/331> (Fix GroupByViewDict used with stateful transducers)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Jul 2020 - 08:43
    - Baseline: 3 Jul 2020 - 08:48
* Package commits:
    - Target: f0951b
    - Baseline: 8bcb4a
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
| `["collect", "unordered", "basesize=1024"]`         |                   1.04 (5%)  |                1.05 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   0.98 (5%)  | 0.87 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=16384"]`  |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   0.96 (5%)  | 0.98 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.92 (5%) :white_check_mark: | 0.99 (1%) :white_check_mark: |

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
       #1  2294 MHz      49912 s          0 s       2478 s      62674 s          0 s
       #2  2294 MHz      49751 s          0 s       2739 s      62350 s          0 s
       
  Memory: 6.764884948730469 GB (2997.65625 MB free)
  Uptime: 1169.0 sec
  Load Avg:  1.7578125  1.52392578125  0.89990234375
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
       #1  2294 MHz      72936 s          0 s       3135 s      67433 s          0 s
       #2  2294 MHz      70994 s          0 s       3262 s      69097 s          0 s
       
  Memory: 6.764884948730469 GB (3035.4140625 MB free)
  Uptime: 1456.0 sec
  Load Avg:  1.7724609375  1.607421875  1.10205078125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 8:43
* Package commit: f0951b
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
| `["collect", "assoc", "basesize=1"]`                | 282.194 ms (5%) | 13.143 ms |  87.55 MiB (1%) |     1590632 |
| `["collect", "assoc", "basesize=1024"]`             | 146.773 ms (5%) |           |   1.84 MiB (1%) |        1810 |
| `["collect", "assoc", "basesize=32"]`               | 152.936 ms (5%) |           |   5.64 MiB (1%) |       54011 |
| `["collect", "seq"]`                                | 290.364 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 385.260 ms (5%) |           |  29.18 MiB (1%) |      404763 |
| `["collect", "unordered", "basesize=1024"]`         | 246.396 ms (5%) |           | 938.39 KiB (1%) |       13149 |
| `["collect", "unordered", "basesize=32"]`           | 180.927 ms (5%) |           |   1.50 MiB (1%) |       18562 |
| `["findfirst", "n=1000", "foldl"]`                  | 474.650 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 255.756 ms (5%) |           | 562.80 KiB (1%) |       10150 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 250.342 ms (5%) |           | 286.64 KiB (1%) |        5187 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 254.605 ms (5%) |           | 148.98 KiB (1%) |        2704 |
| `["findfirst", "n=400", "foldl"]`                   | 351.606 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 186.492 ms (5%) |           |   1.02 MiB (1%) |       18826 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 185.785 ms (5%) |           | 524.98 KiB (1%) |        9499 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 187.285 ms (5%) |           | 266.64 KiB (1%) |        4842 |
| `["findfirst", "n=500", "foldl"]`                   |  59.631 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  31.854 ms (5%) |           | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  31.313 ms (5%) |           |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  33.637 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 171.799 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 165.300 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 310.599 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.405 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.029 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.681 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.293 ms (5%) |           |   1.22 MiB (1%) |         233 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  18.989 ms (5%) |           |   1.03 MiB (1%) |        3834 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.693 ms (5%) |           |   1.23 MiB (1%) |         630 |
| `["parallel_histogram", "seq"]`                     |   6.165 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.368 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.233 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   5.939 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.879 ms (5%) |           |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  11.098 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.029 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.910 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.728 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.421 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.307 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.100 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.987 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  33.778 ms (5%) |  6.491 ms |  64.73 MiB (1%) |     2094844 |
| `["words", "nthreads=2"]`                           |  18.897 ms (5%) |           |  65.09 MiB (1%) |     2094921 |
| `["words", "nthreads=4"]`                           |  19.848 ms (5%) |           |  65.99 MiB (1%) |     2095218 |

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
       #1  2294 MHz      49912 s          0 s       2478 s      62674 s          0 s
       #2  2294 MHz      49751 s          0 s       2739 s      62350 s          0 s
       
  Memory: 6.764884948730469 GB (2997.65625 MB free)
  Uptime: 1169.0 sec
  Load Avg:  1.7578125  1.52392578125  0.89990234375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 8:48
* Package commit: 8bcb4a
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
| `["collect", "assoc", "basesize=1"]`                | 279.724 ms (5%) | 10.624 ms |  87.55 MiB (1%) |     1590744 |
| `["collect", "assoc", "basesize=1024"]`             | 148.707 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 155.413 ms (5%) |           |   5.64 MiB (1%) |       54012 |
| `["collect", "seq"]`                                | 287.826 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 385.766 ms (5%) |           |  29.20 MiB (1%) |      405762 |
| `["collect", "unordered", "basesize=1024"]`         | 237.644 ms (5%) |           | 889.86 KiB (1%) |       10043 |
| `["collect", "unordered", "basesize=32"]`           | 179.517 ms (5%) |           |   1.49 MiB (1%) |       18155 |
| `["findfirst", "n=1000", "foldl"]`                  | 489.243 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 252.146 ms (5%) |           | 564.08 KiB (1%) |       10232 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 245.616 ms (5%) |           | 287.22 KiB (1%) |        5224 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 249.697 ms (5%) |           | 149.19 KiB (1%) |        2717 |
| `["findfirst", "n=400", "foldl"]`                   | 360.030 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 185.410 ms (5%) |           |   1.02 MiB (1%) |       18980 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 186.894 ms (5%) |           | 526.08 KiB (1%) |        9569 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 187.588 ms (5%) |           | 267.17 KiB (1%) |        4876 |
| `["findfirst", "n=500", "foldl"]`                   |  59.210 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  31.449 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  31.407 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  33.011 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 166.900 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 165.500 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 296.600 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.396 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.122 ms (5%) |           |   2.07 MiB (1%) |         501 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.682 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  11.370 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.767 ms (5%) |           |   1.05 MiB (1%) |        5337 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.143 ms (5%) |           |   1.24 MiB (1%) |        1587 |
| `["parallel_histogram", "seq"]`                     |   6.128 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.418 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.243 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.036 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.871 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  11.108 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.039 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.847 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.631 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.331 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.252 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.141 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.846 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  32.589 ms (5%) |  5.919 ms |  64.55 MiB (1%) |     2089143 |
| `["words", "nthreads=2"]`                           |  18.856 ms (5%) |           |  65.27 MiB (1%) |     2089297 |
| `["words", "nthreads=4"]`                           |  19.287 ms (5%) |           |  65.72 MiB (1%) |     2089445 |

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
       #1  2294 MHz      72936 s          0 s       3135 s      67433 s          0 s
       #2  2294 MHz      70994 s          0 s       3262 s      69097 s          0 s
       
  Memory: 6.764884948730469 GB (3035.4140625 MB free)
  Uptime: 1456.0 sec
  Load Avg:  1.7724609375  1.607421875  1.10205078125
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
    CPU MHz:             2294.685
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

