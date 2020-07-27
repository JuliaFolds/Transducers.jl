# Multi-thread benchmark result

* Pull request commit: [`bac77ee9a175186b34bfc7fa4618c6be8022ff48`](https://github.com/JuliaFolds/Transducers.jl/commit/bac77ee9a175186b34bfc7fa4618c6be8022ff48)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 27 Jul 2020 - 00:49
    - Baseline: 27 Jul 2020 - 00:54
* Package commits:
    - Target: a02a32
    - Baseline: 887f0f
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
| `["collect", "assoc", "basesize=1"]`                |                1.05 (5%) :x: |    1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.18 (5%) :x: | 1.06 (1%) :x: |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 0.95 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["overhead", "default"]`                           |                1.06 (5%) :x: |    1.00 (1%)  |
| `["overhead", "stoppable=false"]`                   |                1.15 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.16 (5%) :x: | 1.02 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.85 (5%) :white_check_mark: |    0.99 (1%)  |
| `["parallel_histogram", "seq"]`                     |                1.05 (5%) :x: |    1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=128"]`      |                1.05 (5%) :x: |    1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=128"]`       |                1.07 (5%) :x: |    1.00 (1%)  |

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
       #1  2095 MHz      52701 s          0 s       2079 s      14140 s          0 s
       #2  2095 MHz      46703 s          0 s       2461 s      19964 s          0 s
       
  Memory: 6.764884948730469 GB (2989.03125 MB free)
  Uptime: 709.0 sec
  Load Avg:  1.6220703125  1.515625  0.9140625
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
       #1  2095 MHz      81723 s          0 s       2684 s      18228 s          0 s
       #2  2095 MHz      67206 s          0 s       3147 s      32510 s          0 s
       
  Memory: 6.764884948730469 GB (2992.83984375 MB free)
  Uptime: 1048.0 sec
  Load Avg:  1.74560546875  1.57568359375  1.11669921875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 27 Jul 2020 - 0:49
* Package commit: a02a32
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
| `["collect", "assoc", "basesize=1"]`                | 374.042 ms (5%) | 10.679 ms |  87.55 MiB (1%) |     1590749 |
| `["collect", "assoc", "basesize=1024"]`             | 232.529 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 236.955 ms (5%) |           |   5.64 MiB (1%) |       54025 |
| `["collect", "seq"]`                                | 461.048 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 456.247 ms (5%) |           |  29.16 MiB (1%) |      403147 |
| `["collect", "unordered", "basesize=1024"]`         | 302.800 ms (5%) |           | 822.25 KiB (1%) |        5671 |
| `["collect", "unordered", "basesize=32"]`           | 261.405 ms (5%) |           |   1.47 MiB (1%) |       16806 |
| `["findfirst", "n=1000", "foldl"]`                  | 706.739 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 363.459 ms (5%) |           | 563.81 KiB (1%) |       10215 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 352.841 ms (5%) |           | 287.17 KiB (1%) |        5221 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 370.252 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 532.795 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 276.586 ms (5%) |           |   1.02 MiB (1%) |       18852 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 275.471 ms (5%) |           | 525.75 KiB (1%) |        9548 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 273.831 ms (5%) |           | 266.89 KiB (1%) |        4858 |
| `["findfirst", "n=500", "foldl"]`                   |  89.757 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  45.397 ms (5%) |           | 157.16 KiB (1%) |        2839 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  45.616 ms (5%) |           |  84.41 KiB (1%) |        1528 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  49.114 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 168.002 μs (5%) |           | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=false"]`                   | 183.602 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 306.004 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.562 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.538 ms (5%) |           |   1.80 MiB (1%) |         496 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.071 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.750 ms (5%) |           |   1.22 MiB (1%) |         196 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.234 ms (5%) |           |   1.07 MiB (1%) |        4443 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.868 ms (5%) |           |   1.23 MiB (1%) |         819 |
| `["parallel_histogram", "seq"]`                     |   8.456 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  16.783 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.782 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.647 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.392 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "uniform", "foldl"]`                       |  16.462 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.914 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.677 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.522 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  17.048 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.495 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.143 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.099 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  46.705 ms (5%) |  6.783 ms |  63.47 MiB (1%) |     2073800 |
| `["words", "nthreads=2"]`                           |  23.416 ms (5%) |           |  64.07 MiB (1%) |     2081975 |
| `["words", "nthreads=4"]`                           |  24.722 ms (5%) |           |  65.04 MiB (1%) |     2090222 |

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
       #1  2095 MHz      52701 s          0 s       2079 s      14140 s          0 s
       #2  2095 MHz      46703 s          0 s       2461 s      19964 s          0 s
       
  Memory: 6.764884948730469 GB (2989.03125 MB free)
  Uptime: 709.0 sec
  Load Avg:  1.6220703125  1.515625  0.9140625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 27 Jul 2020 - 0:54
* Package commit: 887f0f
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
| `["collect", "assoc", "basesize=1"]`                | 356.056 ms (5%) | 9.684 ms |  87.55 MiB (1%) |     1590798 |
| `["collect", "assoc", "basesize=1024"]`             | 228.771 ms (5%) |          |   1.84 MiB (1%) |        1807 |
| `["collect", "assoc", "basesize=32"]`               | 231.615 ms (5%) |          |   5.64 MiB (1%) |       54006 |
| `["collect", "seq"]`                                | 455.685 ms (5%) |          |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 458.590 ms (5%) |          |  29.16 MiB (1%) |      403163 |
| `["collect", "unordered", "basesize=1024"]`         | 257.164 ms (5%) |          | 772.11 KiB (1%) |        2126 |
| `["collect", "unordered", "basesize=32"]`           | 258.719 ms (5%) |          |   1.47 MiB (1%) |       16950 |
| `["findfirst", "n=1000", "foldl"]`                  | 732.715 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 377.224 ms (5%) |          | 563.66 KiB (1%) |       10205 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 372.572 ms (5%) |          | 287.19 KiB (1%) |        5222 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 373.653 ms (5%) |          | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 544.255 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 280.915 ms (5%) |          |   1.02 MiB (1%) |       18957 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 279.554 ms (5%) |          | 525.83 KiB (1%) |        9553 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 278.002 ms (5%) |          | 266.89 KiB (1%) |        4858 |
| `["findfirst", "n=500", "foldl"]`                   |  93.193 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.133 ms (5%) |          | 157.13 KiB (1%) |        2837 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  48.397 ms (5%) |          |  84.41 KiB (1%) |        1528 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  50.229 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 159.104 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 159.803 μs (5%) |          | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 315.008 μs (5%) |          | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.504 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.276 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.848 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.683 ms (5%) |          |   1.22 MiB (1%) |         244 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.908 ms (5%) |          |   1.05 MiB (1%) |        3066 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.893 ms (5%) |          |   1.24 MiB (1%) |        1311 |
| `["parallel_histogram", "seq"]`                     |   8.051 ms (5%) |          | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  17.201 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.227 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.934 ms (5%) |          | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.782 ms (5%) |          |  76.23 KiB (1%) |        1483 |
| `["sum", "uniform", "foldl"]`                       |  16.683 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.477 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.800 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.594 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.948 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.902 ms (5%) |          | 313.30 KiB (1%) |        6065 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.037 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.851 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  45.689 ms (5%) | 6.763 ms |  63.30 MiB (1%) |     2067832 |
| `["words", "nthreads=2"]`                           |  23.694 ms (5%) |          |  63.90 MiB (1%) |     2075992 |
| `["words", "nthreads=4"]`                           |  24.455 ms (5%) |          |  64.87 MiB (1%) |     2084291 |

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
       #1  2095 MHz      81723 s          0 s       2684 s      18228 s          0 s
       #2  2095 MHz      67206 s          0 s       3147 s      32510 s          0 s
       
  Memory: 6.764884948730469 GB (2992.83984375 MB free)
  Uptime: 1048.0 sec
  Load Avg:  1.74560546875  1.57568359375  1.11669921875
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
    CPU MHz:             2095.080
    BogoMIPS:            4190.16
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

