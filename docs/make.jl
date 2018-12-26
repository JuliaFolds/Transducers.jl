using Documenter, Transducers

makedocs(;
    modules=[Transducers],
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/tkf/Transducers.jl/blob/{commit}{path}#L{line}",
    sitename="Transducers.jl",
    authors="Takafumi Arakaki",
    assets=[],
)

deploydocs(;
    repo="github.com/tkf/Transducers.jl",
)
