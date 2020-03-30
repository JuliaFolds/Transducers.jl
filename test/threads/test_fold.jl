module TestFold

include("../preamble.jl")

@testset "$fold" for fold in [foldl, reduce, dreduce]
    @testset "IdentityTransducer" begin
        @test fold(+, IdentityTransducer(), 1:10) == sum(1:10)
    end
end

end  # module
