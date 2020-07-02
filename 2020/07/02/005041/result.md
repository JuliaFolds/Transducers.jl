# Multi-thread benchmark result

* Pull request commit: [`ac99e81223d6a88f4f00c28fa2ed48dc26749167`](https://github.com/JuliaFolds/Transducers.jl/commit/ac99e81223d6a88f4f00c28fa2ed48dc26749167)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 2 Jul 2020 - 00:44
    - Baseline: 2 Jul 2020 - 00:50
* Package commits:
    - Target: 4ce304
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

| ID                                                  | time ratio                   | memory ratio                 |
|-----------------------------------------------------|------------------------------|------------------------------|
| `["collect", "unordered", "basesize=1024"]`         | 0.90 (5%) :white_check_mark: | 0.90 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   0.97 (5%)  |                1.02 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.87 (5%) :white_check_mark: |                   0.99 (1%)  |
| `["words", "nthreads=2"]`                           |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           |                1.05 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz      52628 s          0 s       2845 s      74750 s          0 s
       #2  2397 MHz      49336 s          0 s       2858 s      77770 s          0 s
       
  Memory: 6.764884948730469 GB (3112.78515625 MB free)
  Uptime: 1321.0 sec
  Load Avg:  1.662109375  1.47998046875  0.90576171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

### Baseline
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz      77269 s          0 s       3587 s      82788 s          0 s
       #2  2397 MHz      73815 s          0 s       3647 s      86007 s          0 s
       
  Memory: 6.764884948730469 GB (3098.03125 MB free)
  Uptime: 1658.0 sec
  Load Avg:  1.697265625  1.578125  1.119140625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 0:44
* Package commit: 4ce304
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
| `["collect", "assoc", "basesize=1"]`                | 409.416 ms (5%) | 12.042 ms |  87.55 MiB (1%) |     1590723 |
| `["collect", "assoc", "basesize=1024"]`             | 252.565 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 259.098 ms (5%) |           |   5.64 MiB (1%) |       54021 |
| `["collect", "seq"]`                                | 500.270 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 517.270 ms (5%) |           |  29.12 MiB (1%) |      400690 |
| `["collect", "unordered", "basesize=1024"]`         | 370.165 ms (5%) |           | 858.61 KiB (1%) |        8043 |
| `["collect", "unordered", "basesize=32"]`           | 284.466 ms (5%) |           |   1.50 MiB (1%) |       18632 |
| `["findfirst", "n=1000", "foldl"]`                  | 739.622 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 368.819 ms (5%) |           | 564.11 KiB (1%) |       10234 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 377.189 ms (5%) |           | 287.20 KiB (1%) |        5223 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 376.127 ms (5%) |           | 149.25 KiB (1%) |        2721 |
| `["findfirst", "n=400", "foldl"]`                   | 553.047 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 280.647 ms (5%) |           |   1.02 MiB (1%) |       18969 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 277.325 ms (5%) |           | 526.22 KiB (1%) |        9578 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 275.554 ms (5%) |           | 267.20 KiB (1%) |        4878 |
| `["findfirst", "n=500", "foldl"]`                   |  93.839 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.208 ms (5%) |           | 157.33 KiB (1%) |        2850 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.705 ms (5%) |           |  84.50 KiB (1%) |        1534 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  49.960 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 208.707 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 210.507 μs (5%) |           | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=true"]`                    | 367.612 μs (5%) |           | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.280 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.044 ms (5%) |           |   1.80 MiB (1%) |         494 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.668 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.654 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  18.773 ms (5%) |           |   1.07 MiB (1%) |        3139 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.472 ms (5%) |           |   1.22 MiB (1%) |         405 |
| `["parallel_histogram", "seq"]`                     |   9.623 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.549 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.787 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.609 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.440 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.054 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.522 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.346 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.176 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  18.547 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.746 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.605 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.417 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  46.614 ms (5%) |  8.610 ms |  64.68 MiB (1%) |     2093090 |
| `["words", "nthreads=2"]`                           |  24.464 ms (5%) |           |  65.04 MiB (1%) |     2093166 |
| `["words", "nthreads=4"]`                           |  24.970 ms (5%) |           |  65.95 MiB (1%) |     2093462 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz      52628 s          0 s       2845 s      74750 s          0 s
       #2  2397 MHz      49336 s          0 s       2858 s      77770 s          0 s
       
  Memory: 6.764884948730469 GB (3112.78515625 MB free)
  Uptime: 1321.0 sec
  Load Avg:  1.662109375  1.47998046875  0.90576171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 0:50
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
| `["collect", "assoc", "basesize=1"]`                | 411.699 ms (5%) | 12.358 ms |  87.55 MiB (1%) |     1590752 |
| `["collect", "assoc", "basesize=1024"]`             | 251.384 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 259.504 ms (5%) |           |   5.64 MiB (1%) |       54019 |
| `["collect", "seq"]`                                | 502.397 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 506.630 ms (5%) |           |  29.15 MiB (1%) |      402891 |
| `["collect", "unordered", "basesize=1024"]`         | 410.754 ms (5%) |           | 955.75 KiB (1%) |       14260 |
| `["collect", "unordered", "basesize=32"]`           | 285.903 ms (5%) |           |   1.50 MiB (1%) |       18786 |
| `["findfirst", "n=1000", "foldl"]`                  | 731.051 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 369.024 ms (5%) |           | 563.97 KiB (1%) |       10225 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 371.485 ms (5%) |           | 287.23 KiB (1%) |        5225 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 374.821 ms (5%) |           | 149.30 KiB (1%) |        2724 |
| `["findfirst", "n=400", "foldl"]`                   | 547.141 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 280.261 ms (5%) |           |   1.02 MiB (1%) |       18975 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 282.420 ms (5%) |           | 526.14 KiB (1%) |        9573 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 277.998 ms (5%) |           | 267.20 KiB (1%) |        4878 |
| `["findfirst", "n=500", "foldl"]`                   |  94.125 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  47.718 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.300 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  49.496 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 213.506 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 212.006 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 386.710 μs (5%) |           | 146.44 KiB (1%) |        2647 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.246 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.028 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.643 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.764 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.395 ms (5%) |           |   1.05 MiB (1%) |        2759 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.677 ms (5%) |           |   1.24 MiB (1%) |        1117 |
| `["parallel_histogram", "seq"]`                     |   9.581 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.383 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.714 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.530 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.380 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.061 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.572 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.345 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.197 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "valley", "foldl"]`                        |  18.532 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.799 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.598 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.464 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  45.747 ms (5%) |  8.821 ms |  64.79 MiB (1%) |     2097168 |
| `["words", "nthreads=2"]`                           |  22.740 ms (5%) |           |  65.15 MiB (1%) |     2097244 |
| `["words", "nthreads=4"]`                           |  23.697 ms (5%) |           |  66.06 MiB (1%) |     2097541 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz      77269 s          0 s       3587 s      82788 s          0 s
       #2  2397 MHz      73815 s          0 s       3647 s      86007 s          0 s
       
  Memory: 6.764884948730469 GB (3098.03125 MB free)
  Uptime: 1658.0 sec
  Load Avg:  1.697265625  1.578125  1.119140625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
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
    Model:               63
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz
    Stepping:            2
    CPU MHz:             2397.223
    BogoMIPS:            4794.44
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            30720K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm invpcid_single pti fsgsbase bmi1 avx2 smep bmi2 erms invpcid xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Haswell                                                |
| Model              | Family: 0x06, Model: 0x3f, Stepping: 0x02, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 30720) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 44 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

