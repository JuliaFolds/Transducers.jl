using BangBang: BangBang, append!!, collector, finish!
using Test
using Random
using SparseArrays: issparse, sparse
using Statistics: mean
using Transducers
using Transducers: Transducer, simple_transduce, Reduced, isexpansive,
    ZipSource, GetIndex, SetIndex, Inject, @~, IdentityTransducer,
    EmptyResultError, IdentityNotDefinedError, AbortIf, wheninit, @next,
    Reduction, BottomRF, Joiner, Splitter, Composition
using Logging: NullLogger, with_logger
using SplittablesBase: SplittablesBase

const DEPWARN_ERROR = !(Base.JLOptions().depwarn in (0, 1))

@nospecialize

"""
    ==ₜ(x, y)

Check that _type_ and value of `x` and `y` are equal.
"""
==ₜ(_, _) = false
==ₜ(x::T, y::T) where T = x == y

"""
    ==ₛ(a::AbstractString, b::AbstractString)

Equality check ignoring white spaces
"""
==ₛ(a::AbstractString, b::AbstractString) =
    replace(a, r"\s" => "") == replace(b, r"\s" => "")

prettytypeof(x) = prettytypeof(typeof(x))
prettytypeof(x::Type) = nameof(x)

inc(x) = x + oneunit(x)

isfiniteiter(iter) =
    Base.IteratorSize(iter) isa Union{Base.HasLength, Base.HasShape}

function iterator_variants(xs)
    iters = Any[xs]
    if !(xs isa Array) && isfiniteiter(xs)
        push!(iters, collect(xs))
    end
    push!(iters, Base.Generator(identity, xs))
    if !issparse(xs) && !any(ismissing, xs)
        # Currently not optimal at all, but it should work.
        if VERSION ≤ v"1.3-"
            push!(iters, sparse(xs))
        else
            # If `SparseArrays` does not support it (e.g.,
            # `sparse([""])` is not supported in Julia 1.3), don't
            # bother.  However, don't stop testing it if it is
            # re-supported again at some point.  So at least try:
            try
                push!(iters, sparse(xs))
            catch
            end
        end
    end
    return iters
end


macro expressions(ex)
    @assert ex isa Expr
    @assert ex.head == :block
    :([$([QuoteNode(a) for a in ex.args if a isa Expr]...)])
end


macro test_error(ex)
    quote
        let err = nothing
            try
                $(esc(ex))
            catch err
            end
            @test err isa Exception
            err
        end
    end
end


macro test_broken_if(cond, ex)
    ex = quote
        if $cond
            $Test.@test_broken $ex
        else
            $Test.@test $ex
        end
    end
    esc(ex)
end


macro test_inferred(ex)
    ex = quote
        $Test.@test (($Test.@inferred $ex); true)
    end
    esc(ex)
end


macro test_broken_inferred(ex)
    ex = quote
        $Test.@test_broken (($Test.@inferred $ex); true)
    end
    esc(ex)
end


function slow_test(f, title, limit)
    if lowercase(get(ENV, "TRANSDUCERS_JL_TEST_SKIP_SLOW", "false")) == "true"
        @info "Skipping $title"
        return
    end

    @info "Running $title. Limit: $limit min."

    code = """
    sleep(60)
    println("1 minute passed...")
    flush(stdout)
    for i in 2:$limit
        sleep(60)
        println("\$i minutes passed...")
        flush(stdout)
    end
    """
    # TODO: maybe terminate the parent process

    cmd = `$(Base.julia_cmd()) --startup-file=no -e $code`
    proc = run(pipeline(cmd, stdout=stdout), wait=false)

    try
        @time f()
    finally
        ch = Channel(ch -> wait(proc); csize=1)
        for _ in 1:10
            isready(ch) && break
            kill(proc)
            sleep(0.1)
        end
    end
    return
end

fcollect(ex::Transducers.Executor) = itr -> fcollect(itr, ex)
fcollect(itr, ex = PreferParallel()) =
    finish!(unreduced(transduce(
        Map(BangBang.SingletonVector),
        wheninit(collector, append!!),
        collector(),
        itr,
        ex,
    )))

foldxt_bs1(args...; kw...) = foldxt(args...; basesize = 1, kw...)
foldxd_bs1(args...; kw...) = foldxd(args...; basesize = 1, kw...)

function simple_reduce_impl(rf, init, itr, basesize)
    if SplittablesBase.amount(itr) < basesize
        return Transducers.foldl_nocomplete(rf, init, itr)
    end
    left, right = SplittablesBase.halve(itr)
    return Transducers.combine(
        rf,
        simple_reduce_impl(rf, init, left, basesize),
        simple_reduce_impl(rf, init, right, basesize),
    )
end

"""
    simple_reduce(rf, [xf,] itr; [init])

Single-threaded, to-be-reference implementation of `reduce`.
"""
function simple_reduce(rf, itr; init = Transducers.DefaultInit, basesize = 2)
    acc = simple_reduce_impl(rf, Transducers.start(rf, init), itr, basesize)
    acc = Transducers.complete(rf, acc)
    if acc isa Transducers.DefaultInitOf
        throw(Transducers.EmptyResultError(rf))
    end
    return acc
end

simple_reduce(rf, xf, itr; kwargs...) = simple_reduce(
    # TODO: it should be possible to implement this line with public API:
    reducingfunction(xf, Completing(Transducers._asmonoid(rf))),
    itr;
    kwargs...,
)

function random_basesize(itr)
    n = SplittablesBase.amount(itr)
    if n >= 3
        return rand(3:n)
    else
        # return rand(1:2)  # TODO: this should work
        return 2
    end
end

# For reducing functions with _exactly_ associative inner-most
# semigroup, this should yield same result always
random_reduce(rf, xf, itr; kwargs...) =
    simple_reduce(rf, xf, itr; kwargs..., basesize = random_basesize(itr))

random_reduce(rf, itr; kwargs...) =
    simple_reduce(rf, itr; kwargs..., basesize = random_basesize(itr))

inprocess_folds() = [
    foldl,
    foldxl,
    simple_reduce,
    random_reduce,
    # Folds using `ThreadedEx`:
    foldxt_bs1,
    foldxt,
]

all_folds() = [
    inprocess_folds()...,
    # Folds using `DistributedEx`:
    foldxd_bs1,
    foldxd,
]

@specialize
