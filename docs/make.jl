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
using Literate

import Random
Random.seed!(1234)

transducers_literate()
transducers_makedocs()
deploydocs(;
    repo="github.com/tkf/Transducers.jl",
    push_preview = should_push_preview(),
)
