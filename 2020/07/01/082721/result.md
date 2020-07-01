# Multi-thread benchmark result

* Pull request commit: [`ad319fbb6102d91fd5df384e336b2957835d190a`](https://github.com/JuliaFolds/Transducers.jl/commit/ad319fbb6102d91fd5df384e336b2957835d190a)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 08:22
    - Baseline: 1 Jul 2020 - 08:27
* Package commits:
    - Target: ee9ff6
    - Baseline: 6b039c
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
| `["collect", "unordered", "basesize=1"]`            |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.13 (5%) :x: |                1.05 (1%) :x: |
| `["collect", "unordered", "basesize=32"]`           |                   1.04 (5%)  |                1.01 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   0.96 (5%)  | 0.99 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                1.11 (5%) :x: | 0.98 (1%) :white_check_mark: |
| `["sum", "uniform", "reduce", "basesize=256"]`      | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           |                1.06 (5%) :x: |                   1.01 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      46962 s          0 s       2368 s      20760 s          0 s
       #2  2294 MHz      53921 s          0 s       2658 s      13147 s          0 s
       
  Memory: 6.764884948730469 GB (3112.7265625 MB free)
  Uptime: 719.0 sec
  Load Avg:  1.77001953125  1.576171875  0.9423828125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.4.2
Commit 44fa15b150* (2020-05-23 18:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.4 LTS
  uname: Linux 5.3.0-1031-azure #32~18.04.1-Ubuntu SMP Mon Jun 22 15:27:23 UTC 2020 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      68260 s          0 s       2988 s      27925 s          0 s
       #2  2294 MHz      77591 s          0 s       3231 s      17971 s          0 s
       
  Memory: 6.764884948730469 GB (3120.80859375 MB free)
  Uptime: 1011.0 sec
  Load Avg:  1.78564453125  1.6318359375  1.134765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 8:22
* Package commit: ee9ff6
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
| `["collect", "assoc", "basesize=1"]`                | 295.550 ms (5%) | 12.799 ms |  87.55 MiB (1%) |     1590672 |
| `["collect", "assoc", "basesize=1024"]`             | 154.884 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 160.148 ms (5%) |           |   5.64 MiB (1%) |       54001 |
| `["collect", "seq"]`                                | 317.768 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 444.884 ms (5%) |           |  29.23 MiB (1%) |      407624 |
| `["collect", "unordered", "basesize=1024"]`         | 223.071 ms (5%) |           | 824.53 KiB (1%) |        5862 |
| `["collect", "unordered", "basesize=32"]`           | 197.274 ms (5%) |           |   1.51 MiB (1%) |       19610 |
| `["findfirst", "n=1000", "foldl"]`                  | 518.423 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 265.363 ms (5%) |           | 563.98 KiB (1%) |       10226 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 263.150 ms (5%) |           | 287.08 KiB (1%) |        5215 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 272.885 ms (5%) |           | 149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 382.718 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 198.518 ms (5%) |           |   1.02 MiB (1%) |       18971 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 200.696 ms (5%) |           | 526.16 KiB (1%) |        9574 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 197.705 ms (5%) |           | 267.22 KiB (1%) |        4879 |
| `["findfirst", "n=500", "foldl"]`                   |  62.743 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  32.443 ms (5%) |           | 157.38 KiB (1%) |        2853 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  32.530 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  34.159 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 175.202 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 171.302 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 295.002 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.455 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.288 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.665 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.142 ms (5%) |           |   1.22 MiB (1%) |         271 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.164 ms (5%) |           |   1.05 MiB (1%) |        5151 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.438 ms (5%) |           |   1.23 MiB (1%) |         643 |
| `["parallel_histogram", "seq"]`                     |   6.137 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.571 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.267 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "random", "reduce", "basesize=256"]`       |   5.955 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.018 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.068 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.286 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.752 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.687 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "valley", "foldl"]`                        |  11.714 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.230 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.049 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.906 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  36.486 ms (5%) |  7.136 ms |  65.05 MiB (1%) |     2104513 |
| `["words", "nthreads=2"]`                           |  19.155 ms (5%) |           |  65.76 MiB (1%) |     2104666 |
| `["words", "nthreads=4"]`                           |  20.652 ms (5%) |           |  66.40 MiB (1%) |     2104959 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      46962 s          0 s       2368 s      20760 s          0 s
       #2  2294 MHz      53921 s          0 s       2658 s      13147 s          0 s
       
  Memory: 6.764884948730469 GB (3112.7265625 MB free)
  Uptime: 719.0 sec
  Load Avg:  1.77001953125  1.576171875  0.9423828125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 8:27
* Package commit: 6b039c
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
| `["collect", "assoc", "basesize=1"]`                | 300.128 ms (5%) | 12.694 ms |  87.55 MiB (1%) |     1590728 |
| `["collect", "assoc", "basesize=1024"]`             | 157.209 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 164.112 ms (5%) |           |   5.64 MiB (1%) |       54017 |
| `["collect", "seq"]`                                | 313.448 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 421.033 ms (5%) |           |  29.19 MiB (1%) |      405252 |
| `["collect", "unordered", "basesize=1024"]`         | 197.231 ms (5%) |           | 787.89 KiB (1%) |        3517 |
| `["collect", "unordered", "basesize=32"]`           | 190.046 ms (5%) |           |   1.50 MiB (1%) |       18470 |
| `["findfirst", "n=1000", "foldl"]`                  | 534.265 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 257.178 ms (5%) |           | 564.03 KiB (1%) |       10229 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 266.958 ms (5%) |           | 287.11 KiB (1%) |        5217 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 274.254 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 388.482 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 197.199 ms (5%) |           |   1.02 MiB (1%) |       18974 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 195.760 ms (5%) |           | 526.09 KiB (1%) |        9570 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 202.335 ms (5%) |           | 267.05 KiB (1%) |        4868 |
| `["findfirst", "n=500", "foldl"]`                   |  62.134 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  32.494 ms (5%) |           | 157.36 KiB (1%) |        2852 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  32.307 ms (5%) |           |  84.50 KiB (1%) |        1534 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  34.769 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 169.002 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 169.202 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 285.902 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.428 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.041 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.650 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.772 ms (5%) |           |   1.22 MiB (1%) |         212 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.100 ms (5%) |           |   1.06 MiB (1%) |        5298 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.810 ms (5%) |           |   1.25 MiB (1%) |        2071 |
| `["parallel_histogram", "seq"]`                     |   6.163 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.580 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.200 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.104 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.968 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.363 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.172 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.068 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.796 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.392 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.124 ms (5%) |           | 313.20 KiB (1%) |        6059 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.096 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.969 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  35.000 ms (5%) |  6.652 ms |  64.71 MiB (1%) |     2094037 |
| `["words", "nthreads=2"]`                           |  19.056 ms (5%) |           |  65.42 MiB (1%) |     2094191 |
| `["words", "nthreads=4"]`                           |  19.496 ms (5%) |           |  65.88 MiB (1%) |     2094339 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz      68260 s          0 s       2988 s      27925 s          0 s
       #2  2294 MHz      77591 s          0 s       3231 s      17971 s          0 s
       
  Memory: 6.764884948730469 GB (3120.80859375 MB free)
  Uptime: 1011.0 sec
  Load Avg:  1.78564453125  1.6318359375  1.134765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
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
    Model:               79
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz
    Stepping:            1
    CPU MHz:             2294.682
    BogoMIPS:            4589.36
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            51200K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Broadwell                                              |
| Model              | Family: 0x06, Model: 0x4f, Stepping: 0x01, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 44 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

