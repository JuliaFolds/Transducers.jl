# Multi-thread benchmark result

* Pull request commit: [`eed419221c225038b7bd2e16196dacccbc059ec5`](https://github.com/JuliaFolds/Transducers.jl/commit/eed419221c225038b7bd2e16196dacccbc059ec5)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 16 Jul 2020 - 00:45
    - Baseline: 16 Jul 2020 - 00:51
* Package commits:
    - Target: bb9651
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

| ID                                                  | time ratio    | memory ratio                 |
|-----------------------------------------------------|---------------|------------------------------|
| `["collect", "unordered", "basesize=1024"]`         | 1.07 (5%) :x: |                1.06 (1%) :x: |
| `["overhead", "stoppable=true"]`                    | 1.07 (5%) :x: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=8192"]`   |    0.99 (5%)  | 0.99 (1%) :white_check_mark: |
| `["words", "nthreads=1"]`                           |    1.01 (5%)  |                1.01 (1%) :x: |
| `["words", "nthreads=4"]`                           |    1.01 (5%)  |                1.01 (1%) :x: |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      46962 s          0 s       2143 s      16728 s          0 s
       #2  2593 MHz      49976 s          0 s       2500 s      13706 s          0 s
       
  Memory: 6.791385650634766 GB (2834.171875 MB free)
  Uptime: 682.0 sec
  Load Avg:  1.7998046875  1.5380859375  0.89404296875
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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      70790 s          0 s       2786 s      24050 s          0 s
       #2  2593 MHz      73628 s          0 s       3140 s      21152 s          0 s
       
  Memory: 6.791385650634766 GB (2826.171875 MB free)
  Uptime: 1000.0 sec
  Load Avg:  1.708984375  1.55859375  1.0849609375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 16 Jul 2020 - 0:45
* Package commit: bb9651
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
| `["collect", "assoc", "basesize=1"]`                | 315.849 ms (5%) | 9.776 ms |  87.55 MiB (1%) |     1590760 |
| `["collect", "assoc", "basesize=1024"]`             | 198.305 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 202.145 ms (5%) |          |   5.64 MiB (1%) |       54016 |
| `["collect", "seq"]`                                | 395.196 ms (5%) |          |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 425.521 ms (5%) |          |  29.19 MiB (1%) |      405147 |
| `["collect", "unordered", "basesize=1024"]`         | 249.440 ms (5%) |          | 840.53 KiB (1%) |        6841 |
| `["collect", "unordered", "basesize=32"]`           | 223.830 ms (5%) |          |   1.47 MiB (1%) |       16741 |
| `["findfirst", "n=1000", "foldl"]`                  | 622.691 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 316.587 ms (5%) |          | 562.81 KiB (1%) |       10151 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 315.370 ms (5%) |          | 286.69 KiB (1%) |        5190 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 320.105 ms (5%) |          | 149.05 KiB (1%) |        2708 |
| `["findfirst", "n=400", "foldl"]`                   | 467.185 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 240.173 ms (5%) |          |   1.02 MiB (1%) |       18820 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 237.829 ms (5%) |          | 525.03 KiB (1%) |        9502 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 238.846 ms (5%) |          | 266.73 KiB (1%) |        4848 |
| `["findfirst", "n=500", "foldl"]`                   |  81.047 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  41.838 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.559 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.137 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 178.503 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 178.503 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 332.906 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.458 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.109 ms (5%) |          |   1.80 MiB (1%) |         496 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.778 ms (5%) |          |   1.43 MiB (1%) |         241 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.520 ms (5%) |          |   1.22 MiB (1%) |         159 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.021 ms (5%) |          |   1.08 MiB (1%) |        4639 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.995 ms (5%) |          |   1.25 MiB (1%) |        2303 |
| `["parallel_histogram", "seq"]`                     |   8.112 ms (5%) |          | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.904 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.390 ms (5%) |          | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.191 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.094 ms (5%) |          |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  15.475 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.143 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.944 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.870 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.016 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.409 ms (5%) |          | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.270 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.145 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  42.819 ms (5%) | 6.565 ms |  63.43 MiB (1%) |     2072316 |
| `["words", "nthreads=2"]`                           |  21.212 ms (5%) |          |  64.04 MiB (1%) |     2080532 |
| `["words", "nthreads=4"]`                           |  21.683 ms (5%) |          |  65.01 MiB (1%) |     2088823 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      46962 s          0 s       2143 s      16728 s          0 s
       #2  2593 MHz      49976 s          0 s       2500 s      13706 s          0 s
       
  Memory: 6.791385650634766 GB (2834.171875 MB free)
  Uptime: 682.0 sec
  Load Avg:  1.7998046875  1.5380859375  0.89404296875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 16 Jul 2020 - 0:51
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

| ID                                                  | time            | GC time  | memory          | allocations |
|-----------------------------------------------------|----------------:|---------:|----------------:|------------:|
| `["collect", "assoc", "basesize=1"]`                | 316.987 ms (5%) | 9.384 ms |  87.55 MiB (1%) |     1590799 |
| `["collect", "assoc", "basesize=1024"]`             | 198.844 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 202.420 ms (5%) |          |   5.64 MiB (1%) |       54014 |
| `["collect", "seq"]`                                | 395.198 ms (5%) |          |   1.50 MiB (1%) |       32784 |
| `["collect", "unordered", "basesize=1"]`            | 418.194 ms (5%) |          |  29.19 MiB (1%) |      405562 |
| `["collect", "unordered", "basesize=1024"]`         | 233.793 ms (5%) |          | 795.02 KiB (1%) |        3637 |
| `["collect", "unordered", "basesize=32"]`           | 224.074 ms (5%) |          |   1.47 MiB (1%) |       16921 |
| `["findfirst", "n=1000", "foldl"]`                  | 626.976 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 318.924 ms (5%) |          | 562.89 KiB (1%) |       10156 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 317.487 ms (5%) |          | 286.67 KiB (1%) |        5189 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 322.290 ms (5%) |          | 149.02 KiB (1%) |        2706 |
| `["findfirst", "n=400", "foldl"]`                   | 470.352 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 241.826 ms (5%) |          |   1.02 MiB (1%) |       18824 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 239.193 ms (5%) |          | 525.06 KiB (1%) |        9504 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 240.170 ms (5%) |          | 266.67 KiB (1%) |        4844 |
| `["findfirst", "n=500", "foldl"]`                   |  81.597 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.200 ms (5%) |          | 157.11 KiB (1%) |        2836 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.848 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.458 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 179.502 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 177.201 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 310.403 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.452 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.058 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.763 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.538 ms (5%) |          |   1.22 MiB (1%) |         199 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  20.680 ms (5%) |          |   1.08 MiB (1%) |        5246 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.088 ms (5%) |          |   1.27 MiB (1%) |        3301 |
| `["parallel_histogram", "seq"]`                     |   8.103 ms (5%) |          | 364.61 KiB (1%) |          24 |
| `["sum", "random", "foldl"]`                        |  15.907 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.445 ms (5%) |          | 313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.239 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.182 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.437 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.172 ms (5%) |          | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.963 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.872 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.035 ms (5%) |          |   64 bytes (1%) |           3 |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.512 ms (5%) |          | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.344 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.233 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  42.418 ms (5%) | 6.584 ms |  62.64 MiB (1%) |     2045991 |
| `["words", "nthreads=2"]`                           |  21.314 ms (5%) |          |  63.72 MiB (1%) |     2058207 |
| `["words", "nthreads=4"]`                           |  21.404 ms (5%) |          |  64.36 MiB (1%) |     2064408 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      70790 s          0 s       2786 s      24050 s          0 s
       #2  2593 MHz      73628 s          0 s       3140 s      21152 s          0 s
       
  Memory: 6.791385650634766 GB (2826.171875 MB free)
  Uptime: 1000.0 sec
  Load Avg:  1.708984375  1.55859375  1.0849609375
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
    Model name:          Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz
    Stepping:            7
    CPU MHz:             2593.906
    BogoMIPS:            5187.81
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
| Brand              | Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz          |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x07, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

