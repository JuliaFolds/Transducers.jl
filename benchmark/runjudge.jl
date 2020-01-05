using PkgBenchmark

mkconfig(; kwargs...) =
    BenchmarkConfig(
        env = Dict(
            "JULIA_NUM_THREADS" => "1",
            "OMP_NUM_THREADS" => "1",
        );
        kwargs...
    )

progressoptions =
    if lowercase(get(ENV, "CI", "false")) == "true"
        (dt = 60 * 9.0,)
    else
        NamedTuple()
    end

group_target = benchmarkpkg(
    dirname(@__DIR__),
    mkconfig(),
    progressoptions = progressoptions,
    resultfile = joinpath(@__DIR__, "result-target.json"),
)

group_baseline = benchmarkpkg(
    dirname(@__DIR__),
    mkconfig(id = "baseline"),
    progressoptions = progressoptions,
    resultfile = joinpath(@__DIR__, "result-baseline.json"),
)

judgement = judge(group_target, group_baseline)
