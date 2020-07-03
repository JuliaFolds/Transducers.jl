# Multi-thread benchmark result

* Pull request commit: [`6d3de407ff53a3ab4d2b63051b8a0f0bf76b5165`](https://github.com/JuliaFolds/Transducers.jl/commit/6d3de407ff53a3ab4d2b63051b8a0f0bf76b5165)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Jul 2020 - 02:26
    - Baseline: 3 Jul 2020 - 02:31
* Package commits:
    - Target: 70c128
    - Baseline: b4848b
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

| ID                                                  | time ratio    | memory ratio  |
|-----------------------------------------------------|---------------|---------------|
| `["collect", "unordered", "basesize=1024"]`         | 1.14 (5%) :x: | 1.08 (1%) :x: |
| `["parallel_histogram", "assoc", "basesize=16384"]` | 1.05 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "assoc", "basesize=4096"]`  | 1.06 (5%) :x: |    1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   | 1.07 (5%) :x: | 1.08 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=8192"]`   | 1.16 (5%) :x: |    1.00 (1%)  |
| `["words", "nthreads=2"]`                           | 1.08 (5%) :x: |    0.99 (1%)  |
| `["words", "nthreads=4"]`                           | 1.11 (5%) :x: |    1.00 (1%)  |

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
       #1  2294 MHz      50107 s          0 s       2630 s      92473 s          0 s
       #2  2294 MHz      52970 s          0 s       2902 s      90298 s          0 s
       
  Memory: 6.764884948730469 GB (2992.74609375 MB free)
  Uptime: 1479.0 sec
  Load Avg:  1.81982421875  1.59716796875  0.9541015625
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
       #1  2294 MHz      70996 s          0 s       3256 s     100468 s          0 s
       #2  2294 MHz      77348 s          0 s       3492 s      94744 s          0 s
       
  Memory: 6.764884948730469 GB (2985.01171875 MB free)
  Uptime: 1776.0 sec
  Load Avg:  1.78955078125  1.658203125  1.15283203125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 2:26
* Package commit: 70c128
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
| `["collect", "assoc", "basesize=1"]`                | 334.858 ms (5%) | 11.988 ms |  87.55 MiB (1%) |     1590726 |
| `["collect", "assoc", "basesize=1024"]`             | 182.395 ms (5%) |           |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 189.925 ms (5%) |           |   5.64 MiB (1%) |       54010 |
| `["collect", "seq"]`                                | 360.962 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 457.962 ms (5%) |           |  29.19 MiB (1%) |      405047 |
| `["collect", "unordered", "basesize=1024"]`         | 291.389 ms (5%) |           | 923.58 KiB (1%) |       12201 |
| `["collect", "unordered", "basesize=32"]`           | 218.919 ms (5%) |           |   1.50 MiB (1%) |       18416 |
| `["findfirst", "n=1000", "foldl"]`                  | 594.880 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 304.253 ms (5%) |           | 563.97 KiB (1%) |       10225 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 302.082 ms (5%) |           | 287.25 KiB (1%) |        5226 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 308.541 ms (5%) |           | 149.25 KiB (1%) |        2721 |
| `["findfirst", "n=400", "foldl"]`                   | 443.046 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 229.321 ms (5%) |           |   1.02 MiB (1%) |       18978 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 231.341 ms (5%) |           | 526.09 KiB (1%) |        9570 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 226.032 ms (5%) |           | 267.17 KiB (1%) |        4876 |
| `["findfirst", "n=500", "foldl"]`                   |  74.624 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  39.030 ms (5%) |           | 157.28 KiB (1%) |        2847 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  38.884 ms (5%) |           |  84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  40.669 ms (5%) |           |  48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 193.101 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=false"]`                   | 195.501 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 341.702 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.143 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.005 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.551 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  12.731 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.277 ms (5%) |           |   1.06 MiB (1%) |        3437 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.039 ms (5%) |           |   1.23 MiB (1%) |         766 |
| `["parallel_histogram", "seq"]`                     |   7.315 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  14.358 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.528 ms (5%) |           | 313.33 KiB (1%) |        6067 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.324 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.388 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  13.545 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.345 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   6.966 ms (5%) |           | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.915 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "valley", "foldl"]`                        |  13.855 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.578 ms (5%) |           | 313.22 KiB (1%) |        6060 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.254 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.206 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  41.764 ms (5%) |  8.410 ms |  64.85 MiB (1%) |     2098696 |
| `["words", "nthreads=2"]`                           |  24.812 ms (5%) |           |  65.21 MiB (1%) |     2098772 |
| `["words", "nthreads=4"]`                           |  25.694 ms (5%) |           |  65.93 MiB (1%) |     2098927 |

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
       #1  2294 MHz      50107 s          0 s       2630 s      92473 s          0 s
       #2  2294 MHz      52970 s          0 s       2902 s      90298 s          0 s
       
  Memory: 6.764884948730469 GB (2992.74609375 MB free)
  Uptime: 1479.0 sec
  Load Avg:  1.81982421875  1.59716796875  0.9541015625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 3 Jul 2020 - 2:31
* Package commit: b4848b
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
| `["collect", "assoc", "basesize=1"]`                | 336.131 ms (5%) | 10.571 ms |   87.55 MiB (1%) |     1590700 |
| `["collect", "assoc", "basesize=1024"]`             | 175.165 ms (5%) |           |    1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 188.870 ms (5%) |           |    5.64 MiB (1%) |       54010 |
| `["collect", "seq"]`                                | 356.232 ms (5%) |           |    1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 457.479 ms (5%) |           |   29.20 MiB (1%) |      405726 |
| `["collect", "unordered", "basesize=1024"]`         | 255.147 ms (5%) |           |  855.19 KiB (1%) |        7779 |
| `["collect", "unordered", "basesize=32"]`           | 219.893 ms (5%) |           |    1.50 MiB (1%) |       18694 |
| `["findfirst", "n=1000", "foldl"]`                  | 591.776 ms (5%) |           |                  |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 314.704 ms (5%) |           |  564.02 KiB (1%) |       10228 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 313.892 ms (5%) |           |  287.16 KiB (1%) |        5220 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 319.100 ms (5%) |           |  149.23 KiB (1%) |        2720 |
| `["findfirst", "n=400", "foldl"]`                   | 448.902 ms (5%) |           |                  |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 229.566 ms (5%) |           |    1.02 MiB (1%) |       18976 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 228.640 ms (5%) |           |  526.02 KiB (1%) |        9565 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 230.324 ms (5%) |           |  267.16 KiB (1%) |        4875 |
| `["findfirst", "n=500", "foldl"]`                   |  76.972 ms (5%) |           |                  |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  38.542 ms (5%) |           |  157.31 KiB (1%) |        2849 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  38.303 ms (5%) |           |   84.45 KiB (1%) |        1531 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  42.255 ms (5%) |           |   48.19 KiB (1%) |         875 |
| `["overhead", "default"]`                           | 193.401 μs (5%) |           |  146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 190.501 μs (5%) |           |  146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 340.901 μs (5%) |           |  146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   3.933 ms (5%) |           |  732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   4.744 ms (5%) |           |    1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.636 ms (5%) |           |    1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.382 ms (5%) |           |    1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  19.884 ms (5%) |           | 1008.39 KiB (1%) |         902 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  14.656 ms (5%) |           |    1.23 MiB (1%) |         569 |
| `["parallel_histogram", "seq"]`                     |   7.368 ms (5%) |           |  364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  13.885 ms (5%) |           |                  |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   7.652 ms (5%) |           |  313.31 KiB (1%) |        6066 |
| `["sum", "random", "reduce", "basesize=256"]`       |   7.355 ms (5%) |           |  155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   7.140 ms (5%) |           |   76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  13.541 ms (5%) |           |                  |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   7.478 ms (5%) |           |  313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.089 ms (5%) |           |  155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   6.883 ms (5%) |           |   76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  14.162 ms (5%) |           |                  |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   7.266 ms (5%) |           |  313.30 KiB (1%) |        6065 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   7.453 ms (5%) |           |  155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   7.226 ms (5%) |           |   76.27 KiB (1%) |        1485 |
| `["words", "nthreads=1"]`                           |  43.803 ms (5%) |  7.809 ms |   65.06 MiB (1%) |     2104849 |
| `["words", "nthreads=2"]`                           |  22.971 ms (5%) |           |   65.77 MiB (1%) |     2105003 |
| `["words", "nthreads=4"]`                           |  23.248 ms (5%) |           |   66.22 MiB (1%) |     2105151 |

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
       #1  2294 MHz      70996 s          0 s       3256 s     100468 s          0 s
       #2  2294 MHz      77348 s          0 s       3492 s      94744 s          0 s
       
  Memory: 6.764884948730469 GB (2985.01171875 MB free)
  Uptime: 1776.0 sec
  Load Avg:  1.78955078125  1.658203125  1.15283203125
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

