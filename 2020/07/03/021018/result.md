# Multi-thread benchmark result

* Pull request commit: [`71db4cfe479695da9224606aea91bbb76a690ea1`](https://github.com/JuliaFolds/Transducers.jl/commit/71db4cfe479695da9224606aea91bbb76a690ea1)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/328> (Do not "broadcast" compatible NTuple init for AbstractMultiCastingRF)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Jul 2020 - 02:04
    - Baseline: 3 Jul 2020 - 02:09
* Package commits:
    - Target: 06c4d8
    - Baseline: ecefec
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
| `["collect", "unordered", "basesize=1024"]`         | 0.75 (5%) :white_check_mark: | 0.82 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=16384"]`  |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.10 (5%) :x: | 0.99 (1%) :white_check_mark: |
| `["words", "nthreads=1"]`                           |                1.06 (5%) :x: |                   1.01 (1%)  |
| `["words", "nthreads=2"]`                           |                1.11 (5%) :x: |                   1.00 (1%)  |

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
       #1  2397 MHz      49986 s          0 s       2834 s     113716 s          0 s
       #2  2397 MHz      55876 s          0 s       3290 s     108304 s          0 s
       
  Memory: 6.764884948730469 GB (2976.5390625 MB free)
  Uptime: 1695.0 sec
  Load Avg:  1.57177734375  1.46728515625  0.90283203125
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
       #1  2397 MHz      76932 s          0 s       3456 s     116789 s          0 s
       #2  2397 MHz      75338 s          0 s       3954 s     118888 s          0 s
       
  Memory: 6.764884948730469 GB (3079.9765625 MB free)
  Uptime: 2005.0 sec
  Load Avg:  1.501953125  1.47412109375  1.06884765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 2:4
* Package commit: 06c4d8
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
| `["collect", "assoc", "basesize=1"]`                | 418.483 ms (5%) | 12.437 ms |  87.55 MiB (1%) |     1590745 |
| `["collect", "assoc", "basesize=1024"]`             | 257.470 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 267.284 ms (5%) |           |   5.64 MiB (1%) |       54008 |
| `["collect", "seq"]`                                | 519.107 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 550.739 ms (5%) |           |  29.17 MiB (1%) |      403830 |
| `["collect", "unordered", "basesize=1024"]`         | 318.475 ms (5%) |           | 818.13 KiB (1%) |        5452 |
| `["collect", "unordered", "basesize=32"]`           | 292.105 ms (5%) |           |   1.49 MiB (1%) |       18269 |
| `["findfirst", "n=1000", "foldl"]`                  | 760.814 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 385.276 ms (5%) |           | 564.11 KiB (1%) |       10234 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 389.167 ms (5%) |           | 287.25 KiB (1%) |        5226 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 387.703 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 583.025 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 285.141 ms (5%) |           |   1.02 MiB (1%) |       18960 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 283.989 ms (5%) |           | 526.20 KiB (1%) |        9577 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 289.794 ms (5%) |           | 267.20 KiB (1%) |        4878 |
| `["findfirst", "n=500", "foldl"]`                   |  94.707 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.638 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.695 ms (5%) |           |  84.44 KiB (1%) |        1530 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  51.288 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 210.002 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 209.102 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 342.504 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.284 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.066 ms (5%) |           |   1.80 MiB (1%) |         494 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.666 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.276 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.453 ms (5%) |           |   1.05 MiB (1%) |        2191 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.342 ms (5%) |           |   1.22 MiB (1%) |         172 |
| `["parallel_histogram", "seq"]`                     |   9.638 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.608 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.933 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.681 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.517 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.157 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.595 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.407 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.202 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.578 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.768 ms (5%) |           | 313.22 KiB (1%) |        6060 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.632 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.511 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  49.713 ms (5%) |  9.762 ms |  65.16 MiB (1%) |     2108792 |
| `["words", "nthreads=2"]`                           |  26.617 ms (5%) |           |  65.52 MiB (1%) |     2108868 |
| `["words", "nthreads=4"]`                           |  25.502 ms (5%) |           |  66.24 MiB (1%) |     2109021 |

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
       #1  2397 MHz      49986 s          0 s       2834 s     113716 s          0 s
       #2  2397 MHz      55876 s          0 s       3290 s     108304 s          0 s
       
  Memory: 6.764884948730469 GB (2976.5390625 MB free)
  Uptime: 1695.0 sec
  Load Avg:  1.57177734375  1.46728515625  0.90283203125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 2:9
* Package commit: ecefec
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
| `["collect", "assoc", "basesize=1"]`                | 412.823 ms (5%) | 12.049 ms |  87.55 MiB (1%) |     1590798 |
| `["collect", "assoc", "basesize=1024"]`             | 258.857 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 262.157 ms (5%) |           |   5.64 MiB (1%) |       54002 |
| `["collect", "seq"]`                                | 515.434 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 560.061 ms (5%) |           |  29.14 MiB (1%) |      401853 |
| `["collect", "unordered", "basesize=1024"]`         | 423.571 ms (5%) |           | 998.00 KiB (1%) |       16964 |
| `["collect", "unordered", "basesize=32"]`           | 296.035 ms (5%) |           |   1.50 MiB (1%) |       18449 |
| `["findfirst", "n=1000", "foldl"]`                  | 762.860 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 380.866 ms (5%) |           | 564.03 KiB (1%) |       10229 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 382.027 ms (5%) |           | 287.25 KiB (1%) |        5226 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 378.845 ms (5%) |           | 149.14 KiB (1%) |        2714 |
| `["findfirst", "n=400", "foldl"]`                   | 556.068 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 287.049 ms (5%) |           |   1.02 MiB (1%) |       18969 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 285.586 ms (5%) |           | 526.20 KiB (1%) |        9577 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 285.868 ms (5%) |           | 267.14 KiB (1%) |        4874 |
| `["findfirst", "n=500", "foldl"]`                   |  94.713 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.562 ms (5%) |           | 157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.757 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  50.979 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 209.802 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 206.903 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=true"]`                    | 351.105 μs (5%) |           | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.259 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.012 ms (5%) |           |   1.80 MiB (1%) |         494 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.624 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.634 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  17.720 ms (5%) |           |   1.06 MiB (1%) |        1633 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.088 ms (5%) |           |   1.22 MiB (1%) |         373 |
| `["parallel_histogram", "seq"]`                     |   9.638 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.401 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.716 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.503 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.373 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "uniform", "foldl"]`                       |  18.073 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.615 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.436 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.279 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.573 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.788 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.647 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.473 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  46.693 ms (5%) |  9.403 ms |  64.62 MiB (1%) |     2090693 |
| `["words", "nthreads=2"]`                           |  23.947 ms (5%) |           |  65.34 MiB (1%) |     2090847 |
| `["words", "nthreads=4"]`                           |  24.466 ms (5%) |           |  65.98 MiB (1%) |     2091138 |

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
       #1  2397 MHz      76932 s          0 s       3456 s     116789 s          0 s
       #2  2397 MHz      75338 s          0 s       3954 s     118888 s          0 s
       
  Memory: 6.764884948730469 GB (3079.9765625 MB free)
  Uptime: 2005.0 sec
  Load Avg:  1.501953125  1.47412109375  1.06884765625
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
    CPU MHz:             2397.224
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

