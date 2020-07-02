# Multi-thread benchmark result

* Pull request commit: [`6c04f38efd33c5f2f8ee9a5133a9afa28afc1150`](https://github.com/JuliaFolds/Transducers.jl/commit/6c04f38efd33c5f2f8ee9a5133a9afa28afc1150)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/324> (Optimize append!!(dest, src::Foldable))

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 2 Jul 2020 - 01:52
    - Baseline: 2 Jul 2020 - 01:57
* Package commits:
    - Target: fe606e
    - Baseline: 6b039c
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
| `["parallel_histogram", "comm", "basesize=16384"]`  | 0.92 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   0.95 (5%)  | 1.02 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.87 (5%) :white_check_mark: |    0.99 (1%)  |
| `["words", "nthreads=4"]`                           |                1.07 (5%) :x: |    1.00 (1%)  |

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
       #1  2294 MHz      53097 s          0 s       2384 s      14991 s          0 s
       #2  2294 MHz      47774 s          0 s       2587 s      20440 s          0 s
       
  Memory: 6.764884948730469 GB (3050.4296875 MB free)
  Uptime: 726.0 sec
  Load Avg:  1.72509765625  1.5224609375  0.90478515625
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
       #1  2294 MHz      77354 s          0 s       3054 s      19713 s          0 s
       #2  2294 MHz      69011 s          0 s       3213 s      28230 s          0 s
       
  Memory: 6.764884948730469 GB (3046.40625 MB free)
  Uptime: 1024.0 sec
  Load Avg:  1.69189453125  1.58935546875  1.1025390625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 1:52
* Package commit: fe606e
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
| `["collect", "assoc", "basesize=1"]`                | 316.362 ms (5%) | 14.152 ms |  87.55 MiB (1%) |     1590669 |
| `["collect", "assoc", "basesize=1024"]`             | 165.998 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 169.106 ms (5%) |           |   5.64 MiB (1%) |       54021 |
| `["collect", "seq"]`                                | 313.368 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 426.114 ms (5%) |           |  29.20 MiB (1%) |      405723 |
| `["collect", "unordered", "basesize=1024"]`         | 263.189 ms (5%) |           | 911.55 KiB (1%) |       11431 |
| `["collect", "unordered", "basesize=32"]`           | 200.397 ms (5%) |           |   1.49 MiB (1%) |       18297 |
| `["findfirst", "n=1000", "foldl"]`                  | 526.146 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 274.266 ms (5%) |           | 563.88 KiB (1%) |       10219 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 269.540 ms (5%) |           | 287.19 KiB (1%) |        5222 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 274.995 ms (5%) |           | 149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 393.669 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 200.385 ms (5%) |           |   1.02 MiB (1%) |       18968 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 198.942 ms (5%) |           | 526.09 KiB (1%) |        9570 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 203.270 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  61.470 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  33.027 ms (5%) |           | 157.38 KiB (1%) |        2853 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  32.735 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  35.186 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 169.604 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 167.104 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=true"]`                    | 307.307 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.496 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.137 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.680 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.551 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.267 ms (5%) |           |   1.05 MiB (1%) |        4954 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.483 ms (5%) |           |   1.23 MiB (1%) |         476 |
| `["parallel_histogram", "seq"]`                     |   6.174 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.889 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.244 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.035 ms (5%) |           | 155.13 KiB (1%) |        3013 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.086 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  11.425 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.101 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.768 ms (5%) |           | 155.05 KiB (1%) |        3008 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.728 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.451 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.206 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   5.959 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.910 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  35.032 ms (5%) |  6.520 ms |  64.60 MiB (1%) |     2090580 |
| `["words", "nthreads=2"]`                           |  19.020 ms (5%) |           |  64.96 MiB (1%) |     2090656 |
| `["words", "nthreads=4"]`                           |  20.383 ms (5%) |           |  65.86 MiB (1%) |     2090954 |

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
       #1  2294 MHz      53097 s          0 s       2384 s      14991 s          0 s
       #2  2294 MHz      47774 s          0 s       2587 s      20440 s          0 s
       
  Memory: 6.764884948730469 GB (3050.4296875 MB free)
  Uptime: 726.0 sec
  Load Avg:  1.72509765625  1.5224609375  0.90478515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 1:57
* Package commit: 6b039c
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
| `["collect", "assoc", "basesize=1"]`                | 310.026 ms (5%) | 11.780 ms |  87.55 MiB (1%) |     1590594 |
| `["collect", "assoc", "basesize=1024"]`             | 164.882 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 167.937 ms (5%) |           |   5.64 MiB (1%) |       53992 |
| `["collect", "seq"]`                                | 317.455 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 440.667 ms (5%) |           |  29.19 MiB (1%) |      405542 |
| `["collect", "unordered", "basesize=1024"]`         | 257.537 ms (5%) |           | 912.30 KiB (1%) |       11479 |
| `["collect", "unordered", "basesize=32"]`           | 199.844 ms (5%) |           |   1.49 MiB (1%) |       18248 |
| `["findfirst", "n=1000", "foldl"]`                  | 528.084 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 272.983 ms (5%) |           | 564.08 KiB (1%) |       10232 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 272.174 ms (5%) |           | 287.13 KiB (1%) |        5218 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 281.492 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 386.992 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 203.454 ms (5%) |           |   1.02 MiB (1%) |       18968 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 205.095 ms (5%) |           | 526.16 KiB (1%) |        9574 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 207.879 ms (5%) |           | 267.16 KiB (1%) |        4875 |
| `["findfirst", "n=500", "foldl"]`                   |  64.398 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  33.976 ms (5%) |           | 157.31 KiB (1%) |        2849 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  33.587 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  35.276 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 168.003 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 168.203 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 316.904 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.494 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.249 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.709 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.658 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.189 ms (5%) |           |   1.02 MiB (1%) |        3477 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.599 ms (5%) |           |   1.24 MiB (1%) |        1194 |
| `["parallel_histogram", "seq"]`                     |   6.075 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  12.282 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.189 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.041 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.932 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  11.295 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   5.920 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.982 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.850 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.483 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.410 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   5.972 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.855 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  35.830 ms (5%) |  7.172 ms |  64.80 MiB (1%) |     2096728 |
| `["words", "nthreads=2"]`                           |  19.430 ms (5%) |           |  65.16 MiB (1%) |     2096804 |
| `["words", "nthreads=4"]`                           |  19.047 ms (5%) |           |  65.87 MiB (1%) |     2096958 |

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
       #1  2294 MHz      77354 s          0 s       3054 s      19713 s          0 s
       #2  2294 MHz      69011 s          0 s       3213 s      28230 s          0 s
       
  Memory: 6.764884948730469 GB (3046.40625 MB free)
  Uptime: 1024.0 sec
  Load Avg:  1.69189453125  1.58935546875  1.1025390625
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
    CPU MHz:             2294.690
    BogoMIPS:            4589.38
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

