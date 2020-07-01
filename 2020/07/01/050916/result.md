# Multi-thread benchmark result

* Target commit: [`99cd934819bbac66023becd01efcfa272fd8dea8`](https://github.com/JuliaFolds/Transducers.jl/commit/99cd934819bbac66023becd01efcfa272fd8dea8)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 05:04
    - Baseline: 1 Jul 2020 - 05:08
* Package commits:
    - Target: 27bf8b
    - Baseline: 9b48d8
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
| `["collect", "unordered", "basesize=1"]`            |                1.05 (5%) :x: |    1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.27 (5%) :x: | 1.15 (1%) :x: |
| `["overhead", "default"]`                           |                1.05 (5%) :x: |    1.00 (1%)  |
| `["overhead", "stoppable=false"]`                   | 0.88 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  | 0.94 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=8192"]`  | 0.93 (5%) :white_check_mark: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                   1.04 (5%)  | 1.04 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                1.10 (5%) :x: | 1.01 (1%) :x: |
| `["sum", "valley", "foldl"]`                        |                1.06 (5%) :x: |    1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=256"]`       | 0.91 (5%) :white_check_mark: |    1.00 (1%)  |
| `["words", "nthreads=1"]`                           |                1.12 (5%) :x: |    1.01 (1%)  |
| `["words", "nthreads=2"]`                           |                1.14 (5%) :x: | 1.01 (1%) :x: |
| `["words", "nthreads=4"]`                           |                1.07 (5%) :x: |    1.01 (1%)  |

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
       #1  2095 MHz      43290 s          0 s       2306 s      30330 s          0 s
       #2  2095 MHz      56804 s          0 s       2692 s      17605 s          0 s
       
  Memory: 6.764884948730469 GB (3111.96484375 MB free)
  Uptime: 785.0 sec
  Load Avg:  1.79345703125  1.55810546875  0.923828125
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
       #1  2095 MHz      65886 s          0 s       2854 s      36137 s          0 s
       #2  2095 MHz      78870 s          0 s       3216 s      23853 s          0 s
       
  Memory: 6.764884948730469 GB (3162.203125 MB free)
  Uptime: 1077.0 sec
  Load Avg:  1.67578125  1.61962890625  1.1220703125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:4
* Package commit: 27bf8b
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
| `["collect", "assoc", "basesize=1"]`                | 376.205 ms (5%) | 10.728 ms |  87.55 MiB (1%) |     1590755 |
| `["collect", "assoc", "basesize=1024"]`             | 241.950 ms (5%) |           |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 246.859 ms (5%) |           |   5.64 MiB (1%) |       54013 |
| `["collect", "seq"]`                                | 480.403 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 478.129 ms (5%) |           |  29.15 MiB (1%) |      402771 |
| `["collect", "unordered", "basesize=1024"]`         | 370.423 ms (5%) |           | 935.11 KiB (1%) |       12939 |
| `["collect", "unordered", "basesize=32"]`           | 269.947 ms (5%) |           |   1.46 MiB (1%) |       16241 |
| `["findfirst", "n=1000", "foldl"]`                  | 756.127 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 379.071 ms (5%) |           | 564.06 KiB (1%) |       10231 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 370.266 ms (5%) |           | 287.20 KiB (1%) |        5223 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 385.753 ms (5%) |           | 149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 560.048 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 289.108 ms (5%) |           |   1.02 MiB (1%) |       18965 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 283.837 ms (5%) |           | 526.23 KiB (1%) |        9579 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 284.622 ms (5%) |           | 267.14 KiB (1%) |        4874 |
| `["findfirst", "n=500", "foldl"]`                   |  96.484 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.846 ms (5%) |           | 157.39 KiB (1%) |        2854 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  49.626 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  52.159 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 203.608 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 172.407 μs (5%) |           | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=true"]`                    | 340.514 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.049 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.554 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.052 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  16.255 ms (5%) |           |   1.22 MiB (1%) |         226 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  25.405 ms (5%) |           |   1.07 MiB (1%) |        4941 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  21.977 ms (5%) |           |   1.27 MiB (1%) |        3237 |
| `["parallel_histogram", "seq"]`                     |   9.485 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.360 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.788 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.316 ms (5%) |           | 155.11 KiB (1%) |        3012 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.356 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  18.332 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.660 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.420 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.434 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  18.857 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.883 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.090 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.600 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  40.670 ms (5%) |  7.517 ms |  65.25 MiB (1%) |     2110935 |
| `["words", "nthreads=2"]`                           |  24.063 ms (5%) |           |  65.97 MiB (1%) |     2111089 |
| `["words", "nthreads=4"]`                           |  24.406 ms (5%) |           |  66.42 MiB (1%) |     2111237 |

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
       #1  2095 MHz      43290 s          0 s       2306 s      30330 s          0 s
       #2  2095 MHz      56804 s          0 s       2692 s      17605 s          0 s
       
  Memory: 6.764884948730469 GB (3111.96484375 MB free)
  Uptime: 785.0 sec
  Load Avg:  1.79345703125  1.55810546875  0.923828125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:8
* Package commit: 9b48d8
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
| `["collect", "assoc", "basesize=1"]`                | 381.883 ms (5%) | 12.172 ms |  87.55 MiB (1%) |     1590725 |
| `["collect", "assoc", "basesize=1024"]`             | 237.634 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 245.447 ms (5%) |           |   5.64 MiB (1%) |       54017 |
| `["collect", "seq"]`                                | 475.156 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 454.482 ms (5%) |           |  29.15 MiB (1%) |      402362 |
| `["collect", "unordered", "basesize=1024"]`         | 291.166 ms (5%) |           | 815.52 KiB (1%) |        5240 |
| `["collect", "unordered", "basesize=32"]`           | 268.365 ms (5%) |           |   1.47 MiB (1%) |       16505 |
| `["findfirst", "n=1000", "foldl"]`                  | 727.585 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 379.357 ms (5%) |           | 564.09 KiB (1%) |       10233 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 379.281 ms (5%) |           | 287.17 KiB (1%) |        5221 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 379.006 ms (5%) |           | 149.27 KiB (1%) |        2722 |
| `["findfirst", "n=400", "foldl"]`                   | 561.621 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 285.052 ms (5%) |           |   1.02 MiB (1%) |       18968 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 283.767 ms (5%) |           | 526.11 KiB (1%) |        9571 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 283.611 ms (5%) |           | 267.22 KiB (1%) |        4879 |
| `["findfirst", "n=500", "foldl"]`                   |  96.238 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  49.683 ms (5%) |           | 157.39 KiB (1%) |        2854 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  49.569 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  51.965 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 193.813 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 195.614 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 345.024 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   5.301 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.907 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.438 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  16.345 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.399 ms (5%) |           |   1.03 MiB (1%) |        1315 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.036 ms (5%) |           |   1.25 MiB (1%) |        2278 |
| `["parallel_histogram", "seq"]`                     |   9.078 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  18.110 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |  10.068 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.741 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.227 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "uniform", "foldl"]`                       |  18.132 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.395 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   9.036 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   9.195 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  17.839 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.859 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.971 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.362 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  36.391 ms (5%) |  6.614 ms |  64.79 MiB (1%) |     2096648 |
| `["words", "nthreads=2"]`                           |  21.128 ms (5%) |           |  65.14 MiB (1%) |     2096725 |
| `["words", "nthreads=4"]`                           |  22.870 ms (5%) |           |  66.05 MiB (1%) |     2097023 |

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
       #1  2095 MHz      65886 s          0 s       2854 s      36137 s          0 s
       #2  2095 MHz      78870 s          0 s       3216 s      23853 s          0 s
       
  Memory: 6.764884948730469 GB (3162.203125 MB free)
  Uptime: 1077.0 sec
  Load Avg:  1.67578125  1.61962890625  1.1220703125
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
    CPU MHz:             2095.158
    BogoMIPS:            4190.31
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

