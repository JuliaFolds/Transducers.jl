using Documenter
using Transducers
# Not importing `Literate` here so that this file can be included from
# test.

EXAMPLE_PAGES = [
    "Writing transducers" => "examples/transducers.md",
    "Writing reducibles" => "examples/reducibles.md",
    "Parallel word count" => "examples/words.md",
]

function transducers_literate(;
        inputbase = joinpath(@__DIR__, "..", "examples"),
        outputbase = joinpath(@__DIR__, "src", "examples"),
        examples = EXAMPLE_PAGES,
        kwargs...)
    for (_, outpath) in examples
        name, = splitext(basename(outpath))
        inputfile = joinpath(inputbase, "$name.jl")
        outputdir = outputbase
        Literate.markdown(
            inputfile, outputdir;
            documenter = true,
            kwargs...)
    end
end

transducers_makedocs(;
        examples = EXAMPLE_PAGES,
        kwargs...) =
    makedocs(;
        modules = [Transducers],
        pages = [
            "Home" => "index.md",
            "Manual" => "manual.md",
            "Interface" => "interface.md",
            hide("Internals" => "internals.md"),
            "Examples" => examples,
        ],
        repo = "https://github.com/tkf/Transducers.jl/blob/{commit}{path}#L{line}",
        sitename = "Transducers.jl",
        authors = "Takafumi Arakaki",
        assets = [],
        root = @__DIR__,
        strict = true,
        kwargs...)
