using PkgBenchmark
group_target = PkgBenchmark.readresults(joinpath(@__DIR__, "result-target.json"))
group_baseline = PkgBenchmark.readresults(joinpath(@__DIR__, "result-baseline.json"))

judgement = judge(group_target, group_baseline)

using Markdown
let io = IOBuffer()
    PkgBenchmark.export_markdown(io, judgement)
    seekstart(io)
    md = Markdown.parse(io)
    display(md)
end
