module TestExamplesTutorialMissings
include("../examples/tutorial_missings.jl")

using Test

@testset "outtype of xf_sum_columns" begin
    @test eltype(eduction(xf_sum_columns(Float64[]), Any[])) ===
        Vector{Float64}
    @test eltype(eduction(xf_sum_columns(Float64[]), Any[])) <: Vector
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

@testset "slow compilation" begin
    # Excluding `missing` from the input vector seems to slows down
    # compilation a lot.
    slow_test("slow compilation test with xf_fullextrema", 20) do
        @test mapfoldl(xf_fullextrema(), right, [1.0, 3.0, -1.0, 2.0]) ==
            ((3, -1.0), (2, 3.0))
    end
    slow_test("slow compilation test with xf_argextrema", 20) do
        @test mapfoldl(xf_argextrema(), right, [1.0, 3.0, -1.0, 2.0]) ==
            (3, 2)
    end
end

end  # module
