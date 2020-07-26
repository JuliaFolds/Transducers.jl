# Multi-thread benchmark result

* Pull request commit: [`116d61f50741c968c7042fd947fed28a9e082876`](https://github.com/JuliaFolds/Transducers.jl/commit/116d61f50741c968c7042fd947fed28a9e082876)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/371> (Modernize missing value tutorial)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 26 Jul 2020 - 00:36
    - Baseline: 26 Jul 2020 - 00:41
* Package commits:
    - Target: 878c9d
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
| `["collect", "assoc", "basesize=1024"]`             | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "assoc", "basesize=32"]`               | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "seq"]`                                | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1"]`            | 0.90 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         |                1.21 (5%) :x: |                1.17 (1%) :x: |
| `["collect", "unordered", "basesize=32"]`           | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=1000", "foldl"]`                  | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=400", "foldl"]`                   | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 0.85 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 0.82 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=500", "foldl"]`                   | 0.82 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  | 0.81 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  | 0.81 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  | 0.81 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=16384"]` | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 0.93 (5%) :white_check_mark: | 0.97 (1%) :white_check_mark: |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                   0.98 (5%)  | 0.98 (1%) :white_check_mark: |
| `["sum", "random", "foldl"]`                        | 0.78 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=128"]`       | 0.78 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=256"]`       | 0.77 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=512"]`       | 0.76 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "uniform", "foldl"]`                       | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=128"]`      | 0.79 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "uniform", "reduce", "basesize=256"]`      | 0.77 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "valley", "foldl"]`                        | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=256"]`       | 0.78 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=512"]`       | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           | 0.92 (5%) :white_check_mark: |                   0.99 (1%)  |
| `["words", "nthreads=4"]`                           | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |

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
       #1  2095 MHz      54421 s          0 s       2344 s      11950 s          0 s
       #2  2095 MHz      44462 s          0 s       2584 s      21229 s          0 s
       
  Memory: 6.764884948730469 GB (3023.58984375 MB free)
  Uptime: 707.0 sec
  Load Avg:  1.5927734375  1.49658203125  0.89208984375
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
       #1  2095 MHz      78583 s          0 s       2894 s      17144 s          0 s
       #2  2095 MHz      66104 s          0 s       3046 s      29022 s          0 s
       
  Memory: 6.764884948730469 GB (2984.9296875 MB free)
  Uptime: 1008.0 sec
  Load Avg:  1.61328125  1.5625  1.091796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 0:36
* Package commit: 878c9d
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
| `["collect", "assoc", "basesize=1"]`                | 373.104 ms (5%) | 12.260 ms |  87.55 MiB (1%) |     1590756 |
| `["collect", "assoc", "basesize=1024"]`             | 208.284 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 208.734 ms (5%) |           |   5.64 MiB (1%) |       54013 |
| `["collect", "seq"]`                                | 402.626 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 412.259 ms (5%) |           |  29.14 MiB (1%) |      401757 |
| `["collect", "unordered", "basesize=1024"]`         | 341.170 ms (5%) |           | 913.97 KiB (1%) |       11586 |
| `["collect", "unordered", "basesize=32"]`           | 225.624 ms (5%) |           |   1.46 MiB (1%) |       16278 |
| `["findfirst", "n=1000", "foldl"]`                  | 604.750 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 325.375 ms (5%) |           | 563.47 KiB (1%) |       10193 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 317.632 ms (5%) |           | 287.03 KiB (1%) |        5212 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 317.717 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 460.870 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 246.868 ms (5%) |           |   1.02 MiB (1%) |       18875 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 233.476 ms (5%) |           | 525.63 KiB (1%) |        9540 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 227.537 ms (5%) |           | 266.88 KiB (1%) |        4857 |
| `["findfirst", "n=500", "foldl"]`                   |  75.977 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  39.055 ms (5%) |           | 157.19 KiB (1%) |        2841 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  38.426 ms (5%) |           |  84.41 KiB (1%) |        1528 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  41.203 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 194.010 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 189.210 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 335.517 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.617 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.184 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.001 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.169 ms (5%) |           |   1.22 MiB (1%) |         158 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  22.908 ms (5%) |           |   1.04 MiB (1%) |        4794 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.039 ms (5%) |           |   1.23 MiB (1%) |         508 |
| `["parallel_histogram", "seq"]`                     |   8.568 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  14.197 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.284 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.164 ms (5%) |           | 155.14 KiB (1%) |        3014 |
| `["sum", "random", "reduce", "basesize=512"]`       |   6.976 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  13.808 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.385 ms (5%) |           | 313.31 KiB (1%) |        6066 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.880 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.679 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  15.787 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.450 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.204 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.642 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  45.621 ms (5%) |  7.197 ms |  63.20 MiB (1%) |     2064900 |
| `["words", "nthreads=2"]`                           |  21.357 ms (5%) |           |  63.80 MiB (1%) |     2073040 |
| `["words", "nthreads=4"]`                           |  22.886 ms (5%) |           |  64.77 MiB (1%) |     2081299 |

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
       #1  2095 MHz      54421 s          0 s       2344 s      11950 s          0 s
       #2  2095 MHz      44462 s          0 s       2584 s      21229 s          0 s
       
  Memory: 6.764884948730469 GB (3023.58984375 MB free)
  Uptime: 707.0 sec
  Load Avg:  1.5927734375  1.49658203125  0.89208984375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 26 Jul 2020 - 0:41
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
| `["collect", "assoc", "basesize=1"]`                | 368.103 ms (5%) | 10.673 ms |  87.55 MiB (1%) |     1590747 |
| `["collect", "assoc", "basesize=1024"]`             | 232.964 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 236.657 ms (5%) |           |   5.64 MiB (1%) |       54022 |
| `["collect", "seq"]`                                | 462.500 ms (5%) |           |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 460.597 ms (5%) |           |  29.16 MiB (1%) |      403134 |
| `["collect", "unordered", "basesize=1024"]`         | 282.948 ms (5%) |           | 784.23 KiB (1%) |        3283 |
| `["collect", "unordered", "basesize=32"]`           | 259.909 ms (5%) |           |   1.46 MiB (1%) |       16335 |
| `["findfirst", "n=1000", "foldl"]`                  | 714.316 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 373.378 ms (5%) |           | 564.08 KiB (1%) |       10232 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 381.129 ms (5%) |           | 287.28 KiB (1%) |        5228 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 381.156 ms (5%) |           | 149.27 KiB (1%) |        2722 |
| `["findfirst", "n=400", "foldl"]`                   | 524.832 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 276.906 ms (5%) |           |   1.02 MiB (1%) |       18946 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 274.527 ms (5%) |           | 526.16 KiB (1%) |        9574 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 276.822 ms (5%) |           | 267.27 KiB (1%) |        4882 |
| `["findfirst", "n=500", "foldl"]`                   |  93.038 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  48.246 ms (5%) |           | 157.36 KiB (1%) |        2852 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  47.524 ms (5%) |           |  84.48 KiB (1%) |        1533 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  51.014 ms (5%) |           |  48.20 KiB (1%) |         876 |
| `["overhead", "default"]`                           | 200.807 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 198.808 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 342.012 μs (5%) |           | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.904 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.704 ms (5%) |           |   1.80 MiB (1%) |         494 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.250 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.484 ms (5%) |           |   1.22 MiB (1%) |         158 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.644 ms (5%) |           |   1.07 MiB (1%) |        6168 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.400 ms (5%) |           |   1.25 MiB (1%) |        2248 |
| `["parallel_histogram", "seq"]`                     |   8.642 ms (5%) |           | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  18.201 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   9.388 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   9.359 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   9.156 ms (5%) |           |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  16.655 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   9.345 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.890 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.975 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  17.160 ms (5%) |           |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.467 ms (5%) |           | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.290 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.171 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  45.268 ms (5%) |  6.946 ms |  63.14 MiB (1%) |     2063229 |
| `["words", "nthreads=2"]`                           |  23.333 ms (5%) |           |  64.23 MiB (1%) |     2075528 |
| `["words", "nthreads=4"]`                           |  24.413 ms (5%) |           |  64.86 MiB (1%) |     2081752 |

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
       #1  2095 MHz      78583 s          0 s       2894 s      17144 s          0 s
       #2  2095 MHz      66104 s          0 s       3046 s      29022 s          0 s
       
  Memory: 6.764884948730469 GB (2984.9296875 MB free)
  Uptime: 1008.0 sec
  Load Avg:  1.61328125  1.5625  1.091796875
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

