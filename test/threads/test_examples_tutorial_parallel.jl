module TestExamplesTutorialParallel

# It looks like `Channel` was not thread-safe before 1.2.
# * https://travis-ci.com/tkf/Transducers.jl/jobs/270458293
# * https://github.com/JuliaLang/julia/commit/961907977a57ae7b72ddb374e63341f3633a0f0a
if VERSION >= v"1.2"
    include("../../examples/tutorial_parallel.jl")
end

end  # module
