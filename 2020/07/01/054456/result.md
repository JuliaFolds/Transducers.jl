# Multi-thread benchmark result

* Target commit: [`a1080ccd79f280202237cf97f2f273f49a90fd34`](https://github.com/JuliaFolds/Transducers.jl/commit/a1080ccd79f280202237cf97f2f273f49a90fd34)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/323> (Re-enable "full" method ambiguity test)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jul 2020 - 05:39
    - Baseline: 1 Jul 2020 - 05:44
* Package commits:
    - Target: 1346d9
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

| ID                                                  | time ratio                   | memory ratio |
|-----------------------------------------------------|------------------------------|--------------|
| `["collect", "assoc", "basesize=1024"]`             | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "assoc", "basesize=32"]`               | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "unordered", "basesize=1"]`            | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "unordered", "basesize=1024"]`         | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["collect", "unordered", "basesize=32"]`           | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["findfirst", "n=1000", "foldl"]`                  |                1.12 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` |                1.08 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` |                1.11 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` |                1.07 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=400", "foldl"]`                   |                1.12 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  |                1.06 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  |                1.15 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  |                1.13 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=500", "foldl"]`                   |                1.12 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |                1.16 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |                1.06 (5%) :x: |   1.00 (1%)  |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |                1.13 (5%) :x: |   1.00 (1%)  |
| `["overhead", "default"]`                           | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["overhead", "stoppable=true"]`                    |                1.19 (5%) :x: |   1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=16384"]` | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.12 (5%) :x: |   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                1.06 (5%) :x: |   1.00 (1%)  |
| `["parallel_histogram", "seq"]`                     |                1.07 (5%) :x: |   1.00 (1%)  |
| `["sum", "random", "foldl"]`                        |                1.09 (5%) :x: |   1.00 (1%)  |
| `["sum", "random", "reduce", "basesize=256"]`       |                1.08 (5%) :x: |   1.00 (1%)  |
| `["sum", "uniform", "foldl"]`                       | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["sum", "valley", "reduce", "basesize=128"]`       | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["words", "nthreads=1"]`                           | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["words", "nthreads=2"]`                           | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["words", "nthreads=4"]`                           | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2095 MHz      51437 s          0 s       2325 s      14755 s          0 s
       #2  2095 MHz      47718 s          0 s       2559 s      18170 s          0 s
       
  Memory: 6.764884948730469 GB (3107.33984375 MB free)
  Uptime: 706.0 sec
  Load Avg:  1.80126953125  1.5341796875  0.916015625
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
       #1  2095 MHz      72904 s          0 s       2866 s      21613 s          0 s
       #2  2095 MHz      70970 s          0 s       3046 s      23217 s          0 s
       
  Memory: 6.764884948730469 GB (3139.59375 MB free)
  Uptime: 996.0 sec
  Load Avg:  1.76806640625  1.63525390625  1.1240234375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:39
* Package commit: 1346d9
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
| `["collect", "assoc", "basesize=1"]`                | 367.848 ms (5%) | 12.433 ms |  87.55 MiB (1%) |     1590763 |
| `["collect", "assoc", "basesize=1024"]`             | 216.324 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 224.210 ms (5%) |           |   5.64 MiB (1%) |       54023 |
| `["collect", "seq"]`                                | 432.338 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 426.210 ms (5%) |           |  29.14 MiB (1%) |      401946 |
| `["collect", "unordered", "basesize=1024"]`         | 249.538 ms (5%) |           | 767.69 KiB (1%) |        2179 |
| `["collect", "unordered", "basesize=32"]`           | 253.075 ms (5%) |           |   1.46 MiB (1%) |       16253 |
| `["findfirst", "n=1000", "foldl"]`                  | 712.830 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 350.328 ms (5%) |           | 564.00 KiB (1%) |       10227 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 357.967 ms (5%) |           | 287.28 KiB (1%) |        5228 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 355.322 ms (5%) |           | 149.28 KiB (1%) |        2723 |
| `["findfirst", "n=400", "foldl"]`                   | 545.042 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 266.248 ms (5%) |           |   1.02 MiB (1%) |       18966 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 282.631 ms (5%) |           | 526.22 KiB (1%) |        9578 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 279.344 ms (5%) |           | 267.13 KiB (1%) |        4873 |
| `["findfirst", "n=500", "foldl"]`                   |  85.880 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  44.764 ms (5%) |           | 157.30 KiB (1%) |        2848 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  43.549 ms (5%) |           |  84.42 KiB (1%) |        1529 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  49.291 ms (5%) |           |  48.16 KiB (1%) |         873 |
| `["overhead", "default"]`                           | 180.715 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 189.517 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 332.928 μs (5%) |           | 146.39 KiB (1%) |        2644 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.404 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.221 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.254 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.231 ms (5%) |           |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  23.814 ms (5%) |           |   1.04 MiB (1%) |        4614 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  20.722 ms (5%) |           |   1.25 MiB (1%) |        2289 |
| `["parallel_histogram", "seq"]`                     |   9.011 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  15.558 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.520 ms (5%) |           | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.342 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.310 ms (5%) |           |  76.28 KiB (1%) |        1486 |
| `["sum", "uniform", "foldl"]`                       |  14.754 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.710 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.422 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.959 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  17.483 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.747 ms (5%) |           | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   9.147 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.998 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  34.512 ms (5%) |  6.266 ms |  64.78 MiB (1%) |     2096370 |
| `["words", "nthreads=2"]`                           |  18.463 ms (5%) |           |  65.14 MiB (1%) |     2096446 |
| `["words", "nthreads=4"]`                           |  21.533 ms (5%) |           |  66.04 MiB (1%) |     2096743 |

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
       #1  2095 MHz      51437 s          0 s       2325 s      14755 s          0 s
       #2  2095 MHz      47718 s          0 s       2559 s      18170 s          0 s
       
  Memory: 6.764884948730469 GB (3107.33984375 MB free)
  Uptime: 706.0 sec
  Load Avg:  1.80126953125  1.5341796875  0.916015625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 1 Jul 2020 - 5:44
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
| `["collect", "assoc", "basesize=1"]`                | 360.181 ms (5%) | 11.035 ms |  87.55 MiB (1%) |     1590777 |
| `["collect", "assoc", "basesize=1024"]`             | 240.906 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 239.398 ms (5%) |           |   5.64 MiB (1%) |       54016 |
| `["collect", "seq"]`                                | 455.029 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 457.276 ms (5%) |           |  29.15 MiB (1%) |      402513 |
| `["collect", "unordered", "basesize=1024"]`         | 267.810 ms (5%) |           | 764.59 KiB (1%) |        2026 |
| `["collect", "unordered", "basesize=32"]`           | 268.490 ms (5%) |           |   1.47 MiB (1%) |       16545 |
| `["findfirst", "n=1000", "foldl"]`                  | 635.083 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 325.016 ms (5%) |           | 563.67 KiB (1%) |       10206 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 321.587 ms (5%) |           | 287.20 KiB (1%) |        5223 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 330.687 ms (5%) |           | 149.20 KiB (1%) |        2718 |
| `["findfirst", "n=400", "foldl"]`                   | 487.726 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 250.335 ms (5%) |           |   1.02 MiB (1%) |       18916 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 246.141 ms (5%) |           | 525.78 KiB (1%) |        9550 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 246.910 ms (5%) |           | 267.05 KiB (1%) |        4868 |
| `["findfirst", "n=500", "foldl"]`                   |  76.944 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  38.622 ms (5%) |           | 157.19 KiB (1%) |        2841 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  40.979 ms (5%) |           |  84.42 KiB (1%) |        1529 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  43.598 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 192.610 μs (5%) |           | 146.11 KiB (1%) |        2626 |
| `["overhead", "stoppable=false"]`                   | 186.210 μs (5%) |           | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 278.715 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.930 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.443 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   5.061 ms (5%) |           |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.518 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.355 ms (5%) |           |   1.04 MiB (1%) |        2557 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  19.570 ms (5%) |           |   1.25 MiB (1%) |        2017 |
| `["parallel_histogram", "seq"]`                     |   8.418 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  14.335 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.639 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.708 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.393 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  16.326 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.882 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.229 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.039 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  17.529 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.517 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.836 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   9.332 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  38.462 ms (5%) |  6.529 ms |  64.63 MiB (1%) |     2091729 |
| `["words", "nthreads=2"]`                           |  21.778 ms (5%) |           |  65.35 MiB (1%) |     2091883 |
| `["words", "nthreads=4"]`                           |  22.964 ms (5%) |           |  65.98 MiB (1%) |     2092173 |

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
       #1  2095 MHz      72904 s          0 s       2866 s      21613 s          0 s
       #2  2095 MHz      70970 s          0 s       3046 s      23217 s          0 s
       
  Memory: 6.764884948730469 GB (3139.59375 MB free)
  Uptime: 996.0 sec
  Load Avg:  1.76806640625  1.63525390625  1.1240234375
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
    CPU MHz:             2095.244
    BogoMIPS:            4190.48
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

