# # [Parallel processing tutorial](@id tutorial-parallel)
#
# See also: [Overview of parallel processing in Transducers.jl](@ref
# overview-parallel)

using Test                                                             #src

# ## Quick examples
# ### Sequential processing
using Transducers

xs = randn(10_000_000)
foldl(+, Map(sin), xs)

# ### Thread-based parallelism

# Just replace `foldl` with `reduce`, to make use of multiple cores:

reduce(+, Map(sin), xs)

# (In my laptop (4 core machine) I start seeing some speedup around
# `length(xs) ≥ 100_000` for this transducers and reducing function.)

# ### Process-based parallelism

using Distributed
#md addprocs(4)

dreduce(+, Map(sin), xs)

# (Note: there is likely no speedup for light-weight computation and
# large input data like this, when using `dreduce`.)

# ## When can I use `reduce` and `dreduce`?

# ### Requirement 1: Associative reducing step function
#
# Parallel reductions such as [`reduce`](@ref) and [`dreduce`](@ref)
# requires _associative_ [reducing step function](@ref Glossary).
# Recall that
# [associativity](https://en.wikipedia.org/wiki/Associative_property)
# means that the _grouping_ of evaluations of binary operator does not
# matter:

op = +  # for example
a, b, c = 1, 2, 3  # for example

@assert op(op(a, b), c) == op(a, op(b, c))

# Given this property, computations like `a + b + c + d` can be done
# with different "groupings":
#
# ```
#   a + b + c + d
#
# = ((a + b) + c) + d                +
#                                   / \
#                                  +   d
#                                 / \
#                                +   c           foldl-like grouping
#                               / \
#                              a   b
#
# = (a + b) + (c + d)                +
#                                   / \
#                                  /   \
#                                 /     \        reduce-like grouping
#                                +       +
#                               / \     / \
#                              a   b   c   d
# ```
#
# Notice that, in the last grouping, computation of `c + d` does not
# have to wait for the result of `a + b`.  This is why we need
# associativity for parallel execution.
#
# !!! note
#     Do not confuse associativity with _commutativity_ `op(a, b) =
#     op(b, a)`.  For example, matrix multiplication `*(::Matrix,
#     ::Matrix)` is associative but _not_ commutative in general.
#     However, since `reduce` only requires associativity, it is valid
#     to use `reduce(*, xf, matrices)`.

# As reducing function `+` is associative, it can be used with
# `reduce` (and `dreduce`):

y1 =                                                                   #src
reduce(+, Map(identity), 1:10; init = 0, basesize = 1)

# and the result is the same as the sequential version:

y2 =                                                                   #src
foldl(+, Map(identity), 1:10; init = 0)
@test y1 == y2                                                         #src

# Note: `basesize` is for forcing `reduce` to avoid falling back to
# `foldl` for small length container such as `1:10`.

# On the other hand, binary function `-` is not associative.  Thus,
# `reduce` cannot be used instead of `foldl` (they produce different
# result):

y3 =                                                                   #src
reduce(-, Map(identity), 1:10; init = 0, basesize = 1)
#-

y4 =                                                                   #src
foldl(+, Map(identity), 1:10; init = 0)
@test y3 != y4                                                         #src

# ### Requirement 2: stateless transducers

# Parallel reduction only work with stateless transducers
# [`Map`](@ref), [`Filter`](@ref), [`Cat`](@ref), etc. and you will
# get an error when using stateful transducers such as `Scan` with
# `reduce` or `dreduce`:

err = try                                                            # hide
reduce(+, Scan(+), 1:10; basesize = 1)
catch err; err; end                                                  # hide
@test occursin(                                                        #src
    "Stateful transducer Scan(+) does not support `combine`",          #src
    sprint(showerror, err),                                            #src
)                                                                      #src
#md print(stdout, "ERRPR: ")                                         # hide
#md showerror(stdout, err)                                           # hide

# Stateful transducers cannot be used with `reduce` because it is
# impossible to start processing input collection from the middle when
# the transducers need to know all previous elements (= stateful).
#
# [`ScanEmit`](@ref) is a stateful transducer but it is assumed that
# it is used in a context that outputs can be treated as stateless
# (see: [Splitting a string into words and counting them in
# parallel](@ref parallel-word-count)).

# ## Example: parallel `collect`

# Suppose (pretend) there is a compute-heavy transducer:

xf_compute = Filter(!ismissing) |> Map(x -> x^2)
nothing                                                              # hide

# Transducers.jl supports applying this to an input container and then
# collecting the results into another container.  It can be done
# sequentially ([`collect`](@ref), [`copy`](@ref), etc.) and in
# parallel using threads ([`tcollect`](@ref), [`tcopy`](@ref)) or
# using multiple processes ([`dcollect`](@ref), [`dcopy`](@ref)).  For
# example:

xs = [abs(x) > 1 ? missing : x for x in randn(10_000)]
y1 = collect(xf_compute, xs)
nothing                                                              # hide

# Doing this in parallel is as easy as using `tcollect` or `dcollect`.
# However, it is easy to do this manually, too:

using BangBang: append!!
using StaticArrays: SVector

y2 = reduce(append!!, xf_compute |> Map(SVector), xs; init = Union{}[])
@assert y1 == y2

# This code illustrates the common pattern in parallel processing:
#
# 1. Put a result from the transducer in a "singleton solution".
#    Here, it is a `SVector`.
#
# 2. Then "merge" the (singleton) solution into the exsiting one.
#    This is done by `append!!` in the above example.
#
# Due to symmetry in the signature of the reducing step function `op`
# used for `reduce` (e.g., `+` and `append!!`; when ignoring mutation
# for `append!!`), it can be used for merging the singleton solutions
# directly passed from transducers as well as the "chunks" of results
# (e.g., `a + b` and `c + d` in the illustration above).  This is why
# `append!!` is used for parallel `collect` instead of `push!!`.
#
# Reducing step function `op` for `reduce` often requires explicit
# initial value (i.e., keyword argument `init`).  In above example,
# omitting `init` would produce a long `SVector` that is impractical
# use; that's why `init = Union{}[]` is required.  Note that passing
# `Vector` to `init` of `reduce` is usually a wrong choice.  However,
# since `Vector{Union{}}` cannot have any element (as there is no
# object of type `Union{}`), `Union{}[]` is an exception and a good
# initial value to indicate that output vector should use the
# "smallest" `eltype` required.  That is to say, `append!!` widens the
# vector "just enough" to fit the resulting elements.
#
# For generic containers (e.g., various table types), use
# [`BangBang.Empty`](https://tkf.github.io/BangBang.jl/dev/#BangBang.NoBang.singletonof-Union{Tuple{T},%20Tuple{Type{T},Any}}%20where%20T)
# as the empty initial value.

# ## Example: ad-hoc histogram

# Following example counts number of occurrence of each leading digit
# in a distribution of random numbers.  First, let's create "singleton
# solutions" using transducers:

xf = Map(abs) |>
    Filter(x -> x > 1) |>
    Map() do x
        y = digits(floor(Int, x))[end]
        Dict(y => 1)
    end
nothing                                                              # hide

# The singleton solutions can be merged using `merge!(+, a, b)`.  Note
# that we need to cover the "edge cases" where the first and/or second
# arguments are the initial values.  Note that passing `init =
# Dict{Int,Int}()` to `reduce` is not correct as multiple tasks would
# share and try to mutate the same dictionary this way.  One option is
# to use [`init = OnInit(Dict{Int,Int})`](@ref OnInit).  Another
# option is to use
# [`asmonoid`](https://tkf.github.io/InitialValues.jl/dev/#InitialValues.asmonoid)
# for handling the initial values:

using InitialValues: asmonoid
merge₊! = asmonoid((a, b) -> merge!(+, a, b))
nothing                                                              # hide

# Let's try this with some random data:

xs = 1_000_000 * randn(10_000_000)
counts1 = reduce(merge₊!, xf, xs)
nothing                                                              # hide

# Compare the result with `foldl`:
counts2 = foldl(merge₊!, xf, xs)
@assert counts1 == counts2

# Hopefully the result is close to the [Benford's law -
# Wikipedia](https://en.wikipedia.org/wiki/Benford%27s_law):
let n = sum(values(counts1))
    sort!(keys(counts1) .=> values(counts1) ./ n)
end

# Since we are counting only nine elements, it is actually better to
# use fixed-size container such as a tuple in this case:

xf2 = Map(abs) |>
    Filter(x -> x > 1) |>
    Map() do x
        y = digits(floor(Int, x))[end]
        ntuple(i -> i == y, 9)
    end

counts3 = reduce(xf2, xs; init=ntuple(_ -> 0, 9)) do a, b
    map(+, a, b)
end
@assert Dict(zip(1:9, counts3)) == counts1

# Note that, as tuples are immutable, it is valid to pass it as `init`
# of `reduce`.

# ## Example: early termination

# Find the _first_ element that is multiple of three:

ans =                                                                  #src
reduce(Map(x -> x % 3 == 0 ? x : nothing), 1:10; init = nothing, basesize = 1) do a, b
    c = something(a, b, Some(nothing))

    ## # Uncomment for demo:
    ## c == 3 && sleep(0.1)  # give other tasks a chance to finish first
    ## c === nothing || @show c

    c === nothing ? nothing : reduced(c)
end
@test ans == 3                                                         #src

# This snippet always returns `3`, even though the reductions for `c =
# 6` and `c = 9` may finish first.
