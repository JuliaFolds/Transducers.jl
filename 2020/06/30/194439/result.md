# Multi-thread benchmark result

* Target commit: [`bf4e05e020e38274afa5e97f1676df2c8fb150a5`](https://github.com/JuliaFolds/Transducers.jl/commit/bf4e05e020e38274afa5e97f1676df2c8fb150a5)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 30 Jun 2020 - 19:39
    - Baseline: 30 Jun 2020 - 19:44
* Package commits:
    - Target: 806d3c
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
| `["collect", "unordered", "basesize=1024"]`         |                1.09 (5%) :x: |                1.05 (1%) :x: |
| `["findfirst", "n=400", "foldl"]`                   |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |                1.10 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                   0.99 (5%)  | 0.87 (1%) :white_check_mark: |
| `["parallel_histogram", "assoc", "basesize=8192"]`  | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 0.91 (5%) :white_check_mark: | 0.97 (1%) :white_check_mark: |
| `["sum", "random", "foldl"]`                        |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=256"]`       |                1.05 (5%) :x: |                   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=512"]`       |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=256"]`      |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=512"]`      |                1.20 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           |                1.05 (5%) :x: |                   0.99 (1%)  |

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
       #1  2095 MHz      51026 s          0 s       2209 s      14237 s          0 s
       #2  2095 MHz      46523 s          0 s       2386 s      19109 s          0 s
       
  Memory: 6.764884948730469 GB (3147.890625 MB free)
  Uptime: 697.0 sec
  Load Avg:  1.74755859375  1.55224609375  0.9287109375
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
       #1  2095 MHz      72428 s          0 s       2662 s      20041 s          0 s
       #2  2095 MHz      68689 s          0 s       2859 s      24290 s          0 s
       
  Memory: 6.764884948730469 GB (3158.56640625 MB free)
  Uptime: 977.0 sec
  Load Avg:  1.67431640625  1.60546875  1.115234375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 19:39
* Package commit: 806d3c
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
| `["collect", "assoc", "basesize=1"]`                | 323.361 ms (5%) | 9.697 ms |  87.55 MiB (1%) |     1590769 |
| `["collect", "assoc", "basesize=1024"]`             | 194.079 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 198.368 ms (5%) |          |   5.64 MiB (1%) |       54013 |
| `["collect", "seq"]`                                | 387.450 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 414.388 ms (5%) |          |  29.17 MiB (1%) |      403757 |
| `["collect", "unordered", "basesize=1024"]`         | 260.808 ms (5%) |          | 805.14 KiB (1%) |        4621 |
| `["collect", "unordered", "basesize=32"]`           | 224.952 ms (5%) |          |   1.47 MiB (1%) |       16656 |
| `["findfirst", "n=1000", "foldl"]`                  | 615.598 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 311.511 ms (5%) |          | 563.25 KiB (1%) |       10179 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 315.776 ms (5%) |          | 287.05 KiB (1%) |        5213 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 325.505 ms (5%) |          | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 461.878 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 240.203 ms (5%) |          |   1.02 MiB (1%) |       18856 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 235.088 ms (5%) |          | 525.36 KiB (1%) |        9523 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 238.039 ms (5%) |          | 266.81 KiB (1%) |        4853 |
| `["findfirst", "n=500", "foldl"]`                   |  76.786 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.820 ms (5%) |          | 157.14 KiB (1%) |        2838 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  39.969 ms (5%) |          |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  41.979 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 157.810 μs (5%) |          | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 153.010 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 255.917 μs (5%) |          | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.727 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.289 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.006 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.891 ms (5%) |          |   1.22 MiB (1%) |         303 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.595 ms (5%) |          |   1.06 MiB (1%) |        5726 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  16.939 ms (5%) |          |   1.23 MiB (1%) |         742 |
| `["parallel_histogram", "seq"]`                     |   6.812 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  15.014 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.304 ms (5%) |          | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.242 ms (5%) |          | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.154 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  13.942 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   6.843 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.747 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.911 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  13.942 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.385 ms (5%) |          | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.293 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   6.828 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  31.685 ms (5%) | 6.290 ms |  64.27 MiB (1%) |     2079629 |
| `["words", "nthreads=2"]`                           |  18.994 ms (5%) |          |  64.99 MiB (1%) |     2079782 |
| `["words", "nthreads=4"]`                           |  19.172 ms (5%) |          |  65.62 MiB (1%) |     2080074 |

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
       #1  2095 MHz      51026 s          0 s       2209 s      14237 s          0 s
       #2  2095 MHz      46523 s          0 s       2386 s      19109 s          0 s
       
  Memory: 6.764884948730469 GB (3147.890625 MB free)
  Uptime: 697.0 sec
  Load Avg:  1.74755859375  1.55224609375  0.9287109375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 30 Jun 2020 - 19:44
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

| ID                                                  | time            | GC time  | memory          | allocations |
|-----------------------------------------------------|----------------:|---------:|----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 309.853 ms (5%) | 9.220 ms |  87.55 MiB (1%) |     1590779 |
| `["collect", "assoc", "basesize=1024"]`             | 195.487 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 196.774 ms (5%) |          |   5.64 MiB (1%) |       54009 |
| `["collect", "seq"]`                                | 372.827 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 415.888 ms (5%) |          |  29.16 MiB (1%) |      403253 |
| `["collect", "unordered", "basesize=1024"]`         | 239.105 ms (5%) |          | 768.13 KiB (1%) |        2207 |
| `["collect", "unordered", "basesize=32"]`           | 218.195 ms (5%) |          |   1.47 MiB (1%) |       16608 |
| `["findfirst", "n=1000", "foldl"]`                  | 601.495 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 308.634 ms (5%) |          | 563.30 KiB (1%) |       10182 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 305.266 ms (5%) |          | 286.84 KiB (1%) |        5200 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 320.631 ms (5%) |          | 149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 437.599 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 230.597 ms (5%) |          |   1.02 MiB (1%) |       18857 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 231.396 ms (5%) |          | 525.34 KiB (1%) |        9522 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 230.356 ms (5%) |          | 266.86 KiB (1%) |        4856 |
| `["findfirst", "n=500", "foldl"]`                   |  74.019 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  38.937 ms (5%) |          | 157.11 KiB (1%) |        2836 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  38.969 ms (5%) |          |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  41.967 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 153.507 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 153.907 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 252.411 μs (5%) |          | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.714 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.329 ms (5%) |          |   2.07 MiB (1%) |         501 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.221 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.981 ms (5%) |          |   1.22 MiB (1%) |         287 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.701 ms (5%) |          |   1.06 MiB (1%) |        6035 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.537 ms (5%) |          |   1.26 MiB (1%) |        2897 |
| `["parallel_histogram", "seq"]`                     |   6.747 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  13.961 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.184 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   6.891 ms (5%) |          | 155.13 KiB (1%) |        3013 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.771 ms (5%) |          |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  13.410 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.073 ms (5%) |          | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.984 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.587 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  14.078 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.464 ms (5%) |          | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.275 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.141 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  32.293 ms (5%) | 6.051 ms |  64.91 MiB (1%) |     2100502 |
| `["words", "nthreads=2"]`                           |  17.674 ms (5%) |          |  65.27 MiB (1%) |     2100578 |
| `["words", "nthreads=4"]`                           |  18.224 ms (5%) |          |  65.99 MiB (1%) |     2100733 |

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
       #1  2095 MHz      72428 s          0 s       2662 s      20041 s          0 s
       #2  2095 MHz      68689 s          0 s       2859 s      24290 s          0 s
       
  Memory: 6.764884948730469 GB (3158.56640625 MB free)
  Uptime: 977.0 sec
  Load Avg:  1.67431640625  1.60546875  1.115234375
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
    CPU MHz:             2095.229
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

