# Multi-thread benchmark result

* Pull request commit: [`4f8c2c81b5da895318f3cf170c9868bff274f38f`](https://github.com/JuliaFolds/Transducers.jl/commit/4f8c2c81b5da895318f3cf170c9868bff274f38f)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/344> (Associative string-splitting transducer)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 9 Jul 2020 - 19:42
    - Baseline: 9 Jul 2020 - 19:46
* Package commits:
    - Target: 068015
    - Baseline: 31b233
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
| `["collect", "unordered", "basesize=1"]`            | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.28 (5%) :x: | 1.14 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   1.00 (5%)  | 1.15 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.10 (5%) :x: | 1.02 (1%) :x: |
| `["words", "nthreads=4"]`                           |                   0.95 (5%)  | 1.01 (1%) :x: |

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
       #1  2593 MHz      49506 s          0 s       2360 s      33844 s          0 s
       #2  2593 MHz      49360 s          0 s       2516 s      34582 s          0 s
       
  Memory: 6.791385650634766 GB (2949.87890625 MB free)
  Uptime: 878.0 sec
  Load Avg:  1.73046875  1.54345703125  0.93310546875
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
       #1  2593 MHz      68292 s          0 s       2973 s      44351 s          0 s
       #2  2593 MHz      76272 s          0 s       3055 s      37064 s          0 s
       
  Memory: 6.791385650634766 GB (2998.65234375 MB free)
  Uptime: 1178.0 sec
  Load Avg:  1.70556640625  1.580078125  1.11572265625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 19:42
* Package commit: 068015
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
| `["collect", "assoc", "basesize=1"]`                | 316.509 ms (5%) | 9.411 ms |  87.55 MiB (1%) |     1590794 |
| `["collect", "assoc", "basesize=1024"]`             | 199.273 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 203.246 ms (5%) |          |   5.64 MiB (1%) |       54003 |
| `["collect", "seq"]`                                | 395.841 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 401.653 ms (5%) |          |  29.18 MiB (1%) |      404806 |
| `["collect", "unordered", "basesize=1024"]`         | 299.879 ms (5%) |          | 906.31 KiB (1%) |       11096 |
| `["collect", "unordered", "basesize=32"]`           | 226.568 ms (5%) |          |   1.47 MiB (1%) |       16990 |
| `["findfirst", "n=1000", "foldl"]`                  | 623.317 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 318.351 ms (5%) |          | 562.86 KiB (1%) |       10154 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 316.909 ms (5%) |          | 286.75 KiB (1%) |        5194 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 321.246 ms (5%) |          | 149.06 KiB (1%) |        2709 |
| `["findfirst", "n=400", "foldl"]`                   | 467.932 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 241.964 ms (5%) |          |   1.02 MiB (1%) |       18819 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 238.795 ms (5%) |          | 524.95 KiB (1%) |        9497 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 239.679 ms (5%) |          | 266.69 KiB (1%) |        4845 |
| `["findfirst", "n=500", "foldl"]`                   |  81.108 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.138 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.749 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.319 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 176.102 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 182.101 μs (5%) |          | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=true"]`                    | 312.403 μs (5%) |          | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.466 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.118 ms (5%) |          |   2.07 MiB (1%) |         501 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.759 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.830 ms (5%) |          |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.150 ms (5%) |          |   1.08 MiB (1%) |        4327 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.830 ms (5%) |          |   1.27 MiB (1%) |        3317 |
| `["parallel_histogram", "seq"]`                     |   8.103 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  15.867 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.398 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.227 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.105 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.446 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.164 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.005 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.905 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.014 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.474 ms (5%) |          | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.280 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.182 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  35.457 ms (5%) | 6.797 ms |  65.13 MiB (1%) |     2064944 |
| `["words", "nthreads=2"]`                           |  17.708 ms (5%) |          |  65.74 MiB (1%) |     2073129 |
| `["words", "nthreads=4"]`                           |  18.465 ms (5%) |          |  67.02 MiB (1%) |     2085604 |

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
       #1  2593 MHz      49506 s          0 s       2360 s      33844 s          0 s
       #2  2593 MHz      49360 s          0 s       2516 s      34582 s          0 s
       
  Memory: 6.791385650634766 GB (2949.87890625 MB free)
  Uptime: 878.0 sec
  Load Avg:  1.73046875  1.54345703125  0.93310546875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 19:46
* Package commit: 31b233
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
| `["collect", "assoc", "basesize=1"]`                | 317.399 ms (5%) | 9.414 ms |  87.55 MiB (1%) |     1590773 |
| `["collect", "assoc", "basesize=1024"]`             | 199.152 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 203.134 ms (5%) |          |   5.64 MiB (1%) |       54011 |
| `["collect", "seq"]`                                | 395.749 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 425.826 ms (5%) |          |  29.19 MiB (1%) |      405101 |
| `["collect", "unordered", "basesize=1024"]`         | 234.816 ms (5%) |          | 792.91 KiB (1%) |        3793 |
| `["collect", "unordered", "basesize=32"]`           | 225.377 ms (5%) |          |   1.47 MiB (1%) |       16961 |
| `["findfirst", "n=1000", "foldl"]`                  | 623.387 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 317.431 ms (5%) |          | 562.88 KiB (1%) |       10155 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 315.767 ms (5%) |          | 286.63 KiB (1%) |        5186 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 320.478 ms (5%) |          | 149.05 KiB (1%) |        2708 |
| `["findfirst", "n=400", "foldl"]`                   | 468.322 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 241.225 ms (5%) |          |   1.02 MiB (1%) |       18818 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 238.528 ms (5%) |          | 525.02 KiB (1%) |        9501 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 239.285 ms (5%) |          | 266.72 KiB (1%) |        4847 |
| `["findfirst", "n=500", "foldl"]`                   |  81.122 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.998 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.641 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.210 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 178.103 μs (5%) |          | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=false"]`                   | 178.903 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 309.605 μs (5%) |          | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.455 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.140 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.767 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.868 ms (5%) |          |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.143 ms (5%) |          |   1.06 MiB (1%) |        2809 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.824 ms (5%) |          |   1.26 MiB (1%) |        2979 |
| `["parallel_histogram", "seq"]`                     |   8.109 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.020 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.434 ms (5%) |          | 313.28 KiB (1%) |        6064 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.233 ms (5%) |          | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.154 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.500 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.159 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.978 ms (5%) |          | 155.11 KiB (1%) |        3012 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.883 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  16.040 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.462 ms (5%) |          | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.289 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.156 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  36.276 ms (5%) | 6.993 ms |  64.85 MiB (1%) |     2098700 |
| `["words", "nthreads=2"]`                           |  18.250 ms (5%) |          |  65.21 MiB (1%) |     2098776 |
| `["words", "nthreads=4"]`                           |  19.344 ms (5%) |          |  66.12 MiB (1%) |     2099073 |

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
       #1  2593 MHz      68292 s          0 s       2973 s      44351 s          0 s
       #2  2593 MHz      76272 s          0 s       3055 s      37064 s          0 s
       
  Memory: 6.791385650634766 GB (2998.65234375 MB free)
  Uptime: 1178.0 sec
  Load Avg:  1.70556640625  1.580078125  1.11572265625
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
    CPU MHz:             2593.906
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

