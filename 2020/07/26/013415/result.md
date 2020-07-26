# Multi-thread benchmark result

* Pull request commit: [`59f41420dfa1e5e04c4409b008a42d24edf39539`](https://github.com/JuliaFolds/Transducers.jl/commit/59f41420dfa1e5e04c4409b008a42d24edf39539)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/374> (Tweak documentation)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 26 Jul 2020 - 01:29
    - Baseline: 26 Jul 2020 - 01:33
* Package commits:
    - Target: eddd40
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

| ID                                                  | time ratio                   | memory ratio  |
|-----------------------------------------------------|------------------------------|---------------|
| `["collect", "unordered", "basesize=1024"]`         |                1.16 (5%) :x: | 1.05 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=4096"]`  | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=16384"]`  |                   1.05 (5%)  | 1.27 (1%) :x: |
| `["sum", "random", "reduce", "basesize=512"]`       | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["words", "nthreads=1"]`                           |                1.06 (5%) :x: |    1.00 (1%)  |
| `["words", "nthreads=2"]`                           |                1.34 (5%) :x: |    1.00 (1%)  |
| `["words", "nthreads=4"]`                           |                1.28 (5%) :x: |    1.00 (1%)  |

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
       #1  2095 MHz      51123 s          0 s       2242 s      15062 s          0 s
       #2  2095 MHz      46327 s          0 s       2446 s      19481 s          0 s
       
  Memory: 6.764884948730469 GB (2962.9296875 MB free)
  Uptime: 705.0 sec
  Load Avg:  1.7822265625  1.54052734375  0.9052734375
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
       #1  2095 MHz      68802 s          0 s       2710 s      25554 s          0 s
       #2  2095 MHz      73038 s          0 s       2900 s      20830 s          0 s
       
  Memory: 6.764884948730469 GB (3051.03515625 MB free)
  Uptime: 993.0 sec
  Load Avg:  1.6494140625  1.5537109375  1.0830078125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 1:29
* Package commit: eddd40
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
| `["collect", "assoc", "basesize=1"]`                | 311.882 ms (5%) | 9.729 ms |  87.55 MiB (1%) |     1590754 |
| `["collect", "assoc", "basesize=1024"]`             | 191.854 ms (5%) |          |   1.84 MiB (1%) |        1807 |
| `["collect", "assoc", "basesize=32"]`               | 194.470 ms (5%) |          |   5.64 MiB (1%) |       54005 |
| `["collect", "seq"]`                                | 375.507 ms (5%) |          |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 392.512 ms (5%) |          |  29.12 MiB (1%) |      400977 |
| `["collect", "unordered", "basesize=1024"]`         | 260.845 ms (5%) |          | 809.77 KiB (1%) |        4917 |
| `["collect", "unordered", "basesize=32"]`           | 219.294 ms (5%) |          |   1.46 MiB (1%) |       16319 |
| `["findfirst", "n=1000", "foldl"]`                  | 594.374 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 306.315 ms (5%) |          | 563.70 KiB (1%) |       10208 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 310.084 ms (5%) |          | 287.11 KiB (1%) |        5217 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 309.699 ms (5%) |          | 149.13 KiB (1%) |        2713 |
| `["findfirst", "n=400", "foldl"]`                   | 447.807 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 229.942 ms (5%) |          |   1.02 MiB (1%) |       18900 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 227.446 ms (5%) |          | 525.59 KiB (1%) |        9538 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 231.715 ms (5%) |          | 266.95 KiB (1%) |        4862 |
| `["findfirst", "n=500", "foldl"]`                   |  74.388 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  39.009 ms (5%) |          | 157.13 KiB (1%) |        2837 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  38.576 ms (5%) |          |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  40.681 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 156.708 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 155.308 μs (5%) |          | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=true"]`                    | 284.814 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.725 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.208 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.957 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.859 ms (5%) |          |   1.22 MiB (1%) |         250 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.177 ms (5%) |          |   1.07 MiB (1%) |        5980 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.295 ms (5%) |          |   1.26 MiB (1%) |        2760 |
| `["parallel_histogram", "seq"]`                     |   6.735 ms (5%) |          | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  13.908 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.890 ms (5%) |          | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.734 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.675 ms (5%) |          |  76.23 KiB (1%) |        1483 |
| `["sum", "uniform", "foldl"]`                       |  13.524 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.908 ms (5%) |          | 313.39 KiB (1%) |        6071 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.660 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.558 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  14.189 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.085 ms (5%) |          | 313.23 KiB (1%) |        6061 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.023 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.782 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  39.212 ms (5%) | 6.298 ms |  63.02 MiB (1%) |     2059359 |
| `["words", "nthreads=2"]`                           |  25.206 ms (5%) |          |  64.11 MiB (1%) |     2071630 |
| `["words", "nthreads=4"]`                           |  25.454 ms (5%) |          |  65.06 MiB (1%) |     2081972 |

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
       #1  2095 MHz      51123 s          0 s       2242 s      15062 s          0 s
       #2  2095 MHz      46327 s          0 s       2446 s      19481 s          0 s
       
  Memory: 6.764884948730469 GB (2962.9296875 MB free)
  Uptime: 705.0 sec
  Load Avg:  1.7822265625  1.54052734375  0.9052734375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 1:33
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
| `["collect", "assoc", "basesize=1"]`                | 314.045 ms (5%) | 10.605 ms |  87.55 MiB (1%) |     1590745 |
| `["collect", "assoc", "basesize=1024"]`             | 189.815 ms (5%) |           |   1.84 MiB (1%) |        1808 |
| `["collect", "assoc", "basesize=32"]`               | 191.957 ms (5%) |           |   5.64 MiB (1%) |       54012 |
| `["collect", "seq"]`                                | 378.288 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 387.049 ms (5%) |           |  29.14 MiB (1%) |      402170 |
| `["collect", "unordered", "basesize=1024"]`         | 224.058 ms (5%) |           | 769.11 KiB (1%) |        1934 |
| `["collect", "unordered", "basesize=32"]`           | 219.101 ms (5%) |           |   1.46 MiB (1%) |       16134 |
| `["findfirst", "n=1000", "foldl"]`                  | 597.021 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 311.951 ms (5%) |           | 563.75 KiB (1%) |       10211 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 301.400 ms (5%) |           | 287.08 KiB (1%) |        5215 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 314.604 ms (5%) |           | 149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 445.421 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 233.892 ms (5%) |           |   1.02 MiB (1%) |       18892 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 232.506 ms (5%) |           | 525.42 KiB (1%) |        9527 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 230.203 ms (5%) |           | 266.86 KiB (1%) |        4856 |
| `["findfirst", "n=500", "foldl"]`                   |  73.850 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  38.684 ms (5%) |           | 157.19 KiB (1%) |        2841 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  38.078 ms (5%) |           |  84.42 KiB (1%) |        1529 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  40.380 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 152.705 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 152.305 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 275.909 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.684 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.467 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.951 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.218 ms (5%) |           | 984.64 KiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.507 ms (5%) |           |   1.06 MiB (1%) |        5948 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.095 ms (5%) |           |   1.27 MiB (1%) |        3580 |
| `["parallel_histogram", "seq"]`                     |   6.714 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  13.951 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.153 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.862 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.070 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  13.258 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.791 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.703 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.536 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  13.998 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.161 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.927 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.832 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  37.005 ms (5%) |  5.936 ms |  63.22 MiB (1%) |     2066140 |
| `["words", "nthreads=2"]`                           |  18.836 ms (5%) |           |  63.82 MiB (1%) |     2074258 |
| `["words", "nthreads=4"]`                           |  19.832 ms (5%) |           |  64.79 MiB (1%) |     2082477 |

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
       #1  2095 MHz      68802 s          0 s       2710 s      25554 s          0 s
       #2  2095 MHz      73038 s          0 s       2900 s      20830 s          0 s
       
  Memory: 6.764884948730469 GB (3051.03515625 MB free)
  Uptime: 993.0 sec
  Load Avg:  1.6494140625  1.5537109375  1.0830078125
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
    CPU MHz:             2095.195
    BogoMIPS:            4190.39
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            1024K
    L3 cache:            36608K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves
    

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

