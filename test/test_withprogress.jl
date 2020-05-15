module TestWithprogress
include("preamble.jl")

@testset "traits" begin
    @test Base.IteratorSize(withprogress(1:10)) == Base.HasShape{1}()
    @test length(withprogress(1:10)) == 10
    @test Base.IteratorEltype(withprogress(1:10)) == Base.HasEltype()
    @test eltype(withprogress(1:10)) == Int
end

end  # module
