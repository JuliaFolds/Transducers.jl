#!/bin/bash
# -*- mode: julia -*-
#=
JULIA="${JULIA:-julia --color=yes --startup-file=no}"
export JULIA_PROJECT="$(dirname ${BASH_SOURCE[0]})"

set -ex
${JULIA} -e 'using Pkg; Pkg.instantiate();
             Pkg.develop(PackageSpec(path=pwd()))'
exec ${JULIA} "${BASH_SOURCE[0]}" "$@"
=#

using Documenter, Transducers

makedocs(;
    modules=[Transducers],
    pages=[
        "Home" => "index.md",
        "Manual" => "manual.md",
        "Interface" => "interface.md",
        hide("Internals" => "internals.md"),
    ],
    repo="https://github.com/tkf/Transducers.jl/blob/{commit}{path}#L{line}",
    sitename="Transducers.jl",
    authors="Takafumi Arakaki",
    assets=[],
    strict=true,
)

deploydocs(;
    repo="github.com/tkf/Transducers.jl",
)
