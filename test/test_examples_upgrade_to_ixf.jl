module TestExamplesUpgradeToIXF
using LiterateTest.AssertAsTest: @assert
if Base.JLOptions().depwarn != 2
    include("../examples/upgrade-to-ixf.jl")
end
end  # module
