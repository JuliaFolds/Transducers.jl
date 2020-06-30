# Multi-thread benchmark result

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 30 Jun 2020 - 08:11
    - Baseline: 30 Jun 2020 - 08:16
* Package commits:
    - Target: e3a36a
    - Baseline: 8ccb58
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
| `["collect", "unordered", "basesize=1024"]`         | 0.91 (5%) :white_check_mark: | 0.90 (1%) :white_check_mark: |
| `["findfirst", "n=1000", "foldl"]`                  |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=400", "foldl"]`                   |                1.38 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  |                1.26 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  |                1.26 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  |                1.35 (5%) :x: |                   1.00 (1%)  |
| `["overhead", "stoppable=true"]`                    |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.17 (5%) :x: |                1.06 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=128"]`       |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=512"]`      |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=1"]`                           |                1.19 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           | 0.93 (5%) :white_check_mark: |                   0.99 (1%)  |

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
       #1  2294 MHz      55030 s          0 s       2690 s      17840 s          0 s
       #2  2294 MHz      49988 s          0 s       2822 s      22586 s          0 s
       
  Memory: 6.764884948730469 GB (3068.26171875 MB free)
  Uptime: 774.0 sec
  Load Avg:  1.78857421875  1.57861328125  0.9755859375
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
       #1  2294 MHz      79234 s          0 s       3274 s      21655 s          0 s
       #2  2294 MHz      70144 s          0 s       3437 s      30455 s          0 s
       
  Memory: 6.764884948730469 GB (3143.24609375 MB free)
  Uptime: 1062.0 sec
  Load Avg:  1.59814453125  1.5849609375  1.14013671875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 8:11
* Package commit: e3a36a
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
| `["collect", "assoc", "basesize=1"]`                | 317.052 ms (5%) | 13.390 ms |  87.55 MiB (1%) |     1590680 |
| `["collect", "assoc", "basesize=1024"]`             | 166.025 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 168.566 ms (5%) |           |   5.64 MiB (1%) |       54021 |
| `["collect", "seq"]`                                | 314.751 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 460.769 ms (5%) | 19.680 ms |  29.19 MiB (1%) |      405467 |
| `["collect", "unordered", "basesize=1024"]`         | 235.332 ms (5%) |           | 810.95 KiB (1%) |        4993 |
| `["collect", "unordered", "basesize=32"]`           | 207.691 ms (5%) |           |   1.50 MiB (1%) |       18740 |
| `["findfirst", "n=1000", "foldl"]`                  | 588.952 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 273.818 ms (5%) |           | 563.89 KiB (1%) |       10220 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 270.908 ms (5%) |           | 287.16 KiB (1%) |        5220 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 285.490 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 540.403 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 266.161 ms (5%) |           |   1.02 MiB (1%) |       18972 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 265.111 ms (5%) |           | 526.16 KiB (1%) |        9574 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 275.251 ms (5%) |           | 267.19 KiB (1%) |        4877 |
| `["findfirst", "n=500", "foldl"]`                   |  64.111 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  34.345 ms (5%) |           | 157.39 KiB (1%) |        2854 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  33.601 ms (5%) |           |  84.47 KiB (1%) |        1532 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  35.165 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 183.700 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 183.400 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 339.900 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.647 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.113 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   3.968 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.172 ms (5%) |           |   1.22 MiB (1%) |         297 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.540 ms (5%) |           |   1.06 MiB (1%) |        5607 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.836 ms (5%) |           |   1.23 MiB (1%) |         652 |
| `["parallel_histogram", "seq"]`                     |   6.301 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.819 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.733 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.164 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.133 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  11.523 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.319 ms (5%) |           | 313.30 KiB (1%) |        6065 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.289 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.536 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  12.150 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.482 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.634 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.324 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  40.761 ms (5%) |  7.327 ms |  64.69 MiB (1%) |     2093116 |
| `["words", "nthreads=2"]`                           |  19.013 ms (5%) |           |  65.05 MiB (1%) |     2093192 |
| `["words", "nthreads=4"]`                           |  21.170 ms (5%) |           |  65.95 MiB (1%) |     2093490 |

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
       #1  2294 MHz      55030 s          0 s       2690 s      17840 s          0 s
       #2  2294 MHz      49988 s          0 s       2822 s      22586 s          0 s
       
  Memory: 6.764884948730469 GB (3068.26171875 MB free)
  Uptime: 774.0 sec
  Load Avg:  1.78857421875  1.57861328125  0.9755859375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 8:16
* Package commit: 8ccb58
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
| `["collect", "assoc", "basesize=1"]`                | 311.053 ms (5%) | 11.001 ms |   87.55 MiB (1%) |     1590699 |
| `["collect", "assoc", "basesize=1024"]`             | 173.419 ms (5%) |           |    1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 171.169 ms (5%) |           |    5.64 MiB (1%) |       54015 |
| `["collect", "seq"]`                                | 315.087 ms (5%) |           |    1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 455.554 ms (5%) |           |   29.19 MiB (1%) |      405203 |
| `["collect", "unordered", "basesize=1024"]`         | 257.951 ms (5%) |           |  905.30 KiB (1%) |       11031 |
| `["collect", "unordered", "basesize=32"]`           | 208.010 ms (5%) |           |    1.50 MiB (1%) |       18967 |
| `["findfirst", "n=1000", "foldl"]`                  | 539.299 ms (5%) |           |                  |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 278.822 ms (5%) |           |  563.98 KiB (1%) |       10226 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 274.391 ms (5%) |           |  287.23 KiB (1%) |        5225 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 280.936 ms (5%) |           |  149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 392.921 ms (5%) |           |                  |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 211.489 ms (5%) |           |    1.02 MiB (1%) |       18970 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 209.885 ms (5%) |           |  525.97 KiB (1%) |        9562 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 204.420 ms (5%) |           |  267.05 KiB (1%) |        4868 |
| `["findfirst", "n=500", "foldl"]`                   |  64.995 ms (5%) |           |                  |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  33.648 ms (5%) |           |  157.34 KiB (1%) |        2851 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  33.306 ms (5%) |           |   84.44 KiB (1%) |        1530 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  34.983 ms (5%) |           |   48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 178.401 μs (5%) |           |  146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 177.000 μs (5%) |           |  146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 303.901 μs (5%) |           |  146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.545 ms (5%) |           |  732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.128 ms (5%) |           |    1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.003 ms (5%) |           |    1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.945 ms (5%) |           |    1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.209 ms (5%) |           | 1021.25 KiB (1%) |        1725 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.783 ms (5%) |           |    1.23 MiB (1%) |        1021 |
| `["parallel_histogram", "seq"]`                     |   6.259 ms (5%) |           |  364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  11.930 ms (5%) |           |                  |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   6.391 ms (5%) |           |  313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.356 ms (5%) |           |  155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.043 ms (5%) |           |   76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  11.337 ms (5%) |           |                  |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.201 ms (5%) |           |  313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.224 ms (5%) |           |  155.05 KiB (1%) |        3008 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.052 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  11.871 ms (5%) |           |                  |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   6.508 ms (5%) |           |  313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   6.339 ms (5%) |           |  155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.219 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  34.246 ms (5%) |  7.046 ms |   64.82 MiB (1%) |     2097677 |
| `["words", "nthreads=2"]`                           |  20.507 ms (5%) |           |   65.54 MiB (1%) |     2097832 |
| `["words", "nthreads=4"]`                           |  22.216 ms (5%) |           |   65.99 MiB (1%) |     2097981 |

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
       #1  2294 MHz      79234 s          0 s       3274 s      21655 s          0 s
       #2  2294 MHz      70144 s          0 s       3437 s      30455 s          0 s
       
  Memory: 6.764884948730469 GB (3143.24609375 MB free)
  Uptime: 1062.0 sec
  Load Avg:  1.59814453125  1.5849609375  1.14013671875
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
    CPU MHz:             2294.687
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

