using Test
using Random
using SparseArrays: issparse, sparse
using Statistics: mean
using Transducers
using Transducers: Transducer, simple_transduce, Reduced, isexpansive,
    TeeZip, GetIndex, SetIndex, Inject, @~,
    EmptyResultError, IdentityNotDefinedError, AbortIf, @next
using InitialValues: Init
using Logging: NullLogger, with_logger

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
