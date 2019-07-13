using PkgBenchmark
result = PkgBenchmark.readresults(joinpath(@__DIR__, "result.json"))

using Markdown
let io = IOBuffer()
    PkgBenchmark.export_markdown(io, result)
    seekstart(io)
    md = Markdown.parse(io)
    display(md)
end
