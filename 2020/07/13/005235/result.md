# Multi-thread benchmark result

* Pull request commit: [`a13ff3bc7c1d012f35dc69dcfd3b63c373ea217b`](https://github.com/JuliaFolds/Transducers.jl/commit/a13ff3bc7c1d012f35dc69dcfd3b63c373ea217b)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 13 Jul 2020 - 00:46
    - Baseline: 13 Jul 2020 - 00:52
* Package commits:
    - Target: 459cf9
    - Baseline: 7c47b9
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
| `["collect", "unordered", "basesize=1024"]`         |                1.27 (5%) :x: |                1.13 (1%) :x: |
| `["findfirst", "n=400", "foldl"]`                   |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   0.99 (5%)  | 0.87 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   0.98 (5%)  |                1.02 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.93 (5%) :white_check_mark: |                   0.99 (1%)  |
| `["parallel_histogram", "seq"]`                     |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=512"]`       |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           |                   1.02 (5%)  | 0.99 (1%) :white_check_mark: |
| `["words", "nthreads=4"]`                           | 0.94 (5%) :white_check_mark: |                   0.99 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      48996 s          0 s       2187 s      16378 s          0 s
       #2  2095 MHz      48782 s          0 s       2526 s      16294 s          0 s
       
  Memory: 6.764884948730469 GB (2853.546875 MB free)
  Uptime: 699.0 sec
  Load Avg:  1.6640625  1.5166015625  0.9228515625
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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      73718 s          0 s       2824 s      23536 s          0 s
       #2  2095 MHz      72593 s          0 s       3064 s      24663 s          0 s
       
  Memory: 6.764884948730469 GB (2810.640625 MB free)
  Uptime: 1027.0 sec
  Load Avg:  1.7451171875  1.62646484375  1.14794921875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 13 Jul 2020 - 0:46
* Package commit: 459cf9
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
| `["collect", "assoc", "basesize=1"]`                | 348.206 ms (5%) | 13.336 ms |  87.55 MiB (1%) |     1590749 |
| `["collect", "assoc", "basesize=1024"]`             | 218.161 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 222.828 ms (5%) |           |   5.64 MiB (1%) |       54013 |
| `["collect", "seq"]`                                | 417.009 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 451.897 ms (5%) |  7.623 ms |  29.16 MiB (1%) |      403411 |
| `["collect", "unordered", "basesize=1024"]`         | 310.403 ms (5%) |           | 877.34 KiB (1%) |        9197 |
| `["collect", "unordered", "basesize=32"]`           | 239.472 ms (5%) |           |   1.47 MiB (1%) |       16817 |
| `["findfirst", "n=1000", "foldl"]`                  | 667.123 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 350.351 ms (5%) |           | 563.63 KiB (1%) |       10203 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 349.679 ms (5%) |           | 287.23 KiB (1%) |        5225 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 351.035 ms (5%) |           | 149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 513.173 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 258.941 ms (5%) |           |   1.02 MiB (1%) |       18892 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 260.137 ms (5%) |           | 525.81 KiB (1%) |        9552 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 263.784 ms (5%) |           | 267.08 KiB (1%) |        4870 |
| `["findfirst", "n=500", "foldl"]`                   |  81.417 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.644 ms (5%) |           | 157.16 KiB (1%) |        2839 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  42.671 ms (5%) |           |  84.44 KiB (1%) |        1530 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  45.592 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 155.912 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 164.213 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 287.222 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.009 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.720 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.370 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.938 ms (5%) |           |   1.22 MiB (1%) |         196 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.974 ms (5%) |           |   1.07 MiB (1%) |        4145 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.002 ms (5%) |           |   1.25 MiB (1%) |        2006 |
| `["parallel_histogram", "seq"]`                     |   7.713 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  14.998 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.871 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.758 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.152 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  14.256 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.523 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.169 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.646 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  13.985 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.968 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.729 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.690 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  43.566 ms (5%) |  7.433 ms |  63.03 MiB (1%) |     2059614 |
| `["words", "nthreads=2"]`                           |  23.516 ms (5%) |           |  63.63 MiB (1%) |     2067766 |
| `["words", "nthreads=4"]`                           |  22.438 ms (5%) |           |  64.60 MiB (1%) |     2076041 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      48996 s          0 s       2187 s      16378 s          0 s
       #2  2095 MHz      48782 s          0 s       2526 s      16294 s          0 s
       
  Memory: 6.764884948730469 GB (2853.546875 MB free)
  Uptime: 699.0 sec
  Load Avg:  1.6640625  1.5166015625  0.9228515625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 13 Jul 2020 - 0:52
* Package commit: 7c47b9
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
| `["collect", "assoc", "basesize=1"]`                | 346.701 ms (5%) | 12.091 ms |  87.55 MiB (1%) |     1590793 |
| `["collect", "assoc", "basesize=1024"]`             | 215.307 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 218.188 ms (5%) |           |   5.64 MiB (1%) |       54009 |
| `["collect", "seq"]`                                | 408.326 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 453.012 ms (5%) |           |  29.16 MiB (1%) |      403103 |
| `["collect", "unordered", "basesize=1024"]`         | 243.977 ms (5%) |           | 776.02 KiB (1%) |        2376 |
| `["collect", "unordered", "basesize=32"]`           | 238.211 ms (5%) |           |   1.47 MiB (1%) |       16640 |
| `["findfirst", "n=1000", "foldl"]`                  | 661.815 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 342.691 ms (5%) |           | 563.66 KiB (1%) |       10205 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 346.036 ms (5%) |           | 287.11 KiB (1%) |        5217 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 343.900 ms (5%) |           | 149.13 KiB (1%) |        2713 |
| `["findfirst", "n=400", "foldl"]`                   | 487.861 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 258.461 ms (5%) |           |   1.02 MiB (1%) |       18917 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 260.026 ms (5%) |           | 525.73 KiB (1%) |        9547 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 260.826 ms (5%) |           | 266.94 KiB (1%) |        4861 |
| `["findfirst", "n=500", "foldl"]`                   |  79.948 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  43.542 ms (5%) |           | 157.14 KiB (1%) |        2838 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  42.391 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.513 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 157.811 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 161.211 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 284.819 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.924 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.787 ms (5%) |           |   2.07 MiB (1%) |         501 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.330 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.731 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.555 ms (5%) |           |   1.05 MiB (1%) |        5165 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.426 ms (5%) |           |   1.26 MiB (1%) |        2554 |
| `["parallel_histogram", "seq"]`                     |   7.061 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.099 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.764 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.879 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.677 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  13.931 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.888 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.979 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.289 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  14.262 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.209 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.738 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.572 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  43.520 ms (5%) |  7.320 ms |  63.32 MiB (1%) |     2068491 |
| `["words", "nthreads=2"]`                           |  23.045 ms (5%) |           |  64.40 MiB (1%) |     2080760 |
| `["words", "nthreads=4"]`                           |  23.788 ms (5%) |           |  65.04 MiB (1%) |     2087026 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz      73718 s          0 s       2824 s      23536 s          0 s
       #2  2095 MHz      72593 s          0 s       3064 s      24663 s          0 s
       
  Memory: 6.764884948730469 GB (2810.640625 MB free)
  Uptime: 1027.0 sec
  Load Avg:  1.7451171875  1.62646484375  1.14794921875
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
    CPU MHz:             2095.228
    BogoMIPS:            4190.45
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

