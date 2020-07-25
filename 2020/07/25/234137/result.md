# Multi-thread benchmark result

* Pull request commit: [`a7311fa7b3bafdb650315b52465e2ea9de1ebea3`](https://github.com/JuliaFolds/Transducers.jl/commit/a7311fa7b3bafdb650315b52465e2ea9de1ebea3)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/371> (Modernize missing value tutorial)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 25 Jul 2020 - 23:36
    - Baseline: 25 Jul 2020 - 23:41
* Package commits:
    - Target: 69a79a
    - Baseline: 525658
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
| `["collect", "seq"]`                                | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.10 (5%) :x: |                1.06 (1%) :x: |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=400", "foldl"]`                   |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=16384"]` |                1.17 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.88 (5%) :white_check_mark: | 0.97 (1%) :white_check_mark: |
| `["sum", "valley", "reduce", "basesize=128"]`       |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=256"]`       |                1.12 (5%) :x: |                   1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=512"]`       |                1.13 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           |                   1.02 (5%)  |                1.02 (1%) :x: |
| `["words", "nthreads=4"]`                           |                1.06 (5%) :x: |                1.02 (1%) :x: |

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
       #1  2095 MHz      52388 s          0 s       2243 s      13504 s          0 s
       #2  2095 MHz      45326 s          0 s       2475 s      20299 s          0 s
       
  Memory: 6.764884948730469 GB (2960.5859375 MB free)
  Uptime: 701.0 sec
  Load Avg:  1.671875  1.533203125  0.9189453125
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
       #1  2095 MHz      74972 s          0 s       2652 s      19541 s          0 s
       #2  2095 MHz      67633 s          0 s       2961 s      26351 s          0 s
       
  Memory: 6.764884948730469 GB (2939.69921875 MB free)
  Uptime: 992.0 sec
  Load Avg:  1.60546875  1.556640625  1.0947265625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 23:36
* Package commit: 69a79a
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
| `["collect", "assoc", "basesize=1"]`                | 327.018 ms (5%) | 14.333 ms |  87.55 MiB (1%) |     1590793 |
| `["collect", "assoc", "basesize=1024"]`             | 212.766 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 212.401 ms (5%) |           |   5.64 MiB (1%) |       54017 |
| `["collect", "seq"]`                                | 394.614 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 410.183 ms (5%) |           |  29.14 MiB (1%) |      402115 |
| `["collect", "unordered", "basesize=1024"]`         | 273.313 ms (5%) |           | 825.81 KiB (1%) |        5899 |
| `["collect", "unordered", "basesize=32"]`           | 232.725 ms (5%) |           |   1.47 MiB (1%) |       16421 |
| `["findfirst", "n=1000", "foldl"]`                  | 611.300 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 330.683 ms (5%) |           | 563.20 KiB (1%) |       10176 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 339.646 ms (5%) |           | 287.02 KiB (1%) |        5211 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 343.247 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 488.005 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 239.086 ms (5%) |           |   1.02 MiB (1%) |       18860 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 246.555 ms (5%) |           | 525.28 KiB (1%) |        9518 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 252.465 ms (5%) |           | 266.88 KiB (1%) |        4857 |
| `["findfirst", "n=500", "foldl"]`                   |  77.190 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.220 ms (5%) |           | 157.14 KiB (1%) |        2838 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  40.715 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  42.030 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 168.102 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 163.402 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 314.103 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.308 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.002 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.209 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.195 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.184 ms (5%) |           |   1.03 MiB (1%) |        3943 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.746 ms (5%) |           |   1.26 MiB (1%) |        3057 |
| `["parallel_histogram", "seq"]`                     |   7.130 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.376 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.562 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.259 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.735 ms (5%) |           |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  14.241 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.064 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.785 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.812 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.317 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.353 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.162 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.061 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  39.994 ms (5%) |  6.900 ms |  63.72 MiB (1%) |     2082547 |
| `["words", "nthreads=2"]`                           |  20.698 ms (5%) |           |  64.81 MiB (1%) |     2094811 |
| `["words", "nthreads=4"]`                           |  22.491 ms (5%) |           |  65.76 MiB (1%) |     2105236 |

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
       #1  2095 MHz      52388 s          0 s       2243 s      13504 s          0 s
       #2  2095 MHz      45326 s          0 s       2475 s      20299 s          0 s
       
  Memory: 6.764884948730469 GB (2960.5859375 MB free)
  Uptime: 701.0 sec
  Load Avg:  1.671875  1.533203125  0.9189453125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 25 Jul 2020 - 23:41
* Package commit: 525658
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
| `["collect", "assoc", "basesize=1"]`                | 334.801 ms (5%) | 10.924 ms |  87.55 MiB (1%) |     1590740 |
| `["collect", "assoc", "basesize=1024"]`             | 210.210 ms (5%) |           |   1.84 MiB (1%) |        1813 |
| `["collect", "assoc", "basesize=32"]`               | 216.306 ms (5%) |           |   5.64 MiB (1%) |       54017 |
| `["collect", "seq"]`                                | 416.760 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 407.984 ms (5%) |           |  29.14 MiB (1%) |      401723 |
| `["collect", "unordered", "basesize=1024"]`         | 247.847 ms (5%) |           | 779.63 KiB (1%) |        2607 |
| `["collect", "unordered", "basesize=32"]`           | 242.091 ms (5%) |           |   1.46 MiB (1%) |       15991 |
| `["findfirst", "n=1000", "foldl"]`                  | 609.458 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 322.354 ms (5%) |           | 563.22 KiB (1%) |       10177 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 320.765 ms (5%) |           | 286.92 KiB (1%) |        5205 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 327.148 ms (5%) |           | 149.17 KiB (1%) |        2716 |
| `["findfirst", "n=400", "foldl"]`                   | 462.086 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 252.544 ms (5%) |           |   1.02 MiB (1%) |       18880 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 237.226 ms (5%) |           | 525.45 KiB (1%) |        9529 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 241.174 ms (5%) |           | 266.84 KiB (1%) |        4855 |
| `["findfirst", "n=500", "foldl"]`                   |  78.631 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  43.209 ms (5%) |           | 157.13 KiB (1%) |        2837 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.496 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  45.150 ms (5%) |           |  48.16 KiB (1%) |         873 |
| `["overhead", "default"]`                           | 160.502 μs (5%) |           | 146.13 KiB (1%) |        2627 |
| `["overhead", "stoppable=false"]`                   | 158.802 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 300.102 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.695 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.656 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.074 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.409 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.980 ms (5%) |           |   1.07 MiB (1%) |        6217 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.057 ms (5%) |           |   1.27 MiB (1%) |        3134 |
| `["parallel_histogram", "seq"]`                     |   6.870 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  16.133 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.439 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.241 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.033 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  14.351 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.980 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.757 ms (5%) |           | 155.14 KiB (1%) |        3014 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.672 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  14.928 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.482 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.298 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.116 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  39.226 ms (5%) |  6.573 ms |  63.13 MiB (1%) |     2062524 |
| `["words", "nthreads=2"]`                           |  20.342 ms (5%) |           |  63.74 MiB (1%) |     2070653 |
| `["words", "nthreads=4"]`                           |  21.277 ms (5%) |           |  64.70 MiB (1%) |     2078956 |

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
       #1  2095 MHz      74972 s          0 s       2652 s      19541 s          0 s
       #2  2095 MHz      67633 s          0 s       2961 s      26351 s          0 s
       
  Memory: 6.764884948730469 GB (2939.69921875 MB free)
  Uptime: 992.0 sec
  Load Avg:  1.60546875  1.556640625  1.0947265625
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
    CPU MHz:             2095.078
    BogoMIPS:            4190.15
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

