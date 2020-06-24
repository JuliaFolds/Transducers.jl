module TestProgress
include("preamble.jl")

using Test: collect_test_logs
using Logging: LogLevel

const ProgressLevel = LogLevel(-1)

function test_only_one_progress(f)
    logs, = collect_test_logs(f, min_level = ProgressLevel)
    ps = [get(l.kwargs, :progress, nothing) for l in logs]
    @test any(isa.(ps, Real))
    @test "done" in ps
    @test length(unique([l.id for l in logs])) == 1
end

@testset "foldl" begin
    test_only_one_progress() do
        @test foldl(+, withprogress(1:100; interval=0)) == 5050
    end
end

@testset "sum" begin
    test_only_one_progress() do
        @test sum(withprogress(1:100; interval=0)) == 5050
    end
end

end  # module
