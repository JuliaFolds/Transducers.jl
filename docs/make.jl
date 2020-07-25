#!/bin/bash
# -*- mode: julia -*-
#=
JULIA="${JULIA:-julia --color=yes --startup-file=no}"
export JULIA_PROJECT="$(dirname ${BASH_SOURCE[0]})"

set -ex
${JULIA} -e 'using Pkg; Pkg.instantiate()'

export JULIA_LOAD_PATH="@"
exec ${JULIA} "${BASH_SOURCE[0]}" "$@"
=#

include("utils.jl")
import JSON
using Literate
using LiterateTest

include("../test/LoadAllPackages.jl")
LoadAllPackages.loadall(joinpath((@__DIR__), "Project.toml"))

import Random
Random.seed!(1234)

transducers_rm_duplicated_docs()
transducers_literate()
transducers_makedocs()
transducers_make_redirections()
deploydocs(;
    repo="github.com/JuliaFolds/Transducers.jl",
    push_preview = should_push_preview(),
)
