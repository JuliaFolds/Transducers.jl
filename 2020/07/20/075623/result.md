# Benchmark result

* Pull request commit: [`17563d538bcbf90ad269dde04c9d51e2c26e7668`](https://github.com/JuliaFolds/Transducers.jl/commit/17563d538bcbf90ad269dde04c9d51e2c26e7668)
* Pull request: <https://github.com/JuliaFolds/Transducers.jl/pull/345> (Install Documenter from GitHub)

# Judge result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmarks:
    - Target: 20 Jul 2020 - 07:51
    - Baseline: 20 Jul 2020 - 07:55
* Package commits:
    - Target: 5acac6
    - Baseline: 7c47b9
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

| ID                                       | time ratio                   | memory ratio |
|------------------------------------------|------------------------------|--------------|
| `["filter_map_map!", "man"]`             | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["filter_map_map!", "xf"]`              |                1.08 (5%) :x: |   1.00 (1%)  |
| `["findall", "xf-iter"]`                 |                1.08 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "linalg", "8"]`         |                1.35 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "256"]` | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "false", "8"]`   |                1.15 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "man", "ivdep", "256"]` | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "256"]`  | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "man", "true", "8"]`    |                1.23 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "256"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "false", "32"]`   | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "ivdep", "8"]`    |                1.51 (5%) :x: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "256"]`   | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "32"]`    | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["gemm", "mul", "xf", "true", "8"]`     | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["mapcat_eduction", "xf-xf"]`           |                1.05 (5%) :x: |   1.00 (1%)  |
| `["missing_argmax", "rf"]`               | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["missing_argmax", "xf"]`               |                1.25 (5%) :x: |   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
- `["cat"]`
- `["collect"]`
- `["dict"]`
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
- `["mapcat_eduction"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`
- `["set"]`

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
       #1  2593 MHz      57015 s          0 s       1470 s       8157 s          0 s
       #2  2593 MHz       5817 s          0 s       1366 s      59524 s          0 s
       
  Memory: 6.791385650634766 GB (2790.59375 MB free)
  Uptime: 687.0 sec
  Load Avg:  1.0068359375  0.95751953125  0.59765625
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
       #1  2593 MHz      58567 s          0 s       1536 s      32891 s          0 s
       #2  2593 MHz      30634 s          0 s       1473 s      61024 s          0 s
       
  Memory: 6.791385650634766 GB (2655.95703125 MB free)
  Uptime: 952.0 sec
  Load Avg:  1.0029296875  1.0  0.71435546875
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Target result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 20 Jul 2020 - 7:51
* Package commit: 5acac6
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
| `["append!!", "eduction"]`               |  18.300 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  18.300 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.760 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   2.011 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 106.801 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  74.601 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 317.903 μs (5%) |         | 705.30 KiB (1%) |       16678 |
| `["dict", "base"]`                       |   4.085 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.205 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.200 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.190 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.144 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.200 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  52.601 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 750.104 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 231.102 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 231.302 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 833.508 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 792.708 μs (5%) |         |   3.04 MiB (1%) |       99596 |
| `["findall", "xf-iter"]`                 |   3.450 ms (5%) |         |   9.63 MiB (1%) |      299915 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.331 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.244 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.902 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.429 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.276 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 657.004 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.586 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.644 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 902.708 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.025 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 270.479 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.571 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.686 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 459.391 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.577 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   3.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 382.843 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.565 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.857 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 490.769 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.573 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.271 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 386.765 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.589 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.663 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 452.792 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.588 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.614 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 379.808 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 256.202 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 184.101 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 191.301 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.870 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.920 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   2.022 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.678 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   2.567 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   3.212 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.640 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.380 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.929 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.440 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.690 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 207.201 μs (5%) |         |  72.23 KiB (1%) |        3746 |
| `["missing_dot", "xf_nota"]`             | 213.202 μs (5%) |         |  71.97 KiB (1%) |        3734 |
| `["overhead", "foldl"]`                  |   4.700 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 186.493 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.089 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.054 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.753 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.499 ms (5%) |         |  49.63 KiB (1%) |          21 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
- `["cat"]`
- `["collect"]`
- `["dict"]`
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
- `["mapcat_eduction"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`
- `["set"]`

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
       #1  2593 MHz      57015 s          0 s       1470 s       8157 s          0 s
       #2  2593 MHz       5817 s          0 s       1366 s      59524 s          0 s
       
  Memory: 6.791385650634766 GB (2790.59375 MB free)
  Uptime: 687.0 sec
  Load Avg:  1.0068359375  0.95751953125  0.59765625
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-8.0.1 (ORCJIT, skylake)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Transducers.jl/Transducers.jl*

## Job Properties
* Time of benchmark: 20 Jul 2020 - 7:55
* Package commit: 7c47b9
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
| `["append!!", "eduction"]`               |  17.701 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["append!!", "xf"]`                     |  17.800 μs (5%) |         |  64.72 KiB (1%) |          18 |
| `["cat", "base"]`                        |   1.850 μs (5%) |         |                 |             |
| `["cat", "xf"]`                          |   1.978 μs (5%) |         |                 |             |
| `["collect", "filter-missing"]`          | 107.800 μs (5%) |         | 345.31 KiB (1%) |       10015 |
| `["collect", "identity-float"]`          |  72.000 μs (5%) |         | 569.16 KiB (1%) |       10015 |
| `["collect", "identity-union"]`          | 322.002 μs (5%) |         | 704.95 KiB (1%) |       16656 |
| `["dict", "base"]`                       |   4.046 ms (5%) |         |  92.91 KiB (1%) |          22 |
| `["dict", "xf"]`                         |   4.176 ms (5%) |         |  92.36 KiB (1%) |          21 |
| `["dot", "blas"]`                        |   1.200 μs (5%) |         |                 |             |
| `["dot", "man"]`                         |   1.160 μs (5%) |         |                 |             |
| `["dot", "rf"]`                          |   2.144 μs (5%) |         |                 |             |
| `["dot", "xf"]`                          |   2.211 μs (5%) |         |   64 bytes (1%) |           3 |
| `["filter_map_map!", "man"]`             |  65.600 μs (5%) |         |                 |             |
| `["filter_map_map!", "xf"]`              | 696.503 μs (5%) |         |  304 bytes (1%) |          17 |
| `["filter_map_reduce", "man"]`           | 231.101 μs (5%) |         |                 |             |
| `["filter_map_reduce", "xf"]`            | 230.001 μs (5%) |         |                 |             |
| `["findall", "base"]`                    | 809.103 μs (5%) |         |   2.00 MiB (1%) |          21 |
| `["findall", "xf-array"]`                | 788.404 μs (5%) |         |   3.02 MiB (1%) |       98724 |
| `["findall", "xf-iter"]`                 |   3.196 ms (5%) |         |   9.63 MiB (1%) |      299916 |
| `["gemm", "fusedmul", "blas", "16"]`     |   4.273 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "2"]`      |   3.213 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "32"]`     |   5.794 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "blas", "8"]`      |   3.324 ms (5%) |         |                 |             |
| `["gemm", "fusedmul", "xf", "16"]`       |   5.283 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "2"]`        | 657.003 μs (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "32"]`       |  10.494 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "fusedmul", "xf", "8"]`        |   2.621 ms (5%) |         |  160 bytes (1%) |           6 |
| `["gemm", "mul", "linalg", "256"]`       | 903.504 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "32"]`        |   3.100 μs (5%) |         |                 |             |
| `["gemm", "mul", "linalg", "8"]`         | 200.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "256"]` |   1.686 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "32"]`  |   4.800 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "false", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "256"]` |   1.661 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "32"]`  |   4.000 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "ivdep", "8"]`   | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "256"]`  |   1.671 ms (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "32"]`   |   4.900 μs (5%) |         |                 |             |
| `["gemm", "mul", "man", "true", "8"]`    | 400.000 ns (5%) |         |                 |             |
| `["gemm", "mul", "xf", "false", "256"]`  |   1.686 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "32"]`   |   4.700 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "false", "8"]`    | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "256"]`  |   1.661 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "32"]`   |   3.800 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "ivdep", "8"]`    | 300.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "256"]`   |   1.693 ms (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "32"]`    |   4.900 μs (5%) |         |   48 bytes (1%) |           2 |
| `["gemm", "mul", "xf", "true", "8"]`     | 400.000 ns (5%) |         |   48 bytes (1%) |           2 |
| `["groupby", "sum", "sac"]`              | 255.501 μs (5%) |         | 313.14 KiB (1%) |       10007 |
| `["groupby", "sum", "xf-with-init"]`     | 181.901 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["groupby", "sum", "xf-without-init"]`  | 187.800 μs (5%) |         | 157.44 KiB (1%) |       10008 |
| `["mapcat_eduction", "base"]`            |   1.870 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-eduction"]`     |   1.920 μs (5%) |         |                 |             |
| `["mapcat_eduction", "xf-xf"]`           |   1.922 μs (5%) |         |                 |             |
| `["missing_argmax", "man"]`              |   2.678 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "rf"]`               |   3.189 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_argmax", "xf"]`               |   2.575 μs (5%) |         |   32 bytes (1%) |           1 |
| `["missing_dot", "equiv"]`               |   1.650 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "man"]`                 |   1.420 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "naive"]`               |   4.886 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf"]`                  |   1.390 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "rf_nota"]`             |   1.690 μs (5%) |         |   16 bytes (1%) |           1 |
| `["missing_dot", "xf"]`                  | 203.201 μs (5%) |         |  72.23 KiB (1%) |        3746 |
| `["missing_dot", "xf_nota"]`             | 208.401 μs (5%) |         |  71.89 KiB (1%) |        3730 |
| `["overhead", "foldl"]`                  |   4.700 ns (5%) |         |                 |             |
| `["overhead", "reduce_basecase"]`        | 179.736 ns (5%) |         |  416 bytes (1%) |           7 |
| `["partition_by", "man"]`                |   2.027 ms (5%) |         |  352 bytes (1%) |           4 |
| `["partition_by", "xf"]`                 |   3.062 ms (5%) |         |   6.10 MiB (1%) |      200007 |
| `["set", "base"]`                        |   4.852 ms (5%) |         |  49.58 KiB (1%) |          18 |
| `["set", "xf"]`                          |   4.471 ms (5%) |         |  49.63 KiB (1%) |          21 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["append!!"]`
- `["cat"]`
- `["collect"]`
- `["dict"]`
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
- `["mapcat_eduction"]`
- `["missing_argmax"]`
- `["missing_dot"]`
- `["overhead"]`
- `["partition_by"]`
- `["set"]`

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
       #1  2593 MHz      58567 s          0 s       1536 s      32891 s          0 s
       #2  2593 MHz      30634 s          0 s       1473 s      61024 s          0 s
       
  Memory: 6.791385650634766 GB (2655.95703125 MB free)
  Uptime: 952.0 sec
  Load Avg:  1.0029296875  1.0  0.71435546875
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

