# Multi-thread benchmark result

* Pull request commit: [`d8cdd6eb051685a309e85ba49dac9173006afd2c`](https://github.com/JuliaFolds/Transducers.jl/commit/d8cdd6eb051685a309e85ba49dac9173006afd2c)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 5 Jul 2020 - 00:46
    - Baseline: 5 Jul 2020 - 00:52
* Package commits:
    - Target: b7c300
    - Baseline: 42c0b8
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
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.08 (5%) :x: | 1.02 (1%) :x: |
| `["words", "nthreads=2"]`                           | 0.89 (5%) :white_check_mark: | 1.01 (1%) :x: |
| `["words", "nthreads=4"]`                           | 0.93 (5%) :white_check_mark: |    1.01 (1%)  |

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
       #1  2397 MHz      56042 s          0 s       2956 s     223468 s          0 s
       #2  2397 MHz      48170 s          0 s       3196 s     229609 s          0 s
       
  Memory: 6.764884948730469 GB (3019.1171875 MB free)
  Uptime: 2906.0 sec
  Load Avg:  1.6748046875  1.478515625  0.8662109375
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
       #1  2397 MHz      82746 s          0 s       3739 s     229407 s          0 s
       #2  2397 MHz      70343 s          0 s       3969 s     240105 s          0 s
       
  Memory: 6.764884948730469 GB (3030.6484375 MB free)
  Uptime: 3243.0 sec
  Load Avg:  1.6474609375  1.5302734375  1.07275390625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 5 Jul 2020 - 0:46
* Package commit: b7c300
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
| `["collect", "assoc", "basesize=1"]`                | 414.611 ms (5%) | 14.120 ms |  87.55 MiB (1%) |     1590781 |
| `["collect", "assoc", "basesize=1024"]`             | 258.296 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 260.522 ms (5%) |           |   5.64 MiB (1%) |       54006 |
| `["collect", "seq"]`                                | 508.273 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 511.868 ms (5%) | 14.633 ms |  29.17 MiB (1%) |      403751 |
| `["collect", "unordered", "basesize=1024"]`         | 398.048 ms (5%) |           | 935.30 KiB (1%) |       12951 |
| `["collect", "unordered", "basesize=32"]`           | 283.395 ms (5%) |           |   1.50 MiB (1%) |       18419 |
| `["findfirst", "n=1000", "foldl"]`                  | 740.295 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 372.862 ms (5%) |           | 564.16 KiB (1%) |       10237 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 372.033 ms (5%) |           | 287.28 KiB (1%) |        5228 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 376.784 ms (5%) |           | 149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 558.658 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 283.494 ms (5%) |           |   1.02 MiB (1%) |       18960 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 277.552 ms (5%) |           | 526.19 KiB (1%) |        9576 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 289.389 ms (5%) |           | 267.16 KiB (1%) |        4875 |
| `["findfirst", "n=500", "foldl"]`                   |  93.874 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.484 ms (5%) |           | 157.41 KiB (1%) |        2855 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.812 ms (5%) |           |  84.50 KiB (1%) |        1534 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  49.942 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 205.809 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 209.209 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 355.316 μs (5%) |           | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.245 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.027 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.621 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.014 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.480 ms (5%) |           |   1.04 MiB (1%) |        4350 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.439 ms (5%) |           |   1.22 MiB (1%) |         383 |
| `["parallel_histogram", "seq"]`                     |   9.623 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.366 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.685 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.489 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.335 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "uniform", "foldl"]`                       |  18.049 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.512 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.331 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.171 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  18.536 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.795 ms (5%) |           | 313.22 KiB (1%) |        6060 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.614 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.422 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  43.110 ms (5%) |  8.234 ms |  64.86 MiB (1%) |     2098491 |
| `["words", "nthreads=2"]`                           |  22.540 ms (5%) |           |  65.57 MiB (1%) |     2098646 |
| `["words", "nthreads=4"]`                           |  23.412 ms (5%) |           |  66.21 MiB (1%) |     2098937 |

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
       #1  2397 MHz      56042 s          0 s       2956 s     223468 s          0 s
       #2  2397 MHz      48170 s          0 s       3196 s     229609 s          0 s
       
  Memory: 6.764884948730469 GB (3019.1171875 MB free)
  Uptime: 2906.0 sec
  Load Avg:  1.6748046875  1.478515625  0.8662109375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 5 Jul 2020 - 0:52
* Package commit: 42c0b8
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
| `["collect", "assoc", "basesize=1"]`                | 415.118 ms (5%) | 14.921 ms |  87.55 MiB (1%) |     1590778 |
| `["collect", "assoc", "basesize=1024"]`             | 253.791 ms (5%) |           |   1.84 MiB (1%) |        1808 |
| `["collect", "assoc", "basesize=32"]`               | 260.790 ms (5%) |           |   5.64 MiB (1%) |       54015 |
| `["collect", "seq"]`                                | 504.020 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 531.162 ms (5%) |           |  29.17 MiB (1%) |      403780 |
| `["collect", "unordered", "basesize=1024"]`         | 379.823 ms (5%) |           | 926.72 KiB (1%) |       12402 |
| `["collect", "unordered", "basesize=32"]`           | 284.803 ms (5%) |           |   1.50 MiB (1%) |       18965 |
| `["findfirst", "n=1000", "foldl"]`                  | 743.974 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 376.230 ms (5%) |           | 564.06 KiB (1%) |       10231 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 369.334 ms (5%) |           | 287.25 KiB (1%) |        5226 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 373.647 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 547.954 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 279.744 ms (5%) |           |   1.02 MiB (1%) |       18984 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 279.150 ms (5%) |           | 526.25 KiB (1%) |        9580 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 282.819 ms (5%) |           | 267.16 KiB (1%) |        4875 |
| `["findfirst", "n=500", "foldl"]`                   |  94.750 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.497 ms (5%) |           | 157.38 KiB (1%) |        2853 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.976 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  49.988 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 209.809 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 209.609 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 364.415 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.268 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.043 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.673 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.776 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  18.106 ms (5%) |           |   1.01 MiB (1%) |        2756 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.492 ms (5%) |           |   1.23 MiB (1%) |         883 |
| `["parallel_histogram", "seq"]`                     |   9.638 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.449 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.727 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.541 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.386 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.058 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.521 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.304 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.189 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.580 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.749 ms (5%) |           | 313.17 KiB (1%) |        6057 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.591 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.487 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  45.026 ms (5%) |  8.299 ms |  64.51 MiB (1%) |     2087772 |
| `["words", "nthreads=2"]`                           |  25.239 ms (5%) |           |  64.87 MiB (1%) |     2087849 |
| `["words", "nthreads=4"]`                           |  25.292 ms (5%) |           |  65.58 MiB (1%) |     2088005 |

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
       #1  2397 MHz      82746 s          0 s       3739 s     229407 s          0 s
       #2  2397 MHz      70343 s          0 s       3969 s     240105 s          0 s
       
  Memory: 6.764884948730469 GB (3030.6484375 MB free)
  Uptime: 3243.0 sec
  Load Avg:  1.6474609375  1.5302734375  1.07275390625
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

