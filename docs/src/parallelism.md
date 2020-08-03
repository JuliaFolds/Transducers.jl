# [Overview of parallel processing in Transducers.jl](@id overview-parallel)

Transducers.jl supports thread-based ([`foldxt`](@ref)) and
process-based ([`foldxd`](@ref)) parallelisms with the same
composable API; i.e. transducers.  Having a uniform API to cover
different parallelisms as well as sequential processing
[`foldl`](@ref) is useful.  Using multiple cores or machines for your
computation is as easy as replacing `foldl` with `foldxt` or
`foldxd`; _you don't need to re-write your transducers or reducing
functions_.

See also:

* [Parallel processing tutorial](@ref tutorial-parallel) in
  Transducers.jl manual.
* API documentation of [`foldxt`](@ref) and [`foldxd`](@ref).

## Thread-based parallelism

!!! note
    To use multiple threads, the `julia` process must be started with
    appropriate environment variable `JULIA_NUM_THREADS`.  See Julia
    manual for more information about how to enable and verify
    multi-threading in Julia:

    * [Multi-Threading (Experimental) · Parallel Computing · The Julia Language](https://docs.julialang.org/en/latest/manual/parallel-computing/#man-multithreading-1)
    * [`JULIA_NUM_THREADS` · Environment Variables · The Julia Language](https://docs.julialang.org/en/latest/manual/environment-variables/#JULIA_NUM_THREADS-1)

Transducers.jl supports thread-based parallelism for Julia ≥ 1.0.  You
can use it by replacing [`foldl`](@ref) with [`foldxt`](@ref).  With
Julia ≥ 1.3, Transducers.jl supports _early termination_ to avoid
unnecessary computation while guaranteeing the result to be
_deterministic_; i.e., it does not depend on how computation tasks are
scheduled.

## Process-based parallelism

Transducers.jl supports process-based parallelism using
[Distributed.jl](https://docs.julialang.org/en/latest/stdlib/Distributed/).
You can use it by replacing [`foldl`](@ref) with [`foldxd`](@ref).
It can be used for horizontally scaling the computation.  It is also
useful for using external libraries that are not "thread-safe."

Note that
[early termination is not supported in `foldxd` yet](https://github.com/JuliaFolds/Transducers.jl/issues/88).
