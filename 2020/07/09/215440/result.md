# Multi-thread benchmark result

* Pull request commit: [`b847e0c5a9bb8fc47bde05e58b0362f415226150`](https://github.com/JuliaFolds/Transducers.jl/commit/b847e0c5a9bb8fc47bde05e58b0362f415226150)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/346> (No need to collect string anymore)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 9 Jul 2020 - 21:49
    - Baseline: 9 Jul 2020 - 21:54
* Package commits:
    - Target: bbfdee
    - Baseline: 27d5bc
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
| `["collect", "unordered", "basesize=1024"]`         | 1.21 (5%) :x: |                1.08 (1%) :x: |
| `["words", "nthreads=1"]`                           | 1.22 (5%) :x: | 0.96 (1%) :white_check_mark: |
| `["words", "nthreads=2"]`                           | 1.17 (5%) :x: | 0.96 (1%) :white_check_mark: |
| `["words", "nthreads=4"]`                           | 1.16 (5%) :x: | 0.97 (1%) :white_check_mark: |

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
       #1  2593 MHz      48121 s          0 s       2432 s      34201 s          0 s
       #2  2593 MHz      50116 s          0 s       2407 s      33055 s          0 s
       
  Memory: 6.791385650634766 GB (2952.85546875 MB free)
  Uptime: 871.0 sec
  Load Avg:  1.7578125  1.55224609375  0.93701171875
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
       #1  2593 MHz      67890 s          0 s       2859 s      42796 s          0 s
       #2  2593 MHz      74863 s          0 s       2992 s      36516 s          0 s
       
  Memory: 6.791385650634766 GB (2941.33203125 MB free)
  Uptime: 1160.0 sec
  Load Avg:  1.79443359375  1.63525390625  1.13134765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 21:49
* Package commit: bbfdee
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
| `["collect", "assoc", "basesize=1"]`                | 314.142 ms (5%) | 9.279 ms |  87.55 MiB (1%) |     1590787 |
| `["collect", "assoc", "basesize=1024"]`             | 198.641 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 202.349 ms (5%) |          |   5.64 MiB (1%) |       54020 |
| `["collect", "seq"]`                                | 395.491 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 421.239 ms (5%) |          |  29.19 MiB (1%) |      404941 |
| `["collect", "unordered", "basesize=1024"]`         | 275.712 ms (5%) |          | 860.98 KiB (1%) |        8195 |
| `["collect", "unordered", "basesize=32"]`           | 224.296 ms (5%) |          |   1.47 MiB (1%) |       16646 |
| `["findfirst", "n=1000", "foldl"]`                  | 622.141 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 316.141 ms (5%) |          | 563.50 KiB (1%) |       10195 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 315.216 ms (5%) |          | 286.92 KiB (1%) |        5205 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 320.463 ms (5%) |          | 149.14 KiB (1%) |        2714 |
| `["findfirst", "n=400", "foldl"]`                   | 467.018 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 239.138 ms (5%) |          |   1.02 MiB (1%) |       18942 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 237.167 ms (5%) |          | 525.53 KiB (1%) |        9534 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 238.394 ms (5%) |          | 266.91 KiB (1%) |        4859 |
| `["findfirst", "n=500", "foldl"]`                   |  81.046 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.708 ms (5%) |          | 157.19 KiB (1%) |        2841 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.503 ms (5%) |          |  84.42 KiB (1%) |        1529 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.111 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 175.200 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 176.300 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 329.801 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.458 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.078 ms (5%) |          |   1.80 MiB (1%) |         496 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.766 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.816 ms (5%) |          |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.930 ms (5%) |          |   1.06 MiB (1%) |        5268 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.376 ms (5%) |          |   1.26 MiB (1%) |        2903 |
| `["parallel_histogram", "seq"]`                     |   8.111 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  15.945 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.399 ms (5%) |          | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.204 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.099 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.476 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.146 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.955 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.875 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.981 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.416 ms (5%) |          | 313.30 KiB (1%) |        6065 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.230 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.149 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  42.119 ms (5%) | 6.267 ms |  62.81 MiB (1%) |     2051981 |
| `["words", "nthreads=2"]`                           |  21.281 ms (5%) |          |  63.90 MiB (1%) |     2064176 |
| `["words", "nthreads=4"]`                           |  22.029 ms (5%) |          |  64.84 MiB (1%) |     2074671 |

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
       #1  2593 MHz      48121 s          0 s       2432 s      34201 s          0 s
       #2  2593 MHz      50116 s          0 s       2407 s      33055 s          0 s
       
  Memory: 6.791385650634766 GB (2952.85546875 MB free)
  Uptime: 871.0 sec
  Load Avg:  1.7578125  1.55224609375  0.93701171875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 9 Jul 2020 - 21:54
* Package commit: 27d5bc
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
| `["collect", "assoc", "basesize=1"]`                | 315.086 ms (5%) | 9.725 ms |  87.55 MiB (1%) |     1590754 |
| `["collect", "assoc", "basesize=1024"]`             | 198.561 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 202.333 ms (5%) |          |   5.64 MiB (1%) |       54021 |
| `["collect", "seq"]`                                | 395.213 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 421.653 ms (5%) |          |  29.19 MiB (1%) |      404978 |
| `["collect", "unordered", "basesize=1024"]`         | 228.801 ms (5%) |          | 799.95 KiB (1%) |        3953 |
| `["collect", "unordered", "basesize=32"]`           | 224.484 ms (5%) |          |   1.47 MiB (1%) |       16853 |
| `["findfirst", "n=1000", "foldl"]`                  | 626.503 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 317.531 ms (5%) |          | 563.70 KiB (1%) |       10208 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 316.789 ms (5%) |          | 286.86 KiB (1%) |        5201 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 321.695 ms (5%) |          | 149.09 KiB (1%) |        2711 |
| `["findfirst", "n=400", "foldl"]`                   | 470.371 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 239.996 ms (5%) |          |   1.02 MiB (1%) |       18953 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 238.261 ms (5%) |          | 525.83 KiB (1%) |        9553 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 239.641 ms (5%) |          | 266.92 KiB (1%) |        4860 |
| `["findfirst", "n=500", "foldl"]`                   |  81.565 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.862 ms (5%) |          | 157.30 KiB (1%) |        2848 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.642 ms (5%) |          |  84.44 KiB (1%) |        1530 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.308 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 174.400 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 176.400 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 327.601 μs (5%) |          | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.451 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.071 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.758 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.504 ms (5%) |          |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.777 ms (5%) |          |   1.07 MiB (1%) |        6215 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.025 ms (5%) |          |   1.27 MiB (1%) |        3124 |
| `["parallel_histogram", "seq"]`                     |   8.114 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.008 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.396 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.209 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.131 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.489 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.153 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.966 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.881 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.031 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.434 ms (5%) |          | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.288 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.165 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  34.484 ms (5%) | 6.225 ms |  65.46 MiB (1%) |     2075475 |
| `["words", "nthreads=2"]`                           |  18.229 ms (5%) |          |  66.55 MiB (1%) |     2087720 |
| `["words", "nthreads=4"]`                           |  18.977 ms (5%) |          |  67.18 MiB (1%) |     2093947 |

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
       #1  2593 MHz      67890 s          0 s       2859 s      42796 s          0 s
       #2  2593 MHz      74863 s          0 s       2992 s      36516 s          0 s
       
  Memory: 6.791385650634766 GB (2941.33203125 MB free)
  Uptime: 1160.0 sec
  Load Avg:  1.79443359375  1.63525390625  1.13134765625
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

