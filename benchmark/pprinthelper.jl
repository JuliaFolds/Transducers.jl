using PkgBenchmark
using Markdown

function displayresult(result)
    md = sprint(export_markdown, result)
    md = replace(md, ":x:" => "❌")
    md = replace(md, ":white_check_mark:" => "✅")
    display(Markdown.parse(md))
end

function printnewsection(name)
    println()
    println()
    println()
    printstyled("▃" ^ displaysize(stdout)[2]; color=:blue)
    println()
    printstyled(name; bold=true)
    println()
    println()
end
