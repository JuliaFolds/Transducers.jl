# Multi-thread benchmark result

* Pull request commit: [`8c33dc4f328574cd79ff5e65b7ae2521f98b9325`](https://github.com/JuliaFolds/Transducers.jl/commit/8c33dc4f328574cd79ff5e65b7ae2521f98b9325)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/368> (Use LiterateTest)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 25 Jul 2020 - 03:21
    - Baseline: 25 Jul 2020 - 03:26
* Package commits:
    - Target: 75b79a
    - Baseline: 789c4d
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
| `["collect", "unordered", "basesize=1024"]`         |                1.07 (5%) :x: |                1.03 (1%) :x: |
| `["overhead", "stoppable=true"]`                    |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.90 (5%) :white_check_mark: | 0.99 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                   1.03 (5%)  | 0.99 (1%) :white_check_mark: |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      52008 s          0 s       2261 s      19768 s          0 s
       #2  2095 MHz      51764 s          0 s       2684 s      19651 s          0 s
       
  Memory: 6.764884948730469 GB (2977.4453125 MB free)
  Uptime: 761.0 sec
  Load Avg:  1.6103515625  1.53515625  0.97509765625
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
  uname: Linux 5.3.0-1032-azure #33~18.04.1-Ubuntu SMP Fri Jun 26 15:01:15 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      77586 s          0 s       2730 s      24621 s          0 s
       #2  2095 MHz      73200 s          0 s       3174 s      28754 s          0 s
       
  Memory: 6.764884948730469 GB (2959.9609375 MB free)
  Uptime: 1073.0 sec
  Load Avg:  1.6953125  1.595703125  1.15966796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 3:21
* Package commit: 75b79a
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
| `["collect", "assoc", "basesize=1"]`                | 398.434 ms (5%) | 12.111 ms |  87.55 MiB (1%) |     1590780 |
| `["collect", "assoc", "basesize=1024"]`             | 251.195 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 256.258 ms (5%) |           |   5.64 MiB (1%) |       54019 |
| `["collect", "seq"]`                                | 497.902 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 506.177 ms (5%) |           |  29.16 MiB (1%) |      403368 |
| `["collect", "unordered", "basesize=1024"]`         | 328.002 ms (5%) |           | 838.91 KiB (1%) |        6737 |
| `["collect", "unordered", "basesize=32"]`           | 281.200 ms (5%) |           |   1.47 MiB (1%) |       16578 |
| `["findfirst", "n=1000", "foldl"]`                  | 791.823 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 401.104 ms (5%) |           | 564.06 KiB (1%) |       10231 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 399.168 ms (5%) |           | 287.20 KiB (1%) |        5223 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 406.696 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 593.140 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 302.868 ms (5%) |           |   1.02 MiB (1%) |       18980 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 300.441 ms (5%) |           | 526.13 KiB (1%) |        9572 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 302.913 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   | 102.577 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  52.601 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  52.398 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  54.375 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 217.212 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 214.311 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 380.820 μs (5%) |           | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.570 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.341 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.962 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.962 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.659 ms (5%) |           |   1.06 MiB (1%) |        4532 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.912 ms (5%) |  2.034 ms |   1.23 MiB (1%) |         899 |
| `["parallel_histogram", "seq"]`                     |  10.141 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  20.006 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |  10.516 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |  10.308 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |  10.157 ms (5%) |           |  76.31 KiB (1%) |        1488 |
| `["sum", "uniform", "foldl"]`                       |  19.402 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |  10.228 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |  10.039 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.866 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  20.099 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |  10.610 ms (5%) |           | 313.23 KiB (1%) |        6061 |
| `["sum", "valley", "reduce", "basesize=256"]`       |  10.379 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |  10.237 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  53.354 ms (5%) |  8.459 ms |  63.30 MiB (1%) |     2068512 |
| `["words", "nthreads=2"]`                           |  26.316 ms (5%) |           |  63.90 MiB (1%) |     2076623 |
| `["words", "nthreads=4"]`                           |  27.197 ms (5%) |           |  64.87 MiB (1%) |     2084843 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      52008 s          0 s       2261 s      19768 s          0 s
       #2  2095 MHz      51764 s          0 s       2684 s      19651 s          0 s
       
  Memory: 6.764884948730469 GB (2977.4453125 MB free)
  Uptime: 761.0 sec
  Load Avg:  1.6103515625  1.53515625  0.97509765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 3:26
* Package commit: 789c4d
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
| `["collect", "assoc", "basesize=1"]`                | 400.093 ms (5%) | 11.948 ms |  87.55 MiB (1%) |     1590836 |
| `["collect", "assoc", "basesize=1024"]`             | 251.470 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 256.413 ms (5%) |           |   5.64 MiB (1%) |       54005 |
| `["collect", "seq"]`                                | 497.181 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 530.500 ms (5%) |           |  29.17 MiB (1%) |      403609 |
| `["collect", "unordered", "basesize=1024"]`         | 305.959 ms (5%) |           | 815.52 KiB (1%) |        4949 |
| `["collect", "unordered", "basesize=32"]`           | 284.945 ms (5%) |           |   1.47 MiB (1%) |       16763 |
| `["findfirst", "n=1000", "foldl"]`                  | 788.116 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 399.537 ms (5%) |           | 564.05 KiB (1%) |       10230 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 396.034 ms (5%) |           | 287.25 KiB (1%) |        5226 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 407.151 ms (5%) |           | 149.25 KiB (1%) |        2721 |
| `["findfirst", "n=400", "foldl"]`                   | 590.603 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 301.708 ms (5%) |           |   1.02 MiB (1%) |       18970 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 297.952 ms (5%) |           | 526.19 KiB (1%) |        9576 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 299.942 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   | 101.619 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  52.317 ms (5%) |           | 157.38 KiB (1%) |        2853 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  52.062 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  54.270 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 214.121 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 217.822 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 354.135 μs (5%) |           | 146.36 KiB (1%) |        2642 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.564 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.323 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.941 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  16.335 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  27.520 ms (5%) |           |   1.07 MiB (1%) |        6145 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.302 ms (5%) |           |   1.25 MiB (1%) |        2051 |
| `["parallel_histogram", "seq"]`                     |  10.140 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  20.002 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |  10.621 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |  10.417 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |  10.254 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  19.333 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |  10.214 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |  10.009 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.867 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  20.047 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |  10.640 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |  10.455 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |  10.343 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  53.915 ms (5%) |  7.856 ms |  62.97 MiB (1%) |     2057143 |
| `["words", "nthreads=2"]`                           |  26.988 ms (5%) |           |  64.05 MiB (1%) |     2069363 |
| `["words", "nthreads=4"]`                           |  27.583 ms (5%) |           |  65.00 MiB (1%) |     2079819 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      77586 s          0 s       2730 s      24621 s          0 s
       #2  2095 MHz      73200 s          0 s       3174 s      28754 s          0 s
       
  Memory: 6.764884948730469 GB (2959.9609375 MB free)
  Uptime: 1073.0 sec
  Load Avg:  1.6953125  1.595703125  1.15966796875
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

