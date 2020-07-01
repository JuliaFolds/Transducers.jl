# Multi-thread benchmark result

* Target commit: [`960e3c0cab6b880046e89470dfdfa9b14462fbf7`](https://github.com/JuliaFolds/Transducers.jl/commit/960e3c0cab6b880046e89470dfdfa9b14462fbf7)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/323> (Re-enable "full" method ambiguity test)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 05:50
    - Baseline: 1 Jul 2020 - 05:55
* Package commits:
    - Target: c79b47
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

| ID                                                  | time ratio                   | memory ratio                 |
|-----------------------------------------------------|------------------------------|------------------------------|
| `["collect", "unordered", "basesize=1024"]`         | 0.89 (5%) :white_check_mark: | 0.88 (1%) :white_check_mark: |
| `["overhead", "stoppable=true"]`                    | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   1.01 (5%)  |                1.15 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   1.03 (5%)  | 0.98 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |

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
       #1  2095 MHz      46495 s          0 s       2250 s      24332 s          0 s
       #2  2095 MHz      54950 s          0 s       2618 s      15221 s          0 s
       
  Memory: 6.764884948730469 GB (3138.484375 MB free)
  Uptime: 749.0 sec
  Load Avg:  1.72021484375  1.537109375  0.9150390625
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
       #1  2095 MHz      72054 s          0 s       2825 s      28137 s          0 s
       #2  2095 MHz      75188 s          0 s       3129 s      24404 s          0 s
       
  Memory: 6.764884948730469 GB (3152.1484375 MB free)
  Uptime: 1051.0 sec
  Load Avg:  1.68701171875  1.58544921875  1.1064453125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:50
* Package commit: c79b47
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
| `["collect", "assoc", "basesize=1"]`                | 391.654 ms (5%) | 12.623 ms |  87.55 MiB (1%) |     1590744 |
| `["collect", "assoc", "basesize=1024"]`             | 249.870 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 253.373 ms (5%) |           |   5.64 MiB (1%) |       54006 |
| `["collect", "seq"]`                                | 496.467 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 509.145 ms (5%) |           |  29.16 MiB (1%) |      403345 |
| `["collect", "unordered", "basesize=1024"]`         | 328.571 ms (5%) |           | 825.72 KiB (1%) |        5938 |
| `["collect", "unordered", "basesize=32"]`           | 281.526 ms (5%) |           |   1.47 MiB (1%) |       16645 |
| `["findfirst", "n=1000", "foldl"]`                  | 788.845 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 397.091 ms (5%) |           | 564.03 KiB (1%) |       10229 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 396.313 ms (5%) |           | 287.19 KiB (1%) |        5222 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 398.967 ms (5%) |           | 149.19 KiB (1%) |        2717 |
| `["findfirst", "n=400", "foldl"]`                   | 592.656 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 299.630 ms (5%) |           |   1.02 MiB (1%) |       18982 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 298.269 ms (5%) |           | 526.20 KiB (1%) |        9577 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 300.222 ms (5%) |           | 267.23 KiB (1%) |        4880 |
| `["findfirst", "n=500", "foldl"]`                   | 102.559 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  52.318 ms (5%) |           | 157.39 KiB (1%) |        2854 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  52.101 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  54.696 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 209.701 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 212.501 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 351.501 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.567 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.385 ms (5%) |           |   2.07 MiB (1%) |         500 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   6.030 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.839 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.391 ms (5%) |           |   1.05 MiB (1%) |        4004 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.538 ms (5%) |           |   1.24 MiB (1%) |        1145 |
| `["parallel_histogram", "seq"]`                     |  10.146 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  19.835 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |  10.404 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |  10.221 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |  10.094 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "uniform", "foldl"]`                       |  19.368 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |  10.197 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.994 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.842 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  20.063 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |  10.521 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |  10.353 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |  10.214 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  41.749 ms (5%) |  7.235 ms |  65.03 MiB (1%) |     2104512 |
| `["words", "nthreads=2"]`                           |  23.119 ms (5%) |           |  65.39 MiB (1%) |     2104588 |
| `["words", "nthreads=4"]`                           |  24.491 ms (5%) |           |  66.29 MiB (1%) |     2104886 |

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
       #1  2095 MHz      46495 s          0 s       2250 s      24332 s          0 s
       #2  2095 MHz      54950 s          0 s       2618 s      15221 s          0 s
       
  Memory: 6.764884948730469 GB (3138.484375 MB free)
  Uptime: 749.0 sec
  Load Avg:  1.72021484375  1.537109375  0.9150390625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:55
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
| `["collect", "assoc", "basesize=1"]`                | 388.044 ms (5%) | 11.933 ms |  87.55 MiB (1%) |     1590848 |
| `["collect", "assoc", "basesize=1024"]`             | 249.399 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 253.367 ms (5%) |           |   5.64 MiB (1%) |       54012 |
| `["collect", "seq"]`                                | 496.198 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 505.642 ms (5%) |           |  29.16 MiB (1%) |      403468 |
| `["collect", "unordered", "basesize=1024"]`         | 370.734 ms (5%) |           | 936.33 KiB (1%) |       13017 |
| `["collect", "unordered", "basesize=32"]`           | 280.812 ms (5%) |           |   1.47 MiB (1%) |       16800 |
| `["findfirst", "n=1000", "foldl"]`                  | 781.176 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 396.054 ms (5%) |           | 564.20 KiB (1%) |       10240 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 394.440 ms (5%) |           | 287.33 KiB (1%) |        5231 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 401.000 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 586.368 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 298.131 ms (5%) |           |   1.02 MiB (1%) |       18969 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 296.699 ms (5%) |           | 526.25 KiB (1%) |        9580 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 298.728 ms (5%) |           | 267.08 KiB (1%) |        4870 |
| `["findfirst", "n=500", "foldl"]`                   | 101.478 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  52.059 ms (5%) |           | 157.39 KiB (1%) |        2854 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  51.797 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  54.903 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 212.302 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 210.002 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 370.203 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.573 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.350 ms (5%) |           |   1.80 MiB (1%) |         496 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.952 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.738 ms (5%) |           |   1.22 MiB (1%) |         196 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.722 ms (5%) |           |   1.07 MiB (1%) |        4232 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  21.016 ms (5%) |           |   1.24 MiB (1%) |        1322 |
| `["parallel_histogram", "seq"]`                     |  10.148 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  20.020 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |  10.516 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |  10.333 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |  10.168 ms (5%) |           |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  19.379 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |  10.170 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.961 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.836 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  20.034 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |  10.498 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |  10.339 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |  10.183 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  41.391 ms (5%) |  6.881 ms |  64.79 MiB (1%) |     2096436 |
| `["words", "nthreads=2"]`                           |  22.631 ms (5%) |           |  65.15 MiB (1%) |     2096512 |
| `["words", "nthreads=4"]`                           |  24.070 ms (5%) |           |  66.06 MiB (1%) |     2096809 |

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
       #1  2095 MHz      72054 s          0 s       2825 s      28137 s          0 s
       #2  2095 MHz      75188 s          0 s       3129 s      24404 s          0 s
       
  Memory: 6.764884948730469 GB (3152.1484375 MB free)
  Uptime: 1051.0 sec
  Load Avg:  1.68701171875  1.58544921875  1.1064453125
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
    CPU MHz:             2095.075
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

