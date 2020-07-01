# Multi-thread benchmark result

* Target commit: [`07e0e7e94fe5ca54f648c6789f62f181ea0e7b15`](https://github.com/JuliaFolds/Transducers.jl/commit/07e0e7e94fe5ca54f648c6789f62f181ea0e7b15)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/322> (Use create-pull-request v2)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 02:34
    - Baseline: 1 Jul 2020 - 02:39
* Package commits:
    - Target: 96d9c6
    - Baseline: 391f3f
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
| `["collect", "assoc", "basesize=1024"]`             |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1"]`            |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         | 0.79 (5%) :white_check_mark: | 0.97 (1%) :white_check_mark: |
| `["overhead", "default"]`                           |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "stoppable=true"]`                    | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   1.00 (5%)  | 0.98 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                   1.02 (5%)  |                1.02 (1%) :x: |
| `["sum", "uniform", "reduce", "basesize=128"]`      | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["words", "nthreads=1"]`                           |                   0.98 (5%)  | 0.98 (1%) :white_check_mark: |
| `["words", "nthreads=2"]`                           | 0.93 (5%) :white_check_mark: | 0.98 (1%) :white_check_mark: |
| `["words", "nthreads=4"]`                           |                   1.00 (5%)  | 0.99 (1%) :white_check_mark: |

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
       #1  2095 MHz      50188 s          0 s       2376 s      17986 s          0 s
       #2  2095 MHz      49474 s          0 s       2406 s      18201 s          0 s
       
  Memory: 6.764884948730469 GB (3121.73046875 MB free)
  Uptime: 724.0 sec
  Load Avg:  1.759765625  1.54443359375  0.92724609375
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
       #1  2095 MHz      70392 s          0 s       2968 s      25447 s          0 s
       #2  2095 MHz      73254 s          0 s       2883 s      22279 s          0 s
       
  Memory: 6.764884948730469 GB (3170.04296875 MB free)
  Uptime: 1010.0 sec
  Load Avg:  1.67724609375  1.56787109375  1.10009765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 2:34
* Package commit: 96d9c6
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
| `["collect", "assoc", "basesize=1"]`                | 369.262 ms (5%) | 14.268 ms |  87.55 MiB (1%) |     1590764 |
| `["collect", "assoc", "basesize=1024"]`             | 233.023 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 238.990 ms (5%) |           |   5.64 MiB (1%) |       54023 |
| `["collect", "seq"]`                                | 454.177 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 507.059 ms (5%) |           |  29.17 MiB (1%) |      403765 |
| `["collect", "unordered", "basesize=1024"]`         | 259.356 ms (5%) |           | 761.91 KiB (1%) |        1854 |
| `["collect", "unordered", "basesize=32"]`           | 267.082 ms (5%) |           |   1.47 MiB (1%) |       16958 |
| `["findfirst", "n=1000", "foldl"]`                  | 720.803 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 362.956 ms (5%) |           | 563.70 KiB (1%) |       10208 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 360.682 ms (5%) |           | 287.14 KiB (1%) |        5219 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 358.560 ms (5%) |           | 149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 520.941 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 271.526 ms (5%) |           |   1.02 MiB (1%) |       18905 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 259.996 ms (5%) |           | 525.83 KiB (1%) |        9553 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 276.655 ms (5%) |           | 267.11 KiB (1%) |        4872 |
| `["findfirst", "n=500", "foldl"]`                   |  85.979 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  45.493 ms (5%) |           | 157.17 KiB (1%) |        2840 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  44.726 ms (5%) |           |  84.41 KiB (1%) |        1528 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  48.150 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 165.207 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 163.507 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 271.411 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.338 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.834 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.404 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.428 ms (5%) |           |   1.22 MiB (1%) |         256 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.927 ms (5%) |           |   1.03 MiB (1%) |        3810 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.812 ms (5%) |           |   1.26 MiB (1%) |        2845 |
| `["parallel_histogram", "seq"]`                     |   7.613 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  15.939 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.338 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.935 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.230 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  15.293 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.035 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.994 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.231 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.874 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.323 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.188 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.145 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  36.598 ms (5%) |  6.420 ms |  64.11 MiB (1%) |     2075142 |
| `["words", "nthreads=2"]`                           |  19.713 ms (5%) |           |  64.47 MiB (1%) |     2075219 |
| `["words", "nthreads=4"]`                           |  21.903 ms (5%) |           |  65.37 MiB (1%) |     2075515 |

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
       #1  2095 MHz      50188 s          0 s       2376 s      17986 s          0 s
       #2  2095 MHz      49474 s          0 s       2406 s      18201 s          0 s
       
  Memory: 6.764884948730469 GB (3121.73046875 MB free)
  Uptime: 724.0 sec
  Load Avg:  1.759765625  1.54443359375  0.92724609375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 2:39
* Package commit: 391f3f
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
| `["collect", "assoc", "basesize=1"]`                | 357.219 ms (5%) | 12.516 ms |  87.55 MiB (1%) |     1590774 |
| `["collect", "assoc", "basesize=1024"]`             | 216.485 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 234.055 ms (5%) |           |   5.64 MiB (1%) |       54020 |
| `["collect", "seq"]`                                | 447.993 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 472.290 ms (5%) |  7.437 ms |  29.17 MiB (1%) |      403811 |
| `["collect", "unordered", "basesize=1024"]`         | 326.240 ms (5%) |           | 786.22 KiB (1%) |        3365 |
| `["collect", "unordered", "basesize=32"]`           | 260.030 ms (5%) |           |   1.47 MiB (1%) |       16760 |
| `["findfirst", "n=1000", "foldl"]`                  | 710.718 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 367.050 ms (5%) |           | 563.91 KiB (1%) |       10221 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 371.459 ms (5%) |           | 287.19 KiB (1%) |        5222 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 365.365 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 521.211 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 273.374 ms (5%) |           |   1.02 MiB (1%) |       18888 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 270.181 ms (5%) |           | 526.02 KiB (1%) |        9565 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 266.319 ms (5%) |           | 267.09 KiB (1%) |        4871 |
| `["findfirst", "n=500", "foldl"]`                   |  86.331 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  46.292 ms (5%) |           | 157.16 KiB (1%) |        2839 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  44.854 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  48.237 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 156.416 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 160.117 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 291.629 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.326 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.752 ms (5%) |           |   1.80 MiB (1%) |         494 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.540 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.813 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.816 ms (5%) |           |   1.05 MiB (1%) |        4883 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.341 ms (5%) |           |   1.24 MiB (1%) |        1517 |
| `["parallel_histogram", "seq"]`                     |   7.666 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.039 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.571 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.845 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.282 ms (5%) |           |  76.31 KiB (1%) |        1488 |
| `["sum", "uniform", "foldl"]`                       |  15.752 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.464 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.225 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.913 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.105 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.049 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.412 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.111 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  37.304 ms (5%) |  6.479 ms |  65.17 MiB (1%) |     2108567 |
| `["words", "nthreads=2"]`                           |  21.193 ms (5%) |           |  65.89 MiB (1%) |     2108722 |
| `["words", "nthreads=4"]`                           |  22.000 ms (5%) |           |  66.34 MiB (1%) |     2108869 |

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
       #1  2095 MHz      70392 s          0 s       2968 s      25447 s          0 s
       #2  2095 MHz      73254 s          0 s       2883 s      22279 s          0 s
       
  Memory: 6.764884948730469 GB (3170.04296875 MB free)
  Uptime: 1010.0 sec
  Load Avg:  1.67724609375  1.56787109375  1.10009765625
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

