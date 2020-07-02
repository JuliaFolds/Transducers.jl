# Benchmark result

* Pull request commit: [`ac99e81223d6a88f4f00c28fa2ed48dc26749167`](https://github.com/JuliaFolds/Transducers.jl/commit/ac99e81223d6a88f4f00c28fa2ed48dc26749167)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/243> (Update */Manifest.toml)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 2 Jul 2020 - 00:42
    - Baseline: 2 Jul 2020 - 00:47
* Package commits:
    - Target: 4ce304
    - Baseline: 6b039c
* Julia commits:
    - Target: 44fa15
    - Baseline: 44fa15
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`
    - Baseline: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                                       | time ratio                   | memory ratio                 |
|------------------------------------------|------------------------------|------------------------------|
| `["cat", "base"]`                        | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["cat", "xf"]`                          | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["collect", "identity-float"]`          | 0.93 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["filter_map_map!", "man"]`             | 0.89 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["findall", "base"]`                    | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "16"]`       | 0.91 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "32"]`       | 0.94 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "fusedmul", "xf", "8"]`        |                1.18 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "32"]`        | 0.83 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         | 0.71 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "32"]`  | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "256"]` |                1.06 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 0.81 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "32"]`   |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.36 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  |                1.09 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "8"]`    |                1.07 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "32"]`   | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.27 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   |                1.10 (5%) :x: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.81 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     |                1.08 (5%) :x: |                   1.00 (1%)  |
| `["groupby", "sum", "sac"]`              | 0.68 (5%) :white_check_mark: | 0.50 (1%) :white_check_mark: |
| `["missing_dot", "equiv"]`               |                1.17 (5%) :x: |                   1.00 (1%)  |
| `["missing_dot", "rf_nota"]`             | 0.88 (5%) :white_check_mark: |                   1.00 (1%)  |
| `["overhead", "foldl"]`                  | 0.87 (5%) :white_check_mark: |                   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["cat"]`
- `["collect"]`
- `["dot"]`
- `["filter_map_map!"]`
- `["filter_map_reduce"]`
- `["findall"]`
- `["gemm", "fusedmul", "blas"]`
- `["gemm", "fusedmul", "xf"]`
- `["gemm", "mul", "linalg"]`
- `["gemm", "mul", "man", "false"]`
- `["gemm", "mul", "man", "ivdep"]`
- `["gemm", "mul", "man", "true"]`
- `["gemm", "mul", "xf", "false"]`
- `["gemm", "mul", "xf", "ivdep"]`
- `["gemm", "mul", "xf", "true"]`
- `["groupby", "sum"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`

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
       #1  2095 MHz      38912 s          0 s       1509 s      20107 s          0 s
       #2  2095 MHz      18496 s          0 s       1598 s      40996 s          0 s
       
  Memory: 6.764884948730469 GB (3048.34375 MB free)
  Uptime: 631.0 sec
  Load Avg:  1.013671875  0.97705078125  0.58740234375
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
       #1  2095 MHz      52749 s          0 s       1808 s      32813 s          0 s
       #2  2095 MHz      31301 s          0 s       1782 s      54833 s          0 s
       
  Memory: 6.764884948730469 GB (2893.9765625 MB free)
  Uptime: 901.0 sec
  Load Avg:  1.00341796875  1.0  0.70947265625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 0:42
* Package commit: 4ce304
* Julia commit: 44fa15
* Julia command flags: None
* Environment variables: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                       | time            | GC time | memory          | allocations |
|------------------------------------------|----------------:|--------:|----------------:|------------:|
| `["cat", "base"]`                        |   1.560 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.510 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  92.098 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  65.799 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 263.695 μs (5%) |         | 705.20 KiB (1%) |       16672 |
| `["dot", "blas"]`                        |   1.040 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.010 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.790 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.790 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  52.399 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 629.587 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 191.696 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 191.696 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 690.285 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 637.586 μs (5%) |         |   3.03 MiB (1%) |       99335 |
| `["findall", "xf-iter"]`                 |   2.701 ms (5%) |         |   9.63 MiB (1%) |      299934 |
| `["gemm", "fusedmul", "blas", "16"]`     |   3.785 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   2.940 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.295 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.067 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   3.666 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 492.490 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   7.732 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.162 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 758.084 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.489 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 212.331 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.442 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   3.662 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 323.035 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.438 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.250 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 322.502 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.439 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.171 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 408.990 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.444 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.657 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 320.681 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.438 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.125 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 380.188 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.442 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   3.950 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 322.158 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 145.797 μs (5%) |         | 157.84 KiB (1%) |       10019 |
| `["groupby", "sum", "xf-with-init"]`     | 166.596 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 158.497 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.233 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.700 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.133 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.120 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.012 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.160 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.250 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 176.896 μs (5%) |         |  72.31 KiB (1%) |        3749 |
| `["missing_dot", "xf_nota"]`             | 180.496 μs (5%) |         |  72.14 KiB (1%) |        3743 |
| `["overhead", "foldl"]`                  |   4.499 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 155.787 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.696 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.578 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["cat"]`
- `["collect"]`
- `["dot"]`
- `["filter_map_map!"]`
- `["filter_map_reduce"]`
- `["findall"]`
- `["gemm", "fusedmul", "blas"]`
- `["gemm", "fusedmul", "xf"]`
- `["gemm", "mul", "linalg"]`
- `["gemm", "mul", "man", "false"]`
- `["gemm", "mul", "man", "ivdep"]`
- `["gemm", "mul", "man", "true"]`
- `["gemm", "mul", "xf", "false"]`
- `["gemm", "mul", "xf", "ivdep"]`
- `["gemm", "mul", "xf", "true"]`
- `["groupby", "sum"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`

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
       #1  2095 MHz      38912 s          0 s       1509 s      20107 s          0 s
       #2  2095 MHz      18496 s          0 s       1598 s      40996 s          0 s
       
  Memory: 6.764884948730469 GB (3048.34375 MB free)
  Uptime: 631.0 sec
  Load Avg:  1.013671875  0.97705078125  0.58740234375
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 2 Jul 2020 - 0:47
* Package commit: 6b039c
* Julia commit: 44fa15
* Julia command flags: None
* Environment variables: `OMP_NUM_THREADS => 1` `JULIA_NUM_THREADS => 1`

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                       | time            | GC time | memory          | allocations |
|------------------------------------------|----------------:|--------:|----------------:|------------:|
| `["cat", "base"]`                        |   1.680 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.830 μs (5%) |         |   80 bytes (1%) |           3 |
| `["collect", "filter-missing"]`          |  93.698 μs (5%) |         | 345.36 KiB (1%) |       10018 |
| `["collect", "identity-float"]`          |  70.899 μs (5%) |         | 569.20 KiB (1%) |       10018 |
| `["collect", "identity-union"]`          | 275.894 μs (5%) |         | 704.91 KiB (1%) |       16651 |
| `["dot", "blas"]`                        |   1.050 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.040 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   1.790 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   1.800 μs (5%) |         |                 |             |
| `["filter_map_map!", "man"]`             |  58.599 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 587.688 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 192.196 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 192.196 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 730.585 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 665.286 μs (5%) |         |   3.05 MiB (1%) |       99931 |
| `["findall", "xf-iter"]`                 |   2.762 ms (5%) |         |   9.63 MiB (1%) |      299939 |
| `["gemm", "fusedmul", "blas", "16"]`     |   3.980 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   2.950 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.515 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.068 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   4.015 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 496.289 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |   8.182 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   1.835 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 755.484 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   2.999 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 299.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.328 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.199 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.356 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.299 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 399.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.338 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   3.899 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 300.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.326 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   3.699 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 299.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.372 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.599 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 299.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.313 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.899 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 299.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 214.295 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 165.697 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 159.696 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["missing_argmax", "man"]`              |   2.233 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.678 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.156 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.210 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.170 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.087 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.140 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 174.797 μs (5%) |         |  72.33 KiB (1%) |        3749 |
| `["missing_dot", "xf_nota"]`             | 180.596 μs (5%) |         |  72.28 KiB (1%) |        3749 |
| `["overhead", "foldl"]`                  |   5.199 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 151.677 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   1.703 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   2.692 ms (5%) |         |   6.10 MiB (1%) |      200007 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["cat"]`
- `["collect"]`
- `["dot"]`
- `["filter_map_map!"]`
- `["filter_map_reduce"]`
- `["findall"]`
- `["gemm", "fusedmul", "blas"]`
- `["gemm", "fusedmul", "xf"]`
- `["gemm", "mul", "linalg"]`
- `["gemm", "mul", "man", "false"]`
- `["gemm", "mul", "man", "ivdep"]`
- `["gemm", "mul", "man", "true"]`
- `["gemm", "mul", "xf", "false"]`
- `["gemm", "mul", "xf", "ivdep"]`
- `["gemm", "mul", "xf", "true"]`
- `["groupby", "sum"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`

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
       #1  2095 MHz      52749 s          0 s       1808 s      32813 s          0 s
       #2  2095 MHz      31301 s          0 s       1782 s      54833 s          0 s
       
  Memory: 6.764884948730469 GB (2893.9765625 MB free)
  Uptime: 901.0 sec
  Load Avg:  1.00341796875  1.0  0.70947265625
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
    CPU MHz:             2095.198
    BogoMIPS:            4190.39
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

