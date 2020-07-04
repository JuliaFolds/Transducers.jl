# Multi-thread benchmark result

* Pull request commit: [`52741514007f838ba6c85097e711e245de54cf8b`](https://github.com/JuliaFolds/Transducers.jl/commit/52741514007f838ba6c85097e711e245de54cf8b)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Jul 2020 - 06:53
    - Baseline: 4 Jul 2020 - 06:58
* Package commits:
    - Target: 0fb3c4
    - Baseline: db547f
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
| `["collect", "unordered", "basesize=1024"]`         | 0.90 (5%) :white_check_mark: | 0.98 (1%) :white_check_mark: |
| `["overhead", "stoppable=true"]`                    | 0.92 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["parallel_histogram", "comm", "basesize=4096"]`   |                1.14 (5%) :x: |                   0.99 (1%)  |
| `["parallel_histogram", "comm", "basesize=8192"]`   |                   0.97 (5%)  | 0.98 (1%) :white_check_mark: |
| `["sum", "random", "reduce", "basesize=512"]`       | 0.95 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["words", "nthreads=2"]`                           |                1.11 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           |                1.13 (5%) :x: |                   1.00 (1%)  |

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
       #1  2095 MHz      45201 s          0 s       2230 s      22511 s          0 s
       #2  2095 MHz      54102 s          0 s       2753 s      13922 s          0 s
       
  Memory: 6.764884948730469 GB (3021.015625 MB free)
  Uptime: 726.0 sec
  Load Avg:  1.73193359375  1.50634765625  0.9091796875
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
       #1  2095 MHz      68811 s          0 s       2741 s      26902 s          0 s
       #2  2095 MHz      74699 s          0 s       3259 s      21296 s          0 s
       
  Memory: 6.764884948730469 GB (3044.15625 MB free)
  Uptime: 1013.0 sec
  Load Avg:  1.66357421875  1.59033203125  1.107421875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 6:53
* Package commit: 0fb3c4
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
| `["collect", "assoc", "basesize=1"]`                | 365.178 ms (5%) | 11.876 ms |  87.55 MiB (1%) |     1590760 |
| `["collect", "assoc", "basesize=1024"]`             | 224.888 ms (5%) |           |   1.84 MiB (1%) |        1811 |
| `["collect", "assoc", "basesize=32"]`               | 232.349 ms (5%) |           |   5.64 MiB (1%) |       54018 |
| `["collect", "seq"]`                                | 446.217 ms (5%) |           |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 439.724 ms (5%) |           |  29.14 MiB (1%) |      401917 |
| `["collect", "unordered", "basesize=1024"]`         | 279.795 ms (5%) |           | 804.70 KiB (1%) |        4593 |
| `["collect", "unordered", "basesize=32"]`           | 254.267 ms (5%) |           |   1.46 MiB (1%) |       16120 |
| `["findfirst", "n=1000", "foldl"]`                  | 690.520 ms (5%) |           |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 362.314 ms (5%) |           | 563.47 KiB (1%) |       10193 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 358.772 ms (5%) |           | 287.09 KiB (1%) |        5216 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 359.821 ms (5%) |           | 149.19 KiB (1%) |        2717 |
| `["findfirst", "n=400", "foldl"]`                   | 518.652 ms (5%) |           |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 275.625 ms (5%) |           |   1.02 MiB (1%) |       18877 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 270.693 ms (5%) |           | 525.47 KiB (1%) |        9530 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 267.295 ms (5%) |           | 267.03 KiB (1%) |        4867 |
| `["findfirst", "n=500", "foldl"]`                   |  88.251 ms (5%) |           |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  46.039 ms (5%) |           | 157.13 KiB (1%) |        2837 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  46.113 ms (5%) |           |  84.39 KiB (1%) |        1527 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  47.950 ms (5%) |           |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 177.509 μs (5%) |           | 146.17 KiB (1%) |        2630 |
| `["overhead", "stoppable=false"]`                   | 176.809 μs (5%) |           | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 304.316 μs (5%) |           | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.534 ms (5%) |           | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.155 ms (5%) |           |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.799 ms (5%) |           |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  14.637 ms (5%) |           |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  24.605 ms (5%) |           |   1.06 MiB (1%) |        5398 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.515 ms (5%) |           |   1.23 MiB (1%) |         506 |
| `["parallel_histogram", "seq"]`                     |   8.134 ms (5%) |           | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.258 ms (5%) |           |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.641 ms (5%) |           | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.304 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.164 ms (5%) |           |  76.27 KiB (1%) |        1485 |
| `["sum", "uniform", "foldl"]`                       |  15.694 ms (5%) |           |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.336 ms (5%) |           | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.163 ms (5%) |           | 155.09 KiB (1%) |        3011 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.097 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.676 ms (5%) |           |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.153 ms (5%) |           | 313.25 KiB (1%) |        6062 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.687 ms (5%) |           | 155.06 KiB (1%) |        3009 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.364 ms (5%) |           |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  36.351 ms (5%) |  6.752 ms |  64.94 MiB (1%) |     2101424 |
| `["words", "nthreads=2"]`                           |  22.091 ms (5%) |           |  65.30 MiB (1%) |     2101500 |
| `["words", "nthreads=4"]`                           |  22.758 ms (5%) |           |  66.20 MiB (1%) |     2101797 |

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
       #1  2095 MHz      45201 s          0 s       2230 s      22511 s          0 s
       #2  2095 MHz      54102 s          0 s       2753 s      13922 s          0 s
       
  Memory: 6.764884948730469 GB (3021.015625 MB free)
  Uptime: 726.0 sec
  Load Avg:  1.73193359375  1.50634765625  0.9091796875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 6:58
* Package commit: db547f
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
| `["collect", "assoc", "basesize=1"]`                | 361.631 ms (5%) | 9.490 ms |  87.55 MiB (1%) |     1590822 |
| `["collect", "assoc", "basesize=1024"]`             | 223.778 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 227.462 ms (5%) |          |   5.64 MiB (1%) |       54004 |
| `["collect", "seq"]`                                | 440.578 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 458.747 ms (5%) | 7.234 ms |  29.14 MiB (1%) |      402179 |
| `["collect", "unordered", "basesize=1024"]`         | 310.407 ms (5%) |          | 821.80 KiB (1%) |        5687 |
| `["collect", "unordered", "basesize=32"]`           | 254.155 ms (5%) |          |   1.47 MiB (1%) |       16607 |
| `["findfirst", "n=1000", "foldl"]`                  | 697.991 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 357.586 ms (5%) |          | 563.53 KiB (1%) |       10197 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 359.615 ms (5%) |          | 287.14 KiB (1%) |        5219 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 365.429 ms (5%) |          | 149.22 KiB (1%) |        2719 |
| `["findfirst", "n=400", "foldl"]`                   | 524.615 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 271.436 ms (5%) |          |   1.02 MiB (1%) |       18856 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 272.594 ms (5%) |          | 525.64 KiB (1%) |        9541 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 268.216 ms (5%) |          | 267.00 KiB (1%) |        4865 |
| `["findfirst", "n=500", "foldl"]`                   |  86.586 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  45.031 ms (5%) |          | 157.11 KiB (1%) |        2836 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  45.324 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  47.933 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 172.207 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 173.607 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 331.313 μs (5%) |          | 146.41 KiB (1%) |        2645 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.556 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.097 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.829 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  15.072 ms (5%) |          |   1.22 MiB (1%) |         242 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.622 ms (5%) |          |   1.06 MiB (1%) |        4441 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.134 ms (5%) |          |   1.25 MiB (1%) |        1757 |
| `["parallel_histogram", "seq"]`                     |   8.081 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  16.855 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.826 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.496 ms (5%) |          | 155.13 KiB (1%) |        3013 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.623 ms (5%) |          |  76.30 KiB (1%) |        1487 |
| `["sum", "uniform", "foldl"]`                       |  16.258 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.588 ms (5%) |          | 313.39 KiB (1%) |        6071 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.271 ms (5%) |          | 155.11 KiB (1%) |        3012 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.178 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.402 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   9.016 ms (5%) |          | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.742 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.325 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["words", "nthreads=1"]`                           |  37.376 ms (5%) | 6.579 ms |  64.86 MiB (1%) |     2098856 |
| `["words", "nthreads=2"]`                           |  19.949 ms (5%) |          |  65.22 MiB (1%) |     2098933 |
| `["words", "nthreads=4"]`                           |  20.224 ms (5%) |          |  65.93 MiB (1%) |     2099088 |

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
       #1  2095 MHz      68811 s          0 s       2741 s      26902 s          0 s
       #2  2095 MHz      74699 s          0 s       3259 s      21296 s          0 s
       
  Memory: 6.764884948730469 GB (3044.15625 MB free)
  Uptime: 1013.0 sec
  Load Avg:  1.66357421875  1.59033203125  1.107421875
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
    CPU MHz:             2095.196
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

