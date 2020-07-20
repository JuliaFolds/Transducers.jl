# Multi-thread benchmark result

* Pull request commit: [`a3bc972f5610e762853103223bf4e23bdeac7d14`](https://github.com/JuliaFolds/Transducers.jl/commit/a3bc972f5610e762853103223bf4e23bdeac7d14)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/367> (Update to Documenter 0.25.1)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 20 Jul 2020 - 23:20
    - Baseline: 20 Jul 2020 - 23:24
* Package commits:
    - Target: 69310d
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
| `["collect", "unordered", "basesize=1024"]`         |                1.06 (5%) :x: | 0.97 (1%) :white_check_mark: |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "stoppable=true"]`                    | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=16384"]`  |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                   1.02 (5%)  | 0.99 (1%) :white_check_mark: |
| `["words", "nthreads=1"]`                           |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           |                1.12 (5%) :x: |                   0.99 (1%)  |

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
       #1  2095 MHz      43261 s          0 s       2139 s      21270 s          0 s
       #2  2095 MHz      54060 s          0 s       2294 s      10782 s          0 s
       
  Memory: 6.764884948730469 GB (2962.71484375 MB free)
  Uptime: 690.0 sec
  Load Avg:  1.681640625  1.50732421875  0.9140625
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
       #1  2095 MHz      63601 s          0 s       2588 s      29247 s          0 s
       #2  2095 MHz      78224 s          0 s       2734 s      14767 s          0 s
       
  Memory: 6.764884948730469 GB (3002.12890625 MB free)
  Uptime: 979.0 sec
  Load Avg:  1.76220703125  1.60693359375  1.1142578125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 20 Jul 2020 - 23:20
* Package commit: 69310d
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
| `["collect", "assoc", "basesize=1"]`                | 327.500 ms (5%) | 13.122 ms |  87.55 MiB (1%) |     1590760 |
| `["collect", "assoc", "basesize=1024"]`             | 200.176 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 203.217 ms (5%) |           |   5.64 MiB (1%) |       54015 |
| `["collect", "seq"]`                                | 373.946 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 434.992 ms (5%) |           |  29.17 MiB (1%) |      403859 |
| `["collect", "unordered", "basesize=1024"]`         | 259.967 ms (5%) |           | 755.14 KiB (1%) |        1421 |
| `["collect", "unordered", "basesize=32"]`           | 226.862 ms (5%) |           |   1.47 MiB (1%) |       16932 |
| `["findfirst", "n=1000", "foldl"]`                  | 594.453 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 304.965 ms (5%) |           | 563.48 KiB (1%) |       10194 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 304.520 ms (5%) |           | 286.94 KiB (1%) |        5206 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 309.559 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 438.296 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 242.225 ms (5%) |           |   1.02 MiB (1%) |       18859 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 242.592 ms (5%) |           | 525.64 KiB (1%) |        9541 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 242.238 ms (5%) |           | 266.84 KiB (1%) |        4855 |
| `["findfirst", "n=500", "foldl"]`                   |  72.442 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  40.222 ms (5%) |           | 157.13 KiB (1%) |        2837 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  40.022 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  39.963 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 160.410 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 158.909 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=true"]`                    | 265.216 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.718 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.257 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.988 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.697 ms (5%) |           |   1.22 MiB (1%) |         347 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.746 ms (5%) |           |   1.08 MiB (1%) |        6541 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.931 ms (5%) |           |   1.25 MiB (1%) |        2255 |
| `["parallel_histogram", "seq"]`                     |   6.758 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  13.840 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.357 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.140 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.982 ms (5%) |           |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  13.218 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.823 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.679 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.598 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  13.658 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.256 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.922 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.885 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  42.401 ms (5%) |  6.846 ms |  63.33 MiB (1%) |     2069105 |
| `["words", "nthreads=2"]`                           |  22.283 ms (5%) |           |  64.41 MiB (1%) |     2081371 |
| `["words", "nthreads=4"]`                           |  23.674 ms (5%) |           |  65.05 MiB (1%) |     2087595 |

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
       #1  2095 MHz      43261 s          0 s       2139 s      21270 s          0 s
       #2  2095 MHz      54060 s          0 s       2294 s      10782 s          0 s
       
  Memory: 6.764884948730469 GB (2962.71484375 MB free)
  Uptime: 690.0 sec
  Load Avg:  1.681640625  1.50732421875  0.9140625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 20 Jul 2020 - 23:24
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
| `["collect", "assoc", "basesize=1"]`                | 328.483 ms (5%) | 11.412 ms |  87.55 MiB (1%) |     1590775 |
| `["collect", "assoc", "basesize=1024"]`             | 207.832 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 204.375 ms (5%) |           |   5.64 MiB (1%) |       54020 |
| `["collect", "seq"]`                                | 364.652 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 438.000 ms (5%) |           |  29.16 MiB (1%) |      403350 |
| `["collect", "unordered", "basesize=1024"]`         | 244.680 ms (5%) |           | 777.50 KiB (1%) |        2471 |
| `["collect", "unordered", "basesize=32"]`           | 225.277 ms (5%) |           |   1.47 MiB (1%) |       16747 |
| `["findfirst", "n=1000", "foldl"]`                  | 591.109 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 303.317 ms (5%) |           | 563.36 KiB (1%) |       10186 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 306.799 ms (5%) |           | 286.98 KiB (1%) |        5209 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 314.001 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 439.467 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 236.999 ms (5%) |           |   1.02 MiB (1%) |       18862 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 222.008 ms (5%) |           | 525.27 KiB (1%) |        9517 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 232.150 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  71.619 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  37.922 ms (5%) |           | 157.13 KiB (1%) |        2837 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  39.197 ms (5%) |           |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  42.649 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 154.207 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 160.807 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 282.612 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.719 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.244 ms (5%) |           |   1.80 MiB (1%) |         496 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.982 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.759 ms (5%) |           |   1.22 MiB (1%) |         158 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.936 ms (5%) |           |   1.08 MiB (1%) |        4977 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.599 ms (5%) |           |   1.27 MiB (1%) |        3303 |
| `["parallel_histogram", "seq"]`                     |   6.756 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  13.821 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.152 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.966 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.926 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "uniform", "foldl"]`                       |  13.435 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.901 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.838 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.609 ms (5%) |           |  76.23 KiB (1%) |        1483 |
| `["sum", "valley", "foldl"]`                        |  13.752 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.084 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.993 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.870 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  38.229 ms (5%) |  5.881 ms |  63.57 MiB (1%) |     2077329 |
| `["words", "nthreads=2"]`                           |  21.305 ms (5%) |           |  64.65 MiB (1%) |     2089600 |
| `["words", "nthreads=4"]`                           |  21.102 ms (5%) |           |  65.60 MiB (1%) |     2100010 |

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
       #1  2095 MHz      63601 s          0 s       2588 s      29247 s          0 s
       #2  2095 MHz      78224 s          0 s       2734 s      14767 s          0 s
       
  Memory: 6.764884948730469 GB (3002.12890625 MB free)
  Uptime: 979.0 sec
  Load Avg:  1.76220703125  1.60693359375  1.1142578125
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
    CPU MHz:             2095.197
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

