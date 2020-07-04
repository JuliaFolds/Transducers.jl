# Multi-thread benchmark result

* Pull request commit: [`60dd6209d066e21d6c210e5f85f653680df5f986`](https://github.com/JuliaFolds/Transducers.jl/commit/60dd6209d066e21d6c210e5f85f653680df5f986)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Jul 2020 - 00:05
    - Baseline: 4 Jul 2020 - 00:10
* Package commits:
    - Target: c9414b
    - Baseline: db547f
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
| `["collect", "unordered", "basesize=1024"]`         |    1.05 (5%)  |                1.04 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 1.08 (5%) :x: | 0.98 (1%) :white_check_mark: |
| `["words", "nthreads=1"]`                           |    1.00 (5%)  |                1.01 (1%) :x: |
| `["words", "nthreads=2"]`                           |    1.03 (5%)  |                1.02 (1%) :x: |
| `["words", "nthreads=4"]`                           | 1.06 (5%) :x: |                1.02 (1%) :x: |

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
       #1  2593 MHz      46907 s          0 s       2348 s      42356 s          0 s
       #2  2593 MHz      47931 s          0 s       2384 s      40727 s          0 s
       
  Memory: 6.791385650634766 GB (3121.49609375 MB free)
  Uptime: 931.0 sec
  Load Avg:  1.72412109375  1.53759765625  0.91259765625
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
       #1  2593 MHz      68576 s          0 s       2992 s      49971 s          0 s
       #2  2593 MHz      71711 s          0 s       3108 s      46182 s          0 s
       
  Memory: 6.791385650634766 GB (3185.5 MB free)
  Uptime: 1232.0 sec
  Load Avg:  1.6962890625  1.59521484375  1.107421875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 0:5
* Package commit: c9414b
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
| `["collect", "assoc", "basesize=1"]`                | 313.581 ms (5%) | 9.633 ms |  87.55 MiB (1%) |     1590733 |
| `["collect", "assoc", "basesize=1024"]`             | 198.261 ms (5%) |          |   1.84 MiB (1%) |        1807 |
| `["collect", "assoc", "basesize=32"]`               | 201.823 ms (5%) |          |   5.64 MiB (1%) |       54007 |
| `["collect", "seq"]`                                | 395.139 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 437.262 ms (5%) |          |  29.19 MiB (1%) |      405135 |
| `["collect", "unordered", "basesize=1024"]`         | 246.187 ms (5%) |          | 826.44 KiB (1%) |        5984 |
| `["collect", "unordered", "basesize=32"]`           | 223.239 ms (5%) |          |   1.48 MiB (1%) |       17167 |
| `["findfirst", "n=1000", "foldl"]`                  | 622.398 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 316.649 ms (5%) |          | 563.05 KiB (1%) |       10166 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 315.269 ms (5%) |          | 286.80 KiB (1%) |        5197 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 320.133 ms (5%) |          | 149.11 KiB (1%) |        2712 |
| `["findfirst", "n=400", "foldl"]`                   | 467.462 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 240.272 ms (5%) |          |   1.02 MiB (1%) |       18828 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 237.789 ms (5%) |          | 525.06 KiB (1%) |        9504 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 238.786 ms (5%) |          | 266.70 KiB (1%) |        4846 |
| `["findfirst", "n=500", "foldl"]`                   |  81.061 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.904 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.546 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  43.033 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 173.301 μs (5%) |          | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=false"]`                   | 172.101 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 303.903 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.433 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.041 ms (5%) |          |   1.80 MiB (1%) |         496 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.738 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.534 ms (5%) |          |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.666 ms (5%) |          |   1.07 MiB (1%) |        5938 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.848 ms (5%) |          |   1.26 MiB (1%) |        2844 |
| `["parallel_histogram", "seq"]`                     |   8.085 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.054 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.380 ms (5%) |          | 313.38 KiB (1%) |        6070 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.194 ms (5%) |          | 155.14 KiB (1%) |        3014 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.096 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  15.409 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.134 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.938 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.865 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.036 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.413 ms (5%) |          | 313.22 KiB (1%) |        6060 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.257 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.139 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  33.552 ms (5%) | 5.785 ms |  64.92 MiB (1%) |     2100973 |
| `["words", "nthreads=2"]`                           |  18.678 ms (5%) |          |  65.64 MiB (1%) |     2101126 |
| `["words", "nthreads=4"]`                           |  20.054 ms (5%) |          |  66.28 MiB (1%) |     2101417 |

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
       #1  2593 MHz      46907 s          0 s       2348 s      42356 s          0 s
       #2  2593 MHz      47931 s          0 s       2384 s      40727 s          0 s
       
  Memory: 6.791385650634766 GB (3121.49609375 MB free)
  Uptime: 931.0 sec
  Load Avg:  1.72412109375  1.53759765625  0.91259765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 0:10
* Package commit: db547f
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
| `["collect", "assoc", "basesize=1"]`                | 313.980 ms (5%) | 10.172 ms |  87.55 MiB (1%) |     1590787 |
| `["collect", "assoc", "basesize=1024"]`             | 198.439 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 201.700 ms (5%) |           |   5.64 MiB (1%) |       53998 |
| `["collect", "seq"]`                                | 395.270 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 429.432 ms (5%) |           |  29.21 MiB (1%) |      406579 |
| `["collect", "unordered", "basesize=1024"]`         | 234.969 ms (5%) |           | 796.94 KiB (1%) |        4051 |
| `["collect", "unordered", "basesize=32"]`           | 223.872 ms (5%) |           |   1.47 MiB (1%) |       16842 |
| `["findfirst", "n=1000", "foldl"]`                  | 628.842 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 318.622 ms (5%) |           | 562.95 KiB (1%) |       10160 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 317.335 ms (5%) |           | 286.83 KiB (1%) |        5199 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 320.371 ms (5%) |           | 149.05 KiB (1%) |        2708 |
| `["findfirst", "n=400", "foldl"]`                   | 472.142 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 241.848 ms (5%) |           |   1.02 MiB (1%) |       18822 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 239.204 ms (5%) |           | 525.13 KiB (1%) |        9508 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 240.152 ms (5%) |           | 266.77 KiB (1%) |        4850 |
| `["findfirst", "n=500", "foldl"]`                   |  81.822 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.162 ms (5%) |           | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.791 ms (5%) |           |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  43.977 ms (5%) |           |  48.16 KiB (1%) |         873 |
| `["overhead", "default"]`                           | 176.503 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 176.303 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 313.205 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.459 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.069 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.765 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.534 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.906 ms (5%) |           |   1.08 MiB (1%) |        4953 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.557 ms (5%) |           |   1.26 MiB (1%) |        2449 |
| `["parallel_histogram", "seq"]`                     |   8.151 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.100 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.411 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.217 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.123 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.502 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.147 ms (5%) |           | 313.39 KiB (1%) |        6071 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.958 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.861 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.097 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.420 ms (5%) |           | 313.23 KiB (1%) |        6061 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.265 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.158 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  33.636 ms (5%) |  6.061 ms |  64.14 MiB (1%) |     2076246 |
| `["words", "nthreads=2"]`                           |  18.082 ms (5%) |           |  64.50 MiB (1%) |     2076323 |
| `["words", "nthreads=4"]`                           |  18.851 ms (5%) |           |  65.22 MiB (1%) |     2076479 |

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
       #1  2593 MHz      68576 s          0 s       2992 s      49971 s          0 s
       #2  2593 MHz      71711 s          0 s       3108 s      46182 s          0 s
       
  Memory: 6.791385650634766 GB (3185.5 MB free)
  Uptime: 1232.0 sec
  Load Avg:  1.6962890625  1.59521484375  1.107421875
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
    CPU MHz:             2593.908
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

