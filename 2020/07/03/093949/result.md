# Multi-thread benchmark result

* Pull request commit: [`3d7b6a98d5ec35cf925a800898a487c74a4f7251`](https://github.com/JuliaFolds/Transducers.jl/commit/3d7b6a98d5ec35cf925a800898a487c74a4f7251)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Jul 2020 - 09:34
    - Baseline: 3 Jul 2020 - 09:39
* Package commits:
    - Target: df715e
    - Baseline: 8bcb4a
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
| `["collect", "unordered", "basesize=1024"]`         | 0.72 (5%) :white_check_mark: | 0.82 (1%) :white_check_mark: |
| `["overhead", "default"]`                           | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "stoppable=false"]`                   | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "stoppable=true"]`                    | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   0.97 (5%)  |                1.02 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=128"]`      | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |

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
       #1  2095 MHz      45142 s          0 s       2215 s      23755 s          0 s
       #2  2095 MHz      56880 s          0 s       2762 s      11907 s          0 s
       
  Memory: 6.764884948730469 GB (3017.98828125 MB free)
  Uptime: 734.0 sec
  Load Avg:  1.58984375  1.5263671875  0.96630859375
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
       #1  2095 MHz      67186 s          0 s       2746 s      30383 s          0 s
       #2  2095 MHz      79765 s          0 s       3271 s      17607 s          0 s
       
  Memory: 6.764884948730469 GB (3021.19921875 MB free)
  Uptime: 1028.0 sec
  Load Avg:  1.56591796875  1.52880859375  1.12060546875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 9:34
* Package commit: df715e
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
| `["collect", "assoc", "basesize=1"]`                | 382.413 ms (5%) | 12.107 ms |  87.55 MiB (1%) |     1590783 |
| `["collect", "assoc", "basesize=1024"]`             | 240.658 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 246.617 ms (5%) |           |   5.64 MiB (1%) |       54014 |
| `["collect", "seq"]`                                | 474.577 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 506.099 ms (5%) |  8.517 ms |  29.16 MiB (1%) |      403371 |
| `["collect", "unordered", "basesize=1024"]`         | 264.900 ms (5%) |           | 763.86 KiB (1%) |        1934 |
| `["collect", "unordered", "basesize=32"]`           | 277.730 ms (5%) |           |   1.47 MiB (1%) |       16857 |
| `["findfirst", "n=1000", "foldl"]`                  | 758.020 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 383.171 ms (5%) |           | 563.63 KiB (1%) |       10203 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 384.192 ms (5%) |           | 287.23 KiB (1%) |        5225 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 387.780 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 569.975 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 292.832 ms (5%) |           |   1.02 MiB (1%) |       18866 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 289.011 ms (5%) |           | 525.81 KiB (1%) |        9552 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 291.885 ms (5%) |           | 267.08 KiB (1%) |        4870 |
| `["findfirst", "n=500", "foldl"]`                   |  97.746 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  50.541 ms (5%) |           | 157.28 KiB (1%) |        2847 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  49.766 ms (5%) |           |  84.41 KiB (1%) |        1528 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  52.280 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 179.100 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 165.100 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 337.201 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.065 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   6.046 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.502 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.960 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.773 ms (5%) |           |   1.07 MiB (1%) |        4724 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.847 ms (5%) |           |   1.25 MiB (1%) |        2021 |
| `["parallel_histogram", "seq"]`                     |   9.311 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.765 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.884 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.608 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.606 ms (5%) |           |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  18.109 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.386 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.329 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.239 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.626 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |  10.159 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.759 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.594 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["words", "nthreads=1"]`                           |  41.094 ms (5%) |  7.469 ms |  64.94 MiB (1%) |     2101315 |
| `["words", "nthreads=2"]`                           |  22.731 ms (5%) |           |  65.65 MiB (1%) |     2101470 |
| `["words", "nthreads=4"]`                           |  22.959 ms (5%) |           |  66.11 MiB (1%) |     2101617 |

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
       #1  2095 MHz      45142 s          0 s       2215 s      23755 s          0 s
       #2  2095 MHz      56880 s          0 s       2762 s      11907 s          0 s
       
  Memory: 6.764884948730469 GB (3017.98828125 MB free)
  Uptime: 734.0 sec
  Load Avg:  1.58984375  1.5263671875  0.96630859375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 9:39
* Package commit: 8bcb4a
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
| `["collect", "assoc", "basesize=1"]`                | 383.005 ms (5%) | 11.979 ms |  87.55 MiB (1%) |     1590774 |
| `["collect", "assoc", "basesize=1024"]`             | 241.380 ms (5%) |           |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 243.863 ms (5%) |           |   5.64 MiB (1%) |       54013 |
| `["collect", "seq"]`                                | 473.991 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 495.785 ms (5%) |           |  29.16 MiB (1%) |      403411 |
| `["collect", "unordered", "basesize=1024"]`         | 367.016 ms (5%) |           | 928.75 KiB (1%) |       12532 |
| `["collect", "unordered", "basesize=32"]`           | 272.175 ms (5%) |           |   1.47 MiB (1%) |       17027 |
| `["findfirst", "n=1000", "foldl"]`                  | 749.145 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 385.566 ms (5%) |           | 564.03 KiB (1%) |       10229 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 382.879 ms (5%) |           | 287.27 KiB (1%) |        5227 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 389.354 ms (5%) |           | 149.30 KiB (1%) |        2724 |
| `["findfirst", "n=400", "foldl"]`                   | 566.490 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 291.398 ms (5%) |           |   1.02 MiB (1%) |       18923 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 286.756 ms (5%) |           | 525.64 KiB (1%) |        9541 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 288.355 ms (5%) |           | 267.11 KiB (1%) |        4872 |
| `["findfirst", "n=500", "foldl"]`                   |  96.817 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  49.873 ms (5%) |           | 157.33 KiB (1%) |        2850 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  49.614 ms (5%) |           |  84.44 KiB (1%) |        1530 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  53.112 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 202.101 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 186.601 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 355.302 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.251 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.930 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.568 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  16.003 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.493 ms (5%) |           |   1.05 MiB (1%) |        4763 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.842 ms (5%) |           |   1.25 MiB (1%) |        1811 |
| `["parallel_histogram", "seq"]`                     |   9.313 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.400 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.967 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.905 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.688 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.535 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.929 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.650 ms (5%) |           | 155.05 KiB (1%) |        3008 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.471 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  18.741 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |  10.014 ms (5%) |           | 313.23 KiB (1%) |        6061 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.958 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.725 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  41.147 ms (5%) |  6.869 ms |  65.06 MiB (1%) |     2105378 |
| `["words", "nthreads=2"]`                           |  24.575 ms (5%) |           |  65.42 MiB (1%) |     2105454 |
| `["words", "nthreads=4"]`                           |  25.338 ms (5%) |           |  66.14 MiB (1%) |     2105610 |

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
       #1  2095 MHz      67186 s          0 s       2746 s      30383 s          0 s
       #2  2095 MHz      79765 s          0 s       3271 s      17607 s          0 s
       
  Memory: 6.764884948730469 GB (3021.19921875 MB free)
  Uptime: 1028.0 sec
  Load Avg:  1.56591796875  1.52880859375  1.12060546875
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
    CPU MHz:             2095.076
    BogoMIPS:            4190.15
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

