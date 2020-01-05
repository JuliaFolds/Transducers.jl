using PkgBenchmark
include("pprinthelper.jl")
benchdir = joinpath(@__DIR__, "multi-thread")
group_target = PkgBenchmark.readresults(joinpath(benchdir, "result-target.json"))
group_baseline = PkgBenchmark.readresults(joinpath(benchdir, "result-baseline.json"))
judgement = judge(group_target, group_baseline)

displayresult(judgement)

printnewsection("Target result")
displayresult(group_target)

printnewsection("Baseline result")
displayresult(group_baseline)
