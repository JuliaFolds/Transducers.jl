# Multi-thread benchmark result

* Pull request commit: [`5f58820c974270769d1c5c382c322b9075ac43a8`](https://github.com/JuliaFolds/Transducers.jl/commit/5f58820c974270769d1c5c382c322b9075ac43a8)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/335> (Demonstrate how to use MicroCollections.jl for singleton solutions)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Jul 2020 - 21:49
    - Baseline: 4 Jul 2020 - 21:54
* Package commits:
    - Target: 671ef8
    - Baseline: 381325
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
| `["collect", "assoc", "basesize=1"]`                |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1"]`            |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.20 (5%) :x: |                1.10 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.76 (5%) :white_check_mark: | 0.92 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.92 (5%) :white_check_mark: |                1.02 (1%) :x: |

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
       #1  2294 MHz      54891 s          0 s       2442 s      15134 s          0 s
       #2  2294 MHz      44897 s          0 s       2790 s      25626 s          0 s
       
  Memory: 6.764884948730469 GB (2973.07421875 MB free)
  Uptime: 751.0 sec
  Load Avg:  1.6298828125  1.54345703125  0.95947265625
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
       #1  2294 MHz      75820 s          0 s       3129 s      21582 s          0 s
       #2  2294 MHz      67898 s          0 s       3298 s      30188 s          0 s
       
  Memory: 6.764884948730469 GB (3014.71484375 MB free)
  Uptime: 1034.0 sec
  Load Avg:  1.791015625  1.6591796875  1.1630859375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 21:49
* Package commit: 671ef8
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

| ID                                                  | time            | GC time   | memory           | allocations |
|-----------------------------------------------------|----------------:|----------:|-----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 298.556 ms (5%) | 10.317 ms |   87.55 MiB (1%) |     1590658 |
| `["collect", "assoc", "basesize=1024"]`             | 157.339 ms (5%) |           |    1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 162.942 ms (5%) |           |    5.64 MiB (1%) |       54016 |
| `["collect", "seq"]`                                | 291.947 ms (5%) |           |    1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 437.748 ms (5%) |           |   29.20 MiB (1%) |      406051 |
| `["collect", "unordered", "basesize=1024"]`         | 256.944 ms (5%) |           |  923.91 KiB (1%) |       12222 |
| `["collect", "unordered", "basesize=32"]`           | 191.789 ms (5%) |           |    1.50 MiB (1%) |       18634 |
| `["findfirst", "n=1000", "foldl"]`                  | 500.027 ms (5%) |           |                  |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 257.646 ms (5%) |           |  564.11 KiB (1%) |       10234 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 259.315 ms (5%) |           |  287.14 KiB (1%) |        5219 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 250.433 ms (5%) |           |  149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 366.966 ms (5%) |           |                  |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 194.582 ms (5%) |           |    1.02 MiB (1%) |       18977 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 189.934 ms (5%) |           |  526.13 KiB (1%) |        9572 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 188.305 ms (5%) |           |  267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  60.260 ms (5%) |           |                  |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  31.081 ms (5%) |           |  157.31 KiB (1%) |        2849 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  32.179 ms (5%) |           |   84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  33.466 ms (5%) |           |   48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 164.000 μs (5%) |           |  146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 167.100 μs (5%) |           |  146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 296.101 μs (5%) |           |  146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.415 ms (5%) |           |  732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   3.978 ms (5%) |           |    1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.682 ms (5%) |           |    1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  11.969 ms (5%) |           |    1.22 MiB (1%) |         268 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  14.723 ms (5%) |           | 1000.91 KiB (1%) |         423 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.876 ms (5%) |           |    1.25 MiB (1%) |        2136 |
| `["parallel_histogram", "seq"]`                     |   6.175 ms (5%) |           |  364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.570 ms (5%) |           |                  |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.140 ms (5%) |           |  313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   5.922 ms (5%) |           |  155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.834 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.155 ms (5%) |           |                  |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   5.982 ms (5%) |           |  313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.699 ms (5%) |           |  155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.607 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.474 ms (5%) |           |                  |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.038 ms (5%) |           |  313.30 KiB (1%) |        6065 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   5.934 ms (5%) |           |  155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.787 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  33.815 ms (5%) |  6.738 ms |   64.75 MiB (1%) |     2095098 |
| `["words", "nthreads=2"]`                           |  17.749 ms (5%) |           |   65.11 MiB (1%) |     2095175 |
| `["words", "nthreads=4"]`                           |  18.366 ms (5%) |           |   65.83 MiB (1%) |     2095330 |

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
       #1  2294 MHz      54891 s          0 s       2442 s      15134 s          0 s
       #2  2294 MHz      44897 s          0 s       2790 s      25626 s          0 s
       
  Memory: 6.764884948730469 GB (2973.07421875 MB free)
  Uptime: 751.0 sec
  Load Avg:  1.6298828125  1.54345703125  0.95947265625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 21:54
* Package commit: 381325
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
| `["collect", "assoc", "basesize=1"]`                | 281.770 ms (5%) | 11.785 ms |  87.55 MiB (1%) |     1590727 |
| `["collect", "assoc", "basesize=1024"]`             | 153.707 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 161.536 ms (5%) |           |   5.64 MiB (1%) |       54016 |
| `["collect", "seq"]`                                | 306.455 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 399.899 ms (5%) |           |  29.20 MiB (1%) |      406014 |
| `["collect", "unordered", "basesize=1024"]`         | 213.466 ms (5%) |           | 842.66 KiB (1%) |        7022 |
| `["collect", "unordered", "basesize=32"]`           | 190.043 ms (5%) |           |   1.50 MiB (1%) |       18556 |
| `["findfirst", "n=1000", "foldl"]`                  | 510.013 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 258.509 ms (5%) |           | 563.89 KiB (1%) |       10220 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 252.704 ms (5%) |           | 287.14 KiB (1%) |        5219 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 261.905 ms (5%) |           | 149.25 KiB (1%) |        2721 |
| `["findfirst", "n=400", "foldl"]`                   | 374.513 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 191.044 ms (5%) |           |   1.02 MiB (1%) |       18964 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 192.567 ms (5%) |           | 526.09 KiB (1%) |        9570 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 193.380 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  61.518 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  31.650 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  31.685 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  34.046 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 161.400 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 162.000 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 284.901 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.360 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   3.954 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.629 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  11.598 ms (5%) |           |   1.22 MiB (1%) |         279 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.466 ms (5%) |           |   1.06 MiB (1%) |        4634 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.332 ms (5%) |           |   1.22 MiB (1%) |         402 |
| `["parallel_histogram", "seq"]`                     |   6.040 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.502 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.047 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "random", "reduce", "basesize=256"]`       |   5.827 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.771 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.192 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   5.929 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.710 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.621 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.502 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.095 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   5.903 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.857 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["words", "nthreads=1"]`                           |  33.331 ms (5%) |  6.146 ms |  64.73 MiB (1%) |     2094210 |
| `["words", "nthreads=2"]`                           |  17.817 ms (5%) |           |  65.09 MiB (1%) |     2094287 |
| `["words", "nthreads=4"]`                           |  18.050 ms (5%) |           |  65.81 MiB (1%) |     2094441 |

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
       #1  2294 MHz      75820 s          0 s       3129 s      21582 s          0 s
       #2  2294 MHz      67898 s          0 s       3298 s      30188 s          0 s
       
  Memory: 6.764884948730469 GB (3014.71484375 MB free)
  Uptime: 1034.0 sec
  Load Avg:  1.791015625  1.6591796875  1.1630859375
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

