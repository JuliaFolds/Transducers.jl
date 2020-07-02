module TestAppendBB

include("preamble.jl")

@testset "append!!(_, ::Eduction)" begin
    itr = eduction(y for x in 1:5 if isodd(x) for y in 1:x)
    @test append!!(Union{}[], itr) ==ₜ collect(itr)
    @test append!!([0.0], itr) ==ₜ pushfirst!(collect(Float64, itr), 0.0)
end

end  # module
