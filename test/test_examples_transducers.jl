module TestExamplesTransducers
include("preamble.jl")
include("../examples/transducers.jl")

@test eltype(addone_out1) === Int
@test length(recall_out1) == 5
@test length(recall_out2) == 5 + RandomRecall().history

end  # module
