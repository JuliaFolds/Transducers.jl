# Multi-thread benchmark result

* Pull request commit: [`faf252bc0ba9610f714d4d1ddfbf3e47076b93b9`](https://github.com/JuliaFolds/Transducers.jl/commit/faf252bc0ba9610f714d4d1ddfbf3e47076b93b9)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/319> (Treat transducers as iterator transforms at surface syntax)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Jul 2020 - 00:03
    - Baseline: 4 Jul 2020 - 00:07
* Package commits:
    - Target: a28496
    - Baseline: c6b838
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
| `["collect", "unordered", "basesize=1024"]`         |    0.97 (5%)  |                1.02 (1%) :x: |
| `["parallel_histogram", "comm", "basesize=4096"]`   |    1.04 (5%)  | 0.95 (1%) :white_check_mark: |
| `["words", "nthreads=2"]`                           | 1.06 (5%) :x: |                   1.00 (1%)  |
| `["words", "nthreads=4"]`                           | 1.05 (5%) :x: |                   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      47776 s          0 s       2304 s      22760 s          0 s
       #2  2593 MHz      49250 s          0 s       2494 s      22406 s          0 s
       
  Memory: 6.791378021240234 GB (3192.109375 MB free)
  Uptime: 755.0 sec
  Load Avg:  1.7080078125  1.52392578125  0.89892578125
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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      70542 s          0 s       2838 s      27133 s          0 s
       #2  2593 MHz      69837 s          0 s       2989 s      28896 s          0 s
       
  Memory: 6.791378021240234 GB (3195.37109375 MB free)
  Uptime: 1032.0 sec
  Load Avg:  1.744140625  1.60595703125  1.09814453125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 0:3
* Package commit: a28496
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
| `["collect", "assoc", "basesize=1"]`                | 314.343 ms (5%) | 9.854 ms |  87.55 MiB (1%) |     1590770 |
| `["collect", "assoc", "basesize=1024"]`             | 198.631 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 201.955 ms (5%) |          |   5.64 MiB (1%) |       54018 |
| `["collect", "seq"]`                                | 395.155 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 425.482 ms (5%) |          |  29.19 MiB (1%) |      405537 |
| `["collect", "unordered", "basesize=1024"]`         | 237.012 ms (5%) |          | 810.56 KiB (1%) |        4968 |
| `["collect", "unordered", "basesize=32"]`           | 224.274 ms (5%) |          |   1.47 MiB (1%) |       16590 |
| `["findfirst", "n=1000", "foldl"]`                  | 624.759 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 317.931 ms (5%) |          | 562.89 KiB (1%) |       10156 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 316.475 ms (5%) |          | 286.69 KiB (1%) |        5190 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 318.112 ms (5%) |          | 149.06 KiB (1%) |        2709 |
| `["findfirst", "n=400", "foldl"]`                   | 470.031 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 240.721 ms (5%) |          |   1.02 MiB (1%) |       18819 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 238.651 ms (5%) |          | 525.02 KiB (1%) |        9501 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 239.121 ms (5%) |          | 266.75 KiB (1%) |        4849 |
| `["findfirst", "n=500", "foldl"]`                   |  81.468 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.045 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.716 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.299 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 173.101 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 174.101 μs (5%) |          | 146.14 KiB (1%) |        2628 |
| `["overhead", "stoppable=true"]`                    | 313.602 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.474 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.089 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.781 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.608 ms (5%) |          |   1.22 MiB (1%) |         160 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.924 ms (5%) |          |   1.02 MiB (1%) |        3219 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  18.132 ms (5%) |          |   1.27 MiB (1%) |        3223 |
| `["parallel_histogram", "seq"]`                     |   8.194 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  15.974 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.392 ms (5%) |          | 313.34 KiB (1%) |        6068 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.208 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.122 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.465 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.153 ms (5%) |          | 313.25 KiB (1%) |        6062 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   7.953 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   7.871 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.032 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.424 ms (5%) |          | 313.28 KiB (1%) |        6064 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.260 ms (5%) |          | 155.09 KiB (1%) |        3011 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.157 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  34.573 ms (5%) | 6.320 ms |  65.02 MiB (1%) |     2104278 |
| `["words", "nthreads=2"]`                           |  19.200 ms (5%) |          |  65.38 MiB (1%) |     2104355 |
| `["words", "nthreads=4"]`                           |  19.896 ms (5%) |          |  66.10 MiB (1%) |     2104510 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      47776 s          0 s       2304 s      22760 s          0 s
       #2  2593 MHz      49250 s          0 s       2494 s      22406 s          0 s
       
  Memory: 6.791378021240234 GB (3192.109375 MB free)
  Uptime: 755.0 sec
  Load Avg:  1.7080078125  1.52392578125  0.89892578125
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 4 Jul 2020 - 0:7
* Package commit: c6b838
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
| `["collect", "assoc", "basesize=1"]`                | 314.349 ms (5%) | 8.357 ms |  87.55 MiB (1%) |     1590760 |
| `["collect", "assoc", "basesize=1024"]`             | 198.726 ms (5%) |          |   1.84 MiB (1%) |        1812 |
| `["collect", "assoc", "basesize=32"]`               | 201.999 ms (5%) |          |   5.64 MiB (1%) |       54009 |
| `["collect", "seq"]`                                | 395.188 ms (5%) |          |   1.50 MiB (1%) |       32787 |
| `["collect", "unordered", "basesize=1"]`            | 423.439 ms (5%) |          |  29.20 MiB (1%) |      405877 |
| `["collect", "unordered", "basesize=1024"]`         | 243.989 ms (5%) |          | 792.42 KiB (1%) |        3762 |
| `["collect", "unordered", "basesize=32"]`           | 224.187 ms (5%) |          |   1.47 MiB (1%) |       16505 |
| `["findfirst", "n=1000", "foldl"]`                  | 625.509 ms (5%) |          |                 |             |
| `["findfirst", "n=1000", "reduce", "basesize=128"]` | 318.344 ms (5%) |          | 562.92 KiB (1%) |       10158 |
| `["findfirst", "n=1000", "reduce", "basesize=256"]` | 316.861 ms (5%) |          | 286.75 KiB (1%) |        5194 |
| `["findfirst", "n=1000", "reduce", "basesize=512"]` | 321.785 ms (5%) |          | 149.06 KiB (1%) |        2709 |
| `["findfirst", "n=400", "foldl"]`                   | 470.709 ms (5%) |          |                 |             |
| `["findfirst", "n=400", "reduce", "basesize=128"]`  | 241.486 ms (5%) |          |   1.02 MiB (1%) |       18820 |
| `["findfirst", "n=400", "reduce", "basesize=256"]`  | 238.887 ms (5%) |          | 525.03 KiB (1%) |        9502 |
| `["findfirst", "n=400", "reduce", "basesize=512"]`  | 239.676 ms (5%) |          | 266.70 KiB (1%) |        4846 |
| `["findfirst", "n=500", "foldl"]`                   |  81.592 ms (5%) |          |                 |             |
| `["findfirst", "n=500", "reduce", "basesize=128"]`  |  42.085 ms (5%) |          | 157.09 KiB (1%) |        2835 |
| `["findfirst", "n=500", "reduce", "basesize=256"]`  |  41.736 ms (5%) |          |  84.38 KiB (1%) |        1526 |
| `["findfirst", "n=500", "reduce", "basesize=512"]`  |  44.347 ms (5%) |          |  48.17 KiB (1%) |         874 |
| `["overhead", "default"]`                           | 175.503 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=false"]`                   | 175.303 μs (5%) |          | 146.16 KiB (1%) |        2629 |
| `["overhead", "stoppable=true"]`                    | 305.605 μs (5%) |          | 146.42 KiB (1%) |        2646 |
| `["parallel_histogram", "assoc", "basesize=16384"]` |   4.449 ms (5%) |          | 732.02 KiB (1%) |         101 |
| `["parallel_histogram", "assoc", "basesize=4096"]`  |   5.061 ms (5%) |          |   1.80 MiB (1%) |         495 |
| `["parallel_histogram", "assoc", "basesize=8192"]`  |   4.751 ms (5%) |          |   1.43 MiB (1%) |         240 |
| `["parallel_histogram", "comm", "basesize=16384"]`  |  13.612 ms (5%) |          |   1.22 MiB (1%) |         222 |
| `["parallel_histogram", "comm", "basesize=4096"]`   |  21.113 ms (5%) |          |   1.08 MiB (1%) |        5223 |
| `["parallel_histogram", "comm", "basesize=8192"]`   |  17.785 ms (5%) |          |   1.27 MiB (1%) |        3166 |
| `["parallel_histogram", "seq"]`                     |   8.098 ms (5%) |          | 364.64 KiB (1%) |          26 |
| `["sum", "random", "foldl"]`                        |  15.917 ms (5%) |          |                 |             |
| `["sum", "random", "reduce", "basesize=128"]`       |   8.432 ms (5%) |          | 313.36 KiB (1%) |        6069 |
| `["sum", "random", "reduce", "basesize=256"]`       |   8.268 ms (5%) |          | 155.06 KiB (1%) |        3009 |
| `["sum", "random", "reduce", "basesize=512"]`       |   8.146 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "uniform", "foldl"]`                       |  15.494 ms (5%) |          |                 |             |
| `["sum", "uniform", "reduce", "basesize=128"]`      |   8.280 ms (5%) |          | 313.38 KiB (1%) |        6070 |
| `["sum", "uniform", "reduce", "basesize=256"]`      |   8.117 ms (5%) |          | 155.08 KiB (1%) |        3010 |
| `["sum", "uniform", "reduce", "basesize=512"]`      |   8.007 ms (5%) |          |  76.25 KiB (1%) |        1484 |
| `["sum", "valley", "foldl"]`                        |  16.040 ms (5%) |          |                 |             |
| `["sum", "valley", "reduce", "basesize=128"]`       |   8.517 ms (5%) |          | 313.27 KiB (1%) |        6063 |
| `["sum", "valley", "reduce", "basesize=256"]`       |   8.332 ms (5%) |          | 155.11 KiB (1%) |        3012 |
| `["sum", "valley", "reduce", "basesize=512"]`       |   8.261 ms (5%) |          |  76.28 KiB (1%) |        1486 |
| `["words", "nthreads=1"]`                           |  33.752 ms (5%) | 5.899 ms |  64.94 MiB (1%) |     2101128 |
| `["words", "nthreads=2"]`                           |  18.159 ms (5%) |          |  65.30 MiB (1%) |     2101205 |
| `["words", "nthreads=4"]`                           |  18.871 ms (5%) |          |  66.02 MiB (1%) |     2101359 |

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
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz      70542 s          0 s       2838 s      27133 s          0 s
       #2  2593 MHz      69837 s          0 s       2989 s      28896 s          0 s
       
  Memory: 6.791378021240234 GB (3195.37109375 MB free)
  Uptime: 1032.0 sec
  Load Avg:  1.744140625  1.60595703125  1.09814453125
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
    CPU MHz:             2593.904
    BogoMIPS:            5187.80
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

