module TestLister

using Test
using Transducers: TransducerLister

@testset "show" begin
    @test show(devnull, "text/markdown", TransducerLister()) isa Any
    @test show(devnull, "text/plain", TransducerLister()) isa Any
    @test show(devnull, "text/html", TransducerLister()) isa Any
end

end  # module
