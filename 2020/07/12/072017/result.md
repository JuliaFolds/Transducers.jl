# Multi-thread benchmark result

* Pull request commit: [`dd298a64ba3913c559e53fd71cfa4271572b924c`](https://github.com/JuliaFolds/Transducers.jl/commit/dd298a64ba3913c559e53fd71cfa4271572b924c)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/362> (Benchmark MapCat with eduction)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jul 2020 - 07:15
    - Baseline: 12 Jul 2020 - 07:19
* Package commits:
    - Target: da44a6
    - Baseline: cbc633
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
| `["overhead", "stoppable=true"]`                    | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                   0.99 (5%)  | 0.99 (1%) :white_check_mark: |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      50545 s          0 s       2573 s      24969 s          0 s
       #2  2593 MHz      46843 s          0 s       2147 s      28919 s          0 s
       
  Memory: 6.791385650634766 GB (3000.23828125 MB free)
  Uptime: 798.0 sec
  Load Avg:  1.75634765625  1.50634765625  0.89501953125
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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      72688 s          0 s       3038 s      31042 s          0 s
       #2  2593 MHz      69118 s          0 s       2682 s      34848 s          0 s
       
  Memory: 6.791385650634766 GB (3074.00390625 MB free)
  Uptime: 1086.0 sec
  Load Avg:  1.74951171875  1.60009765625  1.09814453125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:15
* Package commit: da44a6
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

| ID                                                  | time            | GC time  | memory          | allocations |
|-----------------------------------------------------|----------------:|---------:|----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 315.298 ms (5%) | 9.532 ms |  87.55 MiB (1%) |     1590808 |
| `["collect", "assoc", "basesize=1024"]`             | 198.171 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 201.796 ms (5%) |          |   5.64 MiB (1%) |       54016 |
| `["collect", "seq"]`                                | 395.146 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 441.693 ms (5%) |          |  29.21 MiB (1%) |      406505 |
| `["collect", "unordered", "basesize=1024"]`         | 237.935 ms (5%) |          | 806.92 KiB (1%) |        4735 |
| `["collect", "unordered", "basesize=32"]`           | 223.510 ms (5%) |          |   1.47 MiB (1%) |       16629 |
| `["findfirst", "n=1000", "foldl"]`                  | 624.971 ms (5%) |          |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 317.348 ms (5%) |          | 562.88 KiB (1%) |       10155 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 316.356 ms (5%) |          | 286.69 KiB (1%) |        5190 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 321.287 ms (5%) |          | 149.08 KiB (1%) |        2710 |
| `["findfirst", "n=400", "foldl"]`                   | 469.004 ms (5%) |          |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 240.836 ms (5%) |          |   1.02 MiB (1%) |       18818 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 238.269 ms (5%) |          | 525.00 KiB (1%) |        9500 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 239.365 ms (5%) |          | 266.64 KiB (1%) |        4842 |
| `["findfirst", "n=500", "foldl"]`                   |  81.333 ms (5%) |          |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.984 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.671 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.270 ms (5%) |          |  48.16 KiB (1%) |         873 |
| `["overhead", "default"]`                           | 176.401 μs (5%) |          | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=false"]`                   | 177.501 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 308.602 μs (5%) |          | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.464 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.101 ms (5%) |          |   1.80 MiB (1%) |         496 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.788 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.689 ms (5%) |          |   1.22 MiB (1%) |         229 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.737 ms (5%) |          |   1.04 MiB (1%) |        4643 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.445 ms (5%) |          |   1.26 MiB (1%) |        2827 |
| `["parallel_histogram", "seq"]`                     |   8.082 ms (5%) |          | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.917 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.371 ms (5%) |          | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.166 ms (5%) |          | 155.13 KiB (1%) |        3013 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.082 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  15.432 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.146 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.965 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.865 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.030 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.441 ms (5%) |          | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.286 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.172 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  41.945 ms (5%) | 6.346 ms |  63.30 MiB (1%) |     2068964 |
| `["words", "nthreads=2"]`                           |  21.116 ms (5%) |          |  63.90 MiB (1%) |     2077108 |
| `["words", "nthreads=4"]`                           |  21.658 ms (5%) |          |  64.87 MiB (1%) |     2085387 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      50545 s          0 s       2573 s      24969 s          0 s
       #2  2593 MHz      46843 s          0 s       2147 s      28919 s          0 s
       
  Memory: 6.791385650634766 GB (3000.23828125 MB free)
  Uptime: 798.0 sec
  Load Avg:  1.75634765625  1.50634765625  0.89501953125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 12 Jul 2020 - 7:19
* Package commit: cbc633
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

| ID                                                  | time            | GC time  | memory          | allocations |
|-----------------------------------------------------|----------------:|---------:|----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 313.790 ms (5%) | 9.646 ms |  87.55 MiB (1%) |     1590729 |
| `["collect", "assoc", "basesize=1024"]`             | 198.435 ms (5%) |          |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 201.856 ms (5%) |          |   5.64 MiB (1%) |       54018 |
| `["collect", "seq"]`                                | 395.162 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 441.568 ms (5%) |          |  29.22 MiB (1%) |      407285 |
| `["collect", "unordered", "basesize=1024"]`         | 235.150 ms (5%) |          | 800.03 KiB (1%) |        3913 |
| `["collect", "unordered", "basesize=32"]`           | 223.537 ms (5%) |          |   1.47 MiB (1%) |       16456 |
| `["findfirst", "n=1000", "foldl"]`                  | 623.994 ms (5%) |          |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 315.969 ms (5%) |          | 562.84 KiB (1%) |       10153 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 314.620 ms (5%) |          | 286.64 KiB (1%) |        5187 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 319.489 ms (5%) |          | 149.13 KiB (1%) |        2713 |
| `["findfirst", "n=400", "foldl"]`                   | 468.314 ms (5%) |          |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 239.527 ms (5%) |          |   1.02 MiB (1%) |       18823 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 237.247 ms (5%) |          | 525.00 KiB (1%) |        9500 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 238.131 ms (5%) |          | 266.69 KiB (1%) |        4845 |
| `["findfirst", "n=500", "foldl"]`                   |  81.143 ms (5%) |          |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.774 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.468 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.036 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 174.202 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 173.402 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 330.804 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.468 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.094 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.784 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.012 ms (5%) |          |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.805 ms (5%) |          |   1.04 MiB (1%) |        4664 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.566 ms (5%) |          |   1.28 MiB (1%) |        3905 |
| `["parallel_histogram", "seq"]`                     |   8.115 ms (5%) |          | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.863 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.333 ms (5%) |          | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.132 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.047 ms (5%) |          |  76.23 KiB (1%) |        1483 |
| `["sum", "uniform", "foldl"]`                       |  15.462 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.140 ms (5%) |          | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.939 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.857 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.003 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.400 ms (5%) |          | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.227 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.133 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  40.151 ms (5%) | 6.063 ms |  63.09 MiB (1%) |     2061641 |
| `["words", "nthreads=2"]`                           |  20.945 ms (5%) |          |  64.18 MiB (1%) |     2073940 |
| `["words", "nthreads=4"]`                           |  21.120 ms (5%) |          |  64.82 MiB (1%) |     2080192 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      72688 s          0 s       3038 s      31042 s          0 s
       #2  2593 MHz      69118 s          0 s       2682 s      34848 s          0 s
       
  Memory: 6.791385650634766 GB (3074.00390625 MB free)
  Uptime: 1086.0 sec
  Load Avg:  1.74951171875  1.60009765625  1.09814453125
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
    Model name:          Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz
    Stepping:            7
    CPU MHz:             2593.905
    BogoMIPS:            5187.81
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
| Brand              | Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz          |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x07, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

