# Multi-thread benchmark result

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 30 Jun 2020 - 07:43
    - Baseline: 30 Jun 2020 - 07:48
* Package commits:
    - Target: e896da
    - Baseline: 8ccb58
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

| ID                                                  | time ratio    | memory ratio                 |
|-----------------------------------------------------|---------------|------------------------------|
| `["collect", "unordered", "basesize=1"]`            | 1.05 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |    0.96 (5%)  | 0.96 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 1.28 (5%) :x: |                1.08 (1%) :x: |

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
       #1  2397 MHz      47755 s          0 s       2400 s      30179 s          0 s
       #2  2397 MHz      54884 s          0 s       2489 s      23747 s          0 s
       
  Memory: 6.764884948730469 GB (3143.03515625 MB free)
  Uptime: 828.0 sec
  Load Avg:  1.771484375  1.55859375  0.92919921875
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
       #1  2397 MHz      67913 s          0 s       3010 s      38619 s          0 s
       #2  2397 MHz      79835 s          0 s       2954 s      27513 s          0 s
       
  Memory: 6.764884948730469 GB (3139.59375 MB free)
  Uptime: 1122.0 sec
  Load Avg:  1.74658203125  1.626953125  1.12890625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 7:43
* Package commit: e896da
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
| `["collect", "assoc", "basesize=1"]`                | 403.308 ms (5%) | 11.981 ms |  87.55 MiB (1%) |     1590793 |
| `["collect", "assoc", "basesize=1024"]`             | 252.492 ms (5%) |           |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 258.451 ms (5%) |           |   5.64 MiB (1%) |       54008 |
| `["collect", "seq"]`                                | 502.526 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 530.845 ms (5%) | 16.413 ms |  29.18 MiB (1%) |      404515 |
| `["collect", "unordered", "basesize=1024"]`         | 292.045 ms (5%) |           | 801.69 KiB (1%) |        4400 |
| `["collect", "unordered", "basesize=32"]`           | 282.995 ms (5%) |           |   1.49 MiB (1%) |       17816 |
| `["findfirst", "n=1000", "foldl"]`                  | 732.492 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 369.172 ms (5%) |           | 564.06 KiB (1%) |       10231 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 369.206 ms (5%) |           | 287.16 KiB (1%) |        5220 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 375.363 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 548.158 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 278.879 ms (5%) |           |   1.02 MiB (1%) |       18970 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 277.344 ms (5%) |           | 526.11 KiB (1%) |        9571 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 277.711 ms (5%) |           | 267.20 KiB (1%) |        4878 |
| `["findfirst", "n=500", "foldl"]`                   |  93.975 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  47.918 ms (5%) |           | 157.33 KiB (1%) |        2850 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.862 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  50.659 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 202.405 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 201.905 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 349.709 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.286 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.006 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.623 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.508 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.680 ms (5%) |           |   1.06 MiB (1%) |         862 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.223 ms (5%) |           |   1.22 MiB (1%) |         415 |
| `["parallel_histogram", "seq"]`                     |   9.618 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.508 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.746 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.522 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.406 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.073 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.522 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.317 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.170 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.604 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.737 ms (5%) |           | 313.23 KiB (1%) |        6061 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.567 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.418 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  43.933 ms (5%) |  8.476 ms |  64.39 MiB (1%) |     2084382 |
| `["words", "nthreads=2"]`                           |  22.119 ms (5%) |           |  64.75 MiB (1%) |     2084459 |
| `["words", "nthreads=4"]`                           |  22.677 ms (5%) |           |  65.47 MiB (1%) |     2084614 |

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
       #1  2397 MHz      47755 s          0 s       2400 s      30179 s          0 s
       #2  2397 MHz      54884 s          0 s       2489 s      23747 s          0 s
       
  Memory: 6.764884948730469 GB (3143.03515625 MB free)
  Uptime: 828.0 sec
  Load Avg:  1.771484375  1.55859375  0.92919921875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 7:48
* Package commit: 8ccb58
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
| `["collect", "assoc", "basesize=1"]`                | 404.230 ms (5%) | 13.240 ms |   87.55 MiB (1%) |     1590728 |
| `["collect", "assoc", "basesize=1024"]`             | 253.686 ms (5%) |           |    1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 257.219 ms (5%) |           |    5.64 MiB (1%) |       54016 |
| `["collect", "seq"]`                                | 505.060 ms (5%) |           |    1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 505.258 ms (5%) | 17.835 ms |   29.17 MiB (1%) |      403851 |
| `["collect", "unordered", "basesize=1024"]`         | 305.796 ms (5%) |           |  838.23 KiB (1%) |        6694 |
| `["collect", "unordered", "basesize=32"]`           | 282.824 ms (5%) |           |    1.50 MiB (1%) |       18603 |
| `["findfirst", "n=1000", "foldl"]`                  | 731.077 ms (5%) |           |                  |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 369.191 ms (5%) |           |  564.05 KiB (1%) |       10230 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 369.547 ms (5%) |           |  287.31 KiB (1%) |        5230 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 375.611 ms (5%) |           |  149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 548.990 ms (5%) |           |                  |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 278.189 ms (5%) |           |    1.02 MiB (1%) |       18970 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 278.090 ms (5%) |           |  526.20 KiB (1%) |        9577 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 280.194 ms (5%) |           |  267.20 KiB (1%) |        4878 |
| `["findfirst", "n=500", "foldl"]`                   |  93.768 ms (5%) |           |                  |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  47.767 ms (5%) |           |  157.33 KiB (1%) |        2850 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.443 ms (5%) |           |   84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  50.737 ms (5%) |           |   48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 209.409 μs (5%) |           |  146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=false"]`                   | 210.409 μs (5%) |           |  146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 348.415 μs (5%) |           |  146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.265 ms (5%) |           |  732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.039 ms (5%) |           |    1.80 MiB (1%) |         494 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.655 ms (5%) |           |    1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.868 ms (5%) |           |    1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  15.364 ms (5%) |           | 1002.44 KiB (1%) |         521 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  15.492 ms (5%) |           |    1.23 MiB (1%) |         831 |
| `["parallel_histogram", "seq"]`                     |   9.648 ms (5%) |           |  364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.592 ms (5%) |           |                  |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.805 ms (5%) |           |  313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.589 ms (5%) |           |  155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.472 ms (5%) |           |   76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  18.080 ms (5%) |           |                  |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.535 ms (5%) |           |  313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.330 ms (5%) |           |  155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.178 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.557 ms (5%) |           |                  |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.779 ms (5%) |           |  313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.573 ms (5%) |           |  155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.450 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  43.658 ms (5%) |  8.159 ms |   64.42 MiB (1%) |     2084173 |
| `["words", "nthreads=2"]`                           |  22.186 ms (5%) |           |   65.14 MiB (1%) |     2084327 |
| `["words", "nthreads=4"]`                           |  23.408 ms (5%) |           |   65.59 MiB (1%) |     2084474 |

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
       #1  2397 MHz      67913 s          0 s       3010 s      38619 s          0 s
       #2  2397 MHz      79835 s          0 s       2954 s      27513 s          0 s
       
  Memory: 6.764884948730469 GB (3139.59375 MB free)
  Uptime: 1122.0 sec
  Load Avg:  1.74658203125  1.626953125  1.12890625
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
    CPU MHz:             2397.220
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

