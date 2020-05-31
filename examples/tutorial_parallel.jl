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
# `length(xs) ≥ 100_000` for this transducer and reducing function.)

# ### Process-based parallelism

using Distributed
#md addprocs(4)

dreduce(+, Map(sin), xs)

# (Note: there is likely no speedup for light-weight computation and
# large input data like this, when using `dreduce`.)

# ### Parallel processing with iterator comprehensions

# You can also use [`eduction`](@ref) to use iterator comprehension
# with multi-thread `reduce`:

reduce(+, eduction(sin(x) for x in xs if abs(x) < 1); basesize = 500_000)

#-

if VERSION >= v"1.3"                                                   #src
@test 36 ==                                                            #src
reduce(+, eduction(x * y for x in 1:3, y in 1:3))
end                                                                    #src

# You can omit `eduction` when using Transducers.jl-specific functions
# like [`tcollect`](@ref)/[`dcollect`](@ref):

tcollect(sin(x) for x in xs if abs(x) < 1)

# and [`tcopy`](@ref)/[`dcopy`](@ref):

using StructArrays: StructVector
table = StructVector(a = [1, 2, 3], b = [5, 6, 7])

@test StructVector(A = [2, 4], B = [4, 6]) ==                          #src
tcopy((A = row.a + 1, B = row.b - 1) for row in table if isodd(row.a))

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

# ## [Example: parallel `collect`](@id tutorial-parallel-collect)
#
# !!! note
#     This section explains the _implementation ideas_ of parallel
#     `collect`.  Pre-defined functions such as [`tcopy`](@ref) and
#     [`dcopy`](@ref) should cover many use-cases.
#
# Suppose (pretend) there is a compute-heavy transducer:

xf_compute = opcompose(Filter(!ismissing), Map(x -> x^2))
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

singleton_vector(x) = [x]
y2 = reduce(append!!, xs |> xf_compute |> Map(singleton_vector))
@assert y1 == y2

# This code illustrates the common pattern in parallel processing:
#
# 1. Put a result from the transducer in a "singleton solution".
#    Here, it is `[x]`.
#
# 2. Then "merge" the (singleton) solution into the exsiting one.
#    This is done by `append!!` in the above example.

# To illustrate how `reduce(append!!, xs |> ... |>
# Map(singleton_vector))` works, let's create a reducing function that
# records the arguments and returned values of `append!!`:

chan = Channel(Inf)

function append_and_log!!(a, b)
    # As arguments and output may be mutated later, we use `copy` to
    # record the snapshots of their values at this moment:
    #+
    a0 = copy(a)
    b0 = copy(b)
    c = append!!(a, b)
    put!(chan, (a0, b0) => copy(c))
    return c
end
nothing                                                              # hide

# This function can be used instead of `append!!`.  Let's try simpler
# and shorter example.  This is equivalent to `collect(1:4)`:

reduce(append_and_log!!, Map(singleton_vector), 1:4; basesize = 1, init = Union{}[])

# (See below for why we are using `init = Union{}[]` here.)
#
# Here is the list of arguments and returned value of `append!!` in
# this reduction:

records = Pair[]
while isready(chan)
    push!(records, take!(chan))
end
if VERSION >= v"1.3"                                                   #src
    @test Set(records) == Set([                                        #src
        (Union{}[], [1]) => [1],                                       #src
        (Union{}[], [2]) => [2],                                       #src
        (Union{}[], [3]) => [3],                                       #src
        (Union{}[], [4]) => [4],                                       #src
        ([1], [2]) => [1, 2],                                          #src
        ([3], [4]) => [3, 4],                                          #src
        ([1, 2], [3, 4]) => [1, 2, 3, 4],                              #src
    ])                                                                 #src
end                                                                    #src
records

# This recorded inputs and outputs of `append!!` show that its "call
# tree" is:
#
# ```
#           [1,2,3,4] <------------- append!!([1,2], [3,4]) == [1,2,3,4]
#          /         \
#     [1,2]           [3,4] <------- append!!([3], [4]) == [3, 4]
#    /     \         /     \
#  [1]     [2]     [3]     [4] <---- append!!([], [4]) == [4]
#  / \     / \     / \     / \
# [] [1]  [] [2]  [] [3]  [] [4]
# ```
#
# Compare this to the example `a + b + c + d` above.

# ### Optimization and generic container handling
#
# Above usage of `reduce` is not quite efficient as `singleton_vector`
# allocates small objects in the heap.  Thus, it makes sense to use
# immutable objects for the singleton solutions so that Julia compiler
# can eliminate allocation of the intermediate singleton solutions.
# Here, this can be done by simply using `SVector`instead of
# `singleton_vector`:

using StaticArrays: SVector

y3 =                                                                   #src
reduce(append!!, Map(SVector), 1:4)
@test y3 isa SVector                                                    #src
@test y3 == 1:4                                                        #src

# However, notice that the return value is a static vector.  This is
# not ideal when the input collection is large.  The output collection
# type can be specified by `init`.  We can simply use `init =
# Union{}[]` in this case:

y4 =                                                                   #src
reduce(append!!, Map(SVector), 1:4; init = Union{}[])
@test y4 isa Vector                                                     #src
@test y4 == 1:4                                                        #src

# Note that passing `Vector` to `init` of `reduce` is usually a wrong
# choice as it would mean that the same object is simultaneously
# mutated by different threads.  However, since `Vector{Union{}}`
# cannot have any element (as there is no object of type `Union{}`),
# using `Union{}[]` for `init` is an exception and it is a good way to
# indicate that output vector should use the "smallest" `eltype`
# required.  That is to say, `append!!` widens the vector "just
# enough" to fit the resulting elements.
#
# For generic containers (e.g., various table types), use
# [`BangBang.Empty`](https://juliafolds.github.io/BangBang.jl/dev/#BangBang.NoBang.singletonof-Union{Tuple{T},%20Tuple{Type{T},Any}}%20where%20T)
# as the empty initial value.  This is useful for creating a table
# object such as
# [`DataFrame`](https://github.com/JuliaData/DataFrames.jl) as the
# result of parallel processing:

using BangBang: Empty
using DataFrames: DataFrame

y5 =                                                                 # hide
reduce(append!!, Map(x -> SVector((a = x,))), 1:4; init = Empty(DataFrame))
Text(y5)                                                             # hide
@test y5 isa DataFrame                                                  #src
@test y5.a == 1:4                                                      #src

# It is slightly more tricky to make this approach work with other
# table types such as
# [`StructArrays`](https://github.com/JuliaArrays/StructArrays.jl) and
# [`TypedTables`](https://github.com/JuliaData/TypedTables.jl).  Use
# [`tcopy`](@ref) or [`dcopy`](@ref) to work with generic containers.

#src It doesn't work:
#src
#src # Similar approach works with
#src # [`StructArrays.StructVector`](https://github.com/JuliaArrays/StructArrays.jl):
#src
#src using StructArrays: StructVector
#src
#src y6 =                                                                   #src
#src reduce(append!!, Map(x -> SVector((a = x,))), 1:4; init = Empty(StructVector))
#src @test y6 is StructVector                                               #src
#src @test y6.a == 1:4                                                      #src
#src
#src # or [`TypedTables.Table`](https://github.com/JuliaData/TypedTables.jl):
#src
#src using TypedTables: Table
#src
#src y7 =                                                                   #src
#src reduce(append!!, Map(x -> SVector((a = x,))), 1:4; init = Empty(Table))
#src @test y7 is Table                                                      #src
#src @test y7.a == 1:4                                                      #src
#src
#src # or any type that can be constructed from a
#src # [table](https://github.com/JuliaData/Tables.jl) and behaves like a
#src # vector (e.g., support `push` and `vcat`).

# ## Example: ad-hoc histogram

# Following example counts number of occurrence of each leading digit
# in a distribution of random numbers.  First, let's create "singleton
# solutions" using transducers:

xf = opcompose(
    Map(abs),
    Filter(x -> x > 1),
    Map() do x
        y = digits(floor(Int, x))[end]
        Dict(y => 1)
    end,
)
nothing                                                              # hide

# The singleton solutions can be merged using `merge!(+, a, b)`:

merge₊!(a, b) = merge!(+, a, b)
## merge₊! = mergewith!(+)  # in Julia >= 1.5
nothing                                                              # hide

# Note that it is OK to use in-place function `merge!` here because
# the dictionary passed as `a` is created by `xf` and not shared by
# anyone.  When there is no such guarantee, passing [`init =
# OnInit(Dict{Int,Int})`](@ref OnInit) is a good option.  Note that
# passing `init = Dict{Int,Int}()` to `reduce` is not correct as
# multiple tasks would share and try to mutate the same dictionary
# this way.

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

xf2 = opcompose(
    Map(abs),
    Filter(x -> x > 1),
    Map() do x
        y = digits(floor(Int, x))[end]
        ntuple(i -> i == y, 9)
    end,
)

counts3 = reduce(xf2, xs; init=ntuple(_ -> 0, 9)) do a, b
    map(+, a, b)
end
@assert Dict(zip(1:9, counts3)) == counts1

# Note that, as tuples are immutable, it is valid to pass it as `init`
# of `reduce`.

# ## Example: early termination

# Find the _first_ element that is multiple of three:

ans =                                                                  #src
reduce(ReduceIf(x -> x % 3 == 0), 1:10; init = nothing, basesize = 1) do _, x
    ## # Uncomment for demo:
    ## x == 3 ? sleep(0.1) : @show x  # give other tasks a chance to finish first
    return x
end
@test ans == 3                                                         #src

# This snippet always returns `3`, even though the reductions for `c =
# 6` and `c = 9` may finish first.
