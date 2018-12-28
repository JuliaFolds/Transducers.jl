using Documenter
using Transducers

transducers_makedocs(; kwargs...) =
    makedocs(;
        modules = [Transducers],
        pages = [
            "Home" => "index.md",
            "Manual" => "manual.md",
            "Interface" => "interface.md",
            hide("Internals" => "internals.md"),
        ],
        repo = "https://github.com/tkf/Transducers.jl/blob/{commit}{path}#L{line}",
        sitename = "Transducers.jl",
        authors = "Takafumi Arakaki",
        assets = [],
        root = @__DIR__,
        strict = true,
        kwargs...)
