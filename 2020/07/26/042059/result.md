# Multi-thread benchmark result

* Pull request commit: [`307e7a09f9b81a16bf6161c81b93d427f2051a98`](https://github.com/JuliaFolds/Transducers.jl/commit/307e7a09f9b81a16bf6161c81b93d427f2051a98)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/373> (Skip allocation test in Julia 1.6)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 26 Jul 2020 - 04:15
    - Baseline: 26 Jul 2020 - 04:20
* Package commits:
    - Target: ce1e34
    - Baseline: ee0e40
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
| `["collect", "unordered", "basesize=1024"]`         | 1.34 (5%) :x: |                1.19 (1%) :x: |
| `["findfirst", "n=500", "foldl"]`                   | 1.05 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 1.12 (5%) :x: | 0.92 (1%) :white_check_mark: |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      52273 s          0 s       2120 s      14790 s          0 s
       #2  2095 MHz      47546 s          0 s       2429 s      19712 s          0 s
       
  Memory: 6.764884948730469 GB (2946.08203125 MB free)
  Uptime: 716.0 sec
  Load Avg:  1.63427734375  1.51953125  0.916015625
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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      78620 s          0 s       2550 s      17490 s          0 s
       #2  2095 MHz      66588 s          0 s       2893 s      29684 s          0 s
       
  Memory: 6.764884948730469 GB (2956.9609375 MB free)
  Uptime: 1013.0 sec
  Load Avg:  1.66845703125  1.57568359375  1.1025390625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 4:15
* Package commit: ce1e34
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
| `["collect", "assoc", "basesize=1"]`                | 342.890 ms (5%) | 10.435 ms |   87.55 MiB (1%) |     1590801 |
| `["collect", "assoc", "basesize=1024"]`             | 214.624 ms (5%) |           |    1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 220.034 ms (5%) |           |    5.64 MiB (1%) |       54010 |
| `["collect", "seq"]`                                | 421.308 ms (5%) |           |    1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 453.122 ms (5%) |           |   29.16 MiB (1%) |      403531 |
| `["collect", "unordered", "basesize=1024"]`         | 333.918 ms (5%) |           |  911.48 KiB (1%) |       11427 |
| `["collect", "unordered", "basesize=32"]`           | 247.623 ms (5%) |           |    1.47 MiB (1%) |       16610 |
| `["findfirst", "n=1000", "foldl"]`                  | 661.383 ms (5%) |           |                  |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 346.503 ms (5%) |           |  563.30 KiB (1%) |       10182 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 351.150 ms (5%) |           |  287.23 KiB (1%) |        5225 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 360.730 ms (5%) |           |  149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 502.007 ms (5%) |           |                  |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 263.912 ms (5%) |           |    1.02 MiB (1%) |       18866 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 262.862 ms (5%) |           |  525.39 KiB (1%) |        9525 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 264.957 ms (5%) |           |  267.14 KiB (1%) |        4874 |
| `["findfirst", "n=500", "foldl"]`                   |  84.571 ms (5%) |           |                  |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  45.096 ms (5%) |           |  157.19 KiB (1%) |        2841 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  45.038 ms (5%) |           |   84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  47.631 ms (5%) |           |   48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 174.010 μs (5%) |           |  146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 176.110 μs (5%) |           |  146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 314.216 μs (5%) |           |  146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.317 ms (5%) |           |  732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.930 ms (5%) |           |    1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.632 ms (5%) |           |    1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.200 ms (5%) |           |    1.22 MiB (1%) |         384 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  25.262 ms (5%) |           | 1002.06 KiB (1%) |         497 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.758 ms (5%) |           |    1.26 MiB (1%) |        2730 |
| `["parallel_histogram", "seq"]`                     |   7.184 ms (5%) |           |  364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.255 ms (5%) |           |    64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.605 ms (5%) |           |  313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.234 ms (5%) |           |  155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.257 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  14.632 ms (5%) |           |    64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.069 ms (5%) |           |  313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.042 ms (5%) |           |  155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.840 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.429 ms (5%) |           |    64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.425 ms (5%) |           |  313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.363 ms (5%) |           |  155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.052 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  42.026 ms (5%) |  6.808 ms |   62.83 MiB (1%) |     2052574 |
| `["words", "nthreads=2"]`                           |  22.487 ms (5%) |           |   63.44 MiB (1%) |     2060712 |
| `["words", "nthreads=4"]`                           |  22.705 ms (5%) |           |   64.40 MiB (1%) |     2068962 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      52273 s          0 s       2120 s      14790 s          0 s
       #2  2095 MHz      47546 s          0 s       2429 s      19712 s          0 s
       
  Memory: 6.764884948730469 GB (2946.08203125 MB free)
  Uptime: 716.0 sec
  Load Avg:  1.63427734375  1.51953125  0.916015625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 4:20
* Package commit: ee0e40
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
| `["collect", "assoc", "basesize=1"]`                | 340.651 ms (5%) | 11.074 ms |  87.55 MiB (1%) |     1590773 |
| `["collect", "assoc", "basesize=1024"]`             | 215.893 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 220.270 ms (5%) |           |   5.64 MiB (1%) |       54007 |
| `["collect", "seq"]`                                | 413.520 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 458.880 ms (5%) |           |  29.16 MiB (1%) |      403175 |
| `["collect", "unordered", "basesize=1024"]`         | 249.671 ms (5%) |           | 765.05 KiB (1%) |        1674 |
| `["collect", "unordered", "basesize=32"]`           | 245.860 ms (5%) |           |   1.47 MiB (1%) |       16551 |
| `["findfirst", "n=1000", "foldl"]`                  | 654.826 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 345.267 ms (5%) |           | 563.42 KiB (1%) |       10190 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 343.142 ms (5%) |           | 287.05 KiB (1%) |        5213 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 355.271 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 494.520 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 264.037 ms (5%) |           |   1.02 MiB (1%) |       18890 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 258.643 ms (5%) |           | 525.55 KiB (1%) |        9535 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 260.817 ms (5%) |           | 267.14 KiB (1%) |        4874 |
| `["findfirst", "n=500", "foldl"]`                   |  80.284 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  43.350 ms (5%) |           | 157.16 KiB (1%) |        2839 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  43.276 ms (5%) |           |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  46.029 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 173.721 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 172.321 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 303.037 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.313 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.915 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.619 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.015 ms (5%) |           |   1.22 MiB (1%) |         158 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.478 ms (5%) |           |   1.06 MiB (1%) |        3329 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.833 ms (5%) |           |   1.25 MiB (1%) |        2103 |
| `["parallel_histogram", "seq"]`                     |   7.321 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  14.774 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.278 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.957 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.112 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  14.201 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.174 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.825 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.899 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.264 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.494 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.108 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.085 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  42.680 ms (5%) |  6.514 ms |  62.91 MiB (1%) |     2055423 |
| `["words", "nthreads=2"]`                           |  22.542 ms (5%) |           |  63.99 MiB (1%) |     2067712 |
| `["words", "nthreads=4"]`                           |  23.109 ms (5%) |           |  64.63 MiB (1%) |     2073927 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      78620 s          0 s       2550 s      17490 s          0 s
       #2  2095 MHz      66588 s          0 s       2893 s      29684 s          0 s
       
  Memory: 6.764884948730469 GB (2956.9609375 MB free)
  Uptime: 1013.0 sec
  Load Avg:  1.66845703125  1.57568359375  1.1025390625
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
    Model name:          Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    Stepping:            4
    CPU MHz:             2095.213
    BogoMIPS:            4190.42
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
| Brand              | Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x04, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 44 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

