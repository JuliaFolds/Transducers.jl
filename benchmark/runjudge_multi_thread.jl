using PkgBenchmark

mkconfig(; kwargs...) =
    BenchmarkConfig(
        env = Dict(
            "JULIA_NUM_THREADS" => "2",
        );
        kwargs...
    )

progressoptions =
    if lowercase(get(ENV, "CI", "false")) == "true"
        (dt = 60 * 9.0,)
    else
        NamedTuple()
    end

benchdir = joinpath(@__DIR__, "multi-thread")

group_target = benchmarkpkg(
    dirname(@__DIR__),
    mkconfig(),
    script = joinpath(benchdir, "benchmarks.jl"),
    progressoptions = progressoptions,
    resultfile = joinpath(benchdir, "result-target.json"),
)

group_baseline = benchmarkpkg(
    dirname(@__DIR__),
    mkconfig(id = "master"),
    script = joinpath(benchdir, "benchmarks.jl"),
    progressoptions = progressoptions,
    resultfile = joinpath(benchdir, "result-baseline.json"),
)

judgement = judge(group_target, group_baseline)
