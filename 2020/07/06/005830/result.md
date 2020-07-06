# Multi-thread benchmark result

* Pull request commit: [`74f9cb019077ccfd96c6a585c01cb0892307af5c`](https://github.com/JuliaFolds/Transducers.jl/commit/74f9cb019077ccfd96c6a585c01cb0892307af5c)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/341> (Refactoring initializer API; define Init in Transducers.jl)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 6 Jul 2020 - 00:52
    - Baseline: 6 Jul 2020 - 00:58
* Package commits:
    - Target: aaaa53
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
| `["collect", "unordered", "basesize=1024"]`         |                   0.99 (5%)  |                1.02 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.78 (5%) :white_check_mark: | 0.98 (1%) :white_check_mark: |

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
       #1  2397 MHz      51063 s          0 s       2320 s      19447 s          0 s
       #2  2397 MHz      52413 s          0 s       2616 s      17963 s          0 s
       
  Memory: 6.764884948730469 GB (3046.62109375 MB free)
  Uptime: 748.0 sec
  Load Avg:  1.7060546875  1.544921875  0.94384765625
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
       #1  2397 MHz      74036 s          0 s       2896 s      26519 s          0 s
       #2  2397 MHz      75908 s          0 s       3252 s      24539 s          0 s
       
  Memory: 6.764884948730469 GB (3048.328125 MB free)
  Uptime: 1057.0 sec
  Load Avg:  1.75341796875  1.65478515625  1.16845703125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 6 Jul 2020 - 0:52
* Package commit: aaaa53
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
| `["collect", "assoc", "basesize=1"]`                | 405.057 ms (5%) | 10.494 ms |   87.55 MiB (1%) |     1590768 |
| `["collect", "assoc", "basesize=1024"]`             | 255.884 ms (5%) |           |    1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 259.416 ms (5%) |           |    5.64 MiB (1%) |       54005 |
| `["collect", "seq"]`                                | 504.028 ms (5%) |           |    1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 498.878 ms (5%) |           |   29.14 MiB (1%) |      402109 |
| `["collect", "unordered", "basesize=1024"]`         | 401.741 ms (5%) |           |  963.45 KiB (1%) |       14753 |
| `["collect", "unordered", "basesize=32"]`           | 285.627 ms (5%) |           |    1.49 MiB (1%) |       18153 |
| `["findfirst", "n=1000", "foldl"]`                  | 735.198 ms (5%) |           |                  |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 370.785 ms (5%) |           |  564.09 KiB (1%) |       10233 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 372.109 ms (5%) |           |  287.27 KiB (1%) |        5227 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 371.041 ms (5%) |           |  149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 548.044 ms (5%) |           |                  |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 278.150 ms (5%) |           |    1.02 MiB (1%) |       18982 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 276.224 ms (5%) |           |  526.27 KiB (1%) |        9581 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 275.913 ms (5%) |           |  267.25 KiB (1%) |        4881 |
| `["findfirst", "n=500", "foldl"]`                   |  93.262 ms (5%) |           |                  |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  47.849 ms (5%) |           |  157.36 KiB (1%) |        2852 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.602 ms (5%) |           |   84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  49.724 ms (5%) |           |   48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 205.705 μs (5%) |           |  146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 206.106 μs (5%) |           |  146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=true"]`                    | 368.209 μs (5%) |           |  146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.255 ms (5%) |           |  732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.016 ms (5%) |           |    1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.639 ms (5%) |           |    1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.829 ms (5%) |           |    1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  16.709 ms (5%) |           | 1018.52 KiB (1%) |        1505 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.952 ms (5%) |           |    1.22 MiB (1%) |         172 |
| `["parallel_histogram", "seq"]`                     |   9.633 ms (5%) |           |  364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.558 ms (5%) |           |                  |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.681 ms (5%) |           |  313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.513 ms (5%) |           |  155.13 KiB (1%) |        3013 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.370 ms (5%) |           |   76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  18.057 ms (5%) |           |                  |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.516 ms (5%) |           |  313.30 KiB (1%) |        6065 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.328 ms (5%) |           |  155.11 KiB (1%) |        3012 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.176 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.660 ms (5%) |           |                  |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.735 ms (5%) |           |  313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.578 ms (5%) |           |  155.05 KiB (1%) |        3008 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.450 ms (5%) |           |   76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  43.289 ms (5%) |  8.276 ms |   64.86 MiB (1%) |     2099585 |
| `["words", "nthreads=2"]`                           |  22.849 ms (5%) |           |   65.58 MiB (1%) |     2099739 |
| `["words", "nthreads=4"]`                           |  23.490 ms (5%) |           |   66.03 MiB (1%) |     2099887 |

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
       #1  2397 MHz      51063 s          0 s       2320 s      19447 s          0 s
       #2  2397 MHz      52413 s          0 s       2616 s      17963 s          0 s
       
  Memory: 6.764884948730469 GB (3046.62109375 MB free)
  Uptime: 748.0 sec
  Load Avg:  1.7060546875  1.544921875  0.94384765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 6 Jul 2020 - 0:58
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
| `["collect", "assoc", "basesize=1"]`                | 410.524 ms (5%) | 15.547 ms |  87.55 MiB (1%) |     1590763 |
| `["collect", "assoc", "basesize=1024"]`             | 265.181 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 257.392 ms (5%) |           |   5.64 MiB (1%) |       54011 |
| `["collect", "seq"]`                                | 504.638 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 496.728 ms (5%) |           |  29.15 MiB (1%) |      402498 |
| `["collect", "unordered", "basesize=1024"]`         | 407.522 ms (5%) |           | 945.59 KiB (1%) |       13610 |
| `["collect", "unordered", "basesize=32"]`           | 287.236 ms (5%) |           |   1.50 MiB (1%) |       18789 |
| `["findfirst", "n=1000", "foldl"]`                  | 733.656 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 378.412 ms (5%) |           | 564.19 KiB (1%) |       10239 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 370.742 ms (5%) |           | 287.20 KiB (1%) |        5223 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 378.608 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 553.475 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 277.451 ms (5%) |           |   1.02 MiB (1%) |       18975 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 279.034 ms (5%) |           | 526.19 KiB (1%) |        9576 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 277.024 ms (5%) |           | 267.20 KiB (1%) |        4878 |
| `["findfirst", "n=500", "foldl"]`                   |  93.790 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  47.984 ms (5%) |           | 157.36 KiB (1%) |        2852 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.801 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  50.734 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 204.710 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 206.611 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 368.317 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.262 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.024 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.632 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.904 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.508 ms (5%) |           |   1.02 MiB (1%) |        3151 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.574 ms (5%) |           |   1.23 MiB (1%) |         469 |
| `["parallel_histogram", "seq"]`                     |   9.639 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.515 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.727 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.540 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.405 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.059 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.504 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.321 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.171 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  18.560 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.756 ms (5%) |           | 313.22 KiB (1%) |        6060 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.574 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.439 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  43.592 ms (5%) |  8.543 ms |  65.20 MiB (1%) |     2109261 |
| `["words", "nthreads=2"]`                           |  22.485 ms (5%) |           |  65.92 MiB (1%) |     2109415 |
| `["words", "nthreads=4"]`                           |  24.008 ms (5%) |           |  66.56 MiB (1%) |     2109705 |

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
       #1  2397 MHz      74036 s          0 s       2896 s      26519 s          0 s
       #2  2397 MHz      75908 s          0 s       3252 s      24539 s          0 s
       
  Memory: 6.764884948730469 GB (3048.328125 MB free)
  Uptime: 1057.0 sec
  Load Avg:  1.75341796875  1.65478515625  1.16845703125
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
    CPU MHz:             2397.222
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

