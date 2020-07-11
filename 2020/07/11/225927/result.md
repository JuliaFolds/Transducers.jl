# Multi-thread benchmark result

* Pull request commit: [`ffdcd7dc04f50a157b07ab49ae6255fb99374964`](https://github.com/JuliaFolds/Transducers.jl/commit/ffdcd7dc04f50a157b07ab49ae6255fb99374964)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/357> (Turn `right` into a monoid)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 11 Jul 2020 - 22:54
    - Baseline: 11 Jul 2020 - 22:59
* Package commits:
    - Target: bf6120
    - Baseline: cf5a27
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
| `["collect", "assoc", "basesize=1"]`                |                1.16 (5%) :x: |                   1.00 (1%)  |
| `["collect", "seq"]`                                | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1"]`            |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.08 (5%) :x: |                1.07 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.09 (5%) :x: |                1.01 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.91 (5%) :white_check_mark: | 0.98 (1%) :white_check_mark: |
| `["sum", "uniform", "foldl"]`                       | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=128"]`       |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=1"]`                           |                1.25 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           |                1.09 (5%) :x: |                   1.00 (1%)  |

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
       #1  2294 MHz      48946 s          0 s       2304 s      18033 s          0 s
       #2  2294 MHz      50530 s          0 s       2630 s      16024 s          0 s
       
  Memory: 6.764884948730469 GB (2802.21875 MB free)
  Uptime: 712.0 sec
  Load Avg:  1.71337890625  1.55615234375  0.9609375
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
       #1  2294 MHz      74013 s          0 s       2829 s      21333 s          0 s
       #2  2294 MHz      70177 s          0 s       3188 s      24600 s          0 s
       
  Memory: 6.764884948730469 GB (2884.96484375 MB free)
  Uptime: 1003.0 sec
  Load Avg:  1.70654296875  1.599609375  1.13623046875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 22:54
* Package commit: bf6120
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
| `["collect", "assoc", "basesize=1"]`                | 333.348 ms (5%) | 11.265 ms |  87.55 MiB (1%) |     1590733 |
| `["collect", "assoc", "basesize=1024"]`             | 151.149 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 157.494 ms (5%) |           |   5.64 MiB (1%) |       54013 |
| `["collect", "seq"]`                                | 287.933 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 418.985 ms (5%) |           |  29.18 MiB (1%) |      404839 |
| `["collect", "unordered", "basesize=1024"]`         | 247.734 ms (5%) |           | 887.91 KiB (1%) |        9918 |
| `["collect", "unordered", "basesize=32"]`           | 181.474 ms (5%) |           |   1.49 MiB (1%) |       18157 |
| `["findfirst", "n=1000", "foldl"]`                  | 472.537 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 245.102 ms (5%) |           | 564.06 KiB (1%) |       10231 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 240.419 ms (5%) |           | 287.19 KiB (1%) |        5222 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 252.645 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 359.757 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 185.771 ms (5%) |           |   1.02 MiB (1%) |       18977 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 193.884 ms (5%) |           | 526.14 KiB (1%) |        9573 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 184.982 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  58.936 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  31.599 ms (5%) |           | 157.38 KiB (1%) |        2853 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  31.093 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  33.120 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 170.801 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 169.001 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 297.502 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.545 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.097 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.777 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  11.677 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.464 ms (5%) |           |   1.06 MiB (1%) |        5174 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.998 ms (5%) |           |   1.23 MiB (1%) |         579 |
| `["parallel_histogram", "seq"]`                     |   6.346 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  11.375 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.363 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.053 ms (5%) |           | 155.13 KiB (1%) |        3013 |
| `["sum", "random", "reduce", "basesize=512"]`       |   5.946 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.035 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   5.958 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.832 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.671 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  11.349 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.509 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.139 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   5.926 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  48.917 ms (5%) |  8.057 ms |  63.09 MiB (1%) |     2061245 |
| `["words", "nthreads=2"]`                           |  22.478 ms (5%) |           |  64.18 MiB (1%) |     2073450 |
| `["words", "nthreads=4"]`                           |  24.049 ms (5%) |           |  64.81 MiB (1%) |     2079718 |

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
       #1  2294 MHz      48946 s          0 s       2304 s      18033 s          0 s
       #2  2294 MHz      50530 s          0 s       2630 s      16024 s          0 s
       
  Memory: 6.764884948730469 GB (2802.21875 MB free)
  Uptime: 712.0 sec
  Load Avg:  1.71337890625  1.55615234375  0.9609375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 11 Jul 2020 - 22:59
* Package commit: cf5a27
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
| `["collect", "assoc", "basesize=1"]`                | 287.860 ms (5%) | 11.759 ms |  87.55 MiB (1%) |     1590779 |
| `["collect", "assoc", "basesize=1024"]`             | 151.538 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 153.407 ms (5%) |           |   5.64 MiB (1%) |       54010 |
| `["collect", "seq"]`                                | 318.098 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 396.595 ms (5%) |           |  29.19 MiB (1%) |      405016 |
| `["collect", "unordered", "basesize=1024"]`         | 229.429 ms (5%) |           | 829.02 KiB (1%) |        5813 |
| `["collect", "unordered", "basesize=32"]`           | 186.893 ms (5%) |           |   1.51 MiB (1%) |       19021 |
| `["findfirst", "n=1000", "foldl"]`                  | 479.062 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 247.744 ms (5%) |           | 564.00 KiB (1%) |       10227 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 250.556 ms (5%) |           | 287.11 KiB (1%) |        5217 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 251.520 ms (5%) |           | 149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 349.090 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 192.756 ms (5%) |           |   1.02 MiB (1%) |       18971 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 185.506 ms (5%) |           | 526.05 KiB (1%) |        9567 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 185.387 ms (5%) |           | 267.14 KiB (1%) |        4874 |
| `["findfirst", "n=500", "foldl"]`                   |  59.944 ms (5%) |           |  112 bytes (1%) |           4 |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  31.868 ms (5%) |           | 157.31 KiB (1%) |        2849 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  31.852 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  33.372 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 166.001 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 166.601 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 283.901 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.430 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.072 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.701 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  11.447 ms (5%) |           |   1.22 MiB (1%) |         158 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  17.826 ms (5%) |           |   1.05 MiB (1%) |        4896 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.421 ms (5%) |           |   1.25 MiB (1%) |        2362 |
| `["parallel_histogram", "seq"]`                     |   6.214 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  11.411 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.439 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.058 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.040 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  12.282 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.002 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   5.939 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   5.843 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.416 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   5.995 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.189 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.007 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  39.279 ms (5%) |  6.457 ms |  62.99 MiB (1%) |     2058015 |
| `["words", "nthreads=2"]`                           |  21.580 ms (5%) |           |  64.07 MiB (1%) |     2070256 |
| `["words", "nthreads=4"]`                           |  21.988 ms (5%) |           |  64.71 MiB (1%) |     2076478 |

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
       #1  2294 MHz      74013 s          0 s       2829 s      21333 s          0 s
       #2  2294 MHz      70177 s          0 s       3188 s      24600 s          0 s
       
  Memory: 6.764884948730469 GB (2884.96484375 MB free)
  Uptime: 1003.0 sec
  Load Avg:  1.70654296875  1.599609375  1.13623046875
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
    CPU MHz:             2294.686
    BogoMIPS:            4589.37
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

