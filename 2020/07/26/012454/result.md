# Multi-thread benchmark result

* Pull request commit: [`df6eb2e95f5f243f8704eaa3760527cb9fcf934b`](https://github.com/JuliaFolds/Transducers.jl/commit/df6eb2e95f5f243f8704eaa3760527cb9fcf934b)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/373> (Skip allocation test in Julia 1.6)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 26 Jul 2020 - 01:19
    - Baseline: 26 Jul 2020 - 01:24
* Package commits:
    - Target: 82b7cb
    - Baseline: b79014
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

| ID                                                  | time ratio    | memory ratio  |
|-----------------------------------------------------|---------------|---------------|
| `["collect", "unordered", "basesize=1024"]`         | 1.10 (5%) :x: | 1.05 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |    1.01 (5%)  | 1.15 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 1.05 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=8192"]`   |    0.97 (5%)  | 1.01 (1%) :x: |
| `["words", "nthreads=2"]`                           | 1.10 (5%) :x: |    1.01 (1%)  |
| `["words", "nthreads=4"]`                           | 1.06 (5%) :x: |    1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      49265 s          0 s       2311 s      25374 s          0 s
       #2  2593 MHz      49040 s          0 s       2493 s      25703 s          0 s
       
  Memory: 6.791385650634766 GB (3151.375 MB free)
  Uptime: 789.0 sec
  Load Avg:  1.57373046875  1.48828125  0.91650390625
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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      72304 s          0 s       2780 s      30918 s          0 s
       #2  2593 MHz      70811 s          0 s       3028 s      32359 s          0 s
       
  Memory: 6.791385650634766 GB (3149.21875 MB free)
  Uptime: 1080.0 sec
  Load Avg:  1.73974609375  1.57275390625  1.103515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 1:19
* Package commit: 82b7cb
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
| `["collect", "assoc", "basesize=1"]`                | 319.299 ms (5%) | 12.355 ms |  87.55 MiB (1%) |     1590802 |
| `["collect", "assoc", "basesize=1024"]`             | 198.291 ms (5%) |           |   1.84 MiB (1%) |        1807 |
| `["collect", "assoc", "basesize=32"]`               | 201.957 ms (5%) |           |   5.64 MiB (1%) |       54022 |
| `["collect", "seq"]`                                | 395.144 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 421.331 ms (5%) |           |  29.19 MiB (1%) |      405332 |
| `["collect", "unordered", "basesize=1024"]`         | 241.742 ms (5%) |           | 813.77 KiB (1%) |        5173 |
| `["collect", "unordered", "basesize=32"]`           | 223.148 ms (5%) |           |   1.47 MiB (1%) |       16415 |
| `["findfirst", "n=1000", "foldl"]`                  | 625.787 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 317.435 ms (5%) |           | 563.45 KiB (1%) |       10192 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 316.311 ms (5%) |           | 287.03 KiB (1%) |        5212 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 321.465 ms (5%) |           | 149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 469.929 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 238.772 ms (5%) |           |   1.02 MiB (1%) |       18951 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 237.445 ms (5%) |           | 526.00 KiB (1%) |        9564 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 239.042 ms (5%) |           | 267.23 KiB (1%) |        4880 |
| `["findfirst", "n=500", "foldl"]`                   |  81.651 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.919 ms (5%) |           | 157.22 KiB (1%) |        2843 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.658 ms (5%) |           |  84.42 KiB (1%) |        1529 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.298 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 179.402 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 180.902 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 309.103 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.452 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.120 ms (5%) |           |   2.07 MiB (1%) |         502 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.769 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.478 ms (5%) |           |   1.22 MiB (1%) |         263 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.178 ms (5%) |           |   1.07 MiB (1%) |        3655 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.807 ms (5%) |           |   1.27 MiB (1%) |        3394 |
| `["parallel_histogram", "seq"]`                     |   8.091 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  16.295 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.454 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.266 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.189 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  15.491 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.158 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.966 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.877 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.174 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.443 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.271 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.164 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  43.788 ms (5%) |  7.297 ms |  63.37 MiB (1%) |     2070217 |
| `["words", "nthreads=2"]`                           |  23.386 ms (5%) |           |  64.45 MiB (1%) |     2082499 |
| `["words", "nthreads=4"]`                           |  23.248 ms (5%) |           |  65.40 MiB (1%) |     2092946 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      49265 s          0 s       2311 s      25374 s          0 s
       #2  2593 MHz      49040 s          0 s       2493 s      25703 s          0 s
       
  Memory: 6.791385650634766 GB (3151.375 MB free)
  Uptime: 789.0 sec
  Load Avg:  1.57373046875  1.48828125  0.91650390625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 1:24
* Package commit: b79014
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
| `["collect", "assoc", "basesize=1"]`                | 318.226 ms (5%) | 10.818 ms |  87.55 MiB (1%) |     1590827 |
| `["collect", "assoc", "basesize=1024"]`             | 198.411 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 201.768 ms (5%) |           |   5.64 MiB (1%) |       54014 |
| `["collect", "seq"]`                                | 395.125 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 413.130 ms (5%) |           |  29.18 MiB (1%) |      404430 |
| `["collect", "unordered", "basesize=1024"]`         | 220.548 ms (5%) |           | 771.53 KiB (1%) |        2089 |
| `["collect", "unordered", "basesize=32"]`           | 223.576 ms (5%) |           |   1.47 MiB (1%) |       16679 |
| `["findfirst", "n=1000", "foldl"]`                  | 622.698 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 315.361 ms (5%) |           | 563.48 KiB (1%) |       10194 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 314.675 ms (5%) |           | 286.89 KiB (1%) |        5203 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 319.415 ms (5%) |           | 149.11 KiB (1%) |        2712 |
| `["findfirst", "n=400", "foldl"]`                   | 467.432 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 238.192 ms (5%) |           |   1.02 MiB (1%) |       18950 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 236.337 ms (5%) |           | 525.94 KiB (1%) |        9560 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 237.972 ms (5%) |           | 266.92 KiB (1%) |        4860 |
| `["findfirst", "n=500", "foldl"]`                   |  81.001 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.618 ms (5%) |           | 157.27 KiB (1%) |        2846 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.371 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.004 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 178.104 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 179.704 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 303.206 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.444 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.065 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.752 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.460 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.169 ms (5%) |           |   1.07 MiB (1%) |        3492 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.389 ms (5%) |           |   1.25 MiB (1%) |        2300 |
| `["parallel_histogram", "seq"]`                     |   8.093 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.948 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.378 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.187 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.108 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.426 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.143 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.951 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.859 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.019 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.399 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.245 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.135 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  42.548 ms (5%) |  7.049 ms |  63.24 MiB (1%) |     2065932 |
| `["words", "nthreads=2"]`                           |  21.234 ms (5%) |           |  63.84 MiB (1%) |     2074039 |
| `["words", "nthreads=4"]`                           |  21.999 ms (5%) |           |  65.12 MiB (1%) |     2086584 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      72304 s          0 s       2780 s      30918 s          0 s
       #2  2593 MHz      70811 s          0 s       3028 s      32359 s          0 s
       
  Memory: 6.791385650634766 GB (3149.21875 MB free)
  Uptime: 1080.0 sec
  Load Avg:  1.73974609375  1.57275390625  1.103515625
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

