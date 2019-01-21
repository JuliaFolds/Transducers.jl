using Test
using Random
using SparseArrays: issparse, sparse
using Statistics: mean
using Transducers
using Transducers: Transducer, simple_transduce, Reduced, isexpansive,
    TeeZip, GetIndex, SetIndex, Inject

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
        push!(iters, sparse(xs))
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

function slow_test(f, title, limit)
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
end
