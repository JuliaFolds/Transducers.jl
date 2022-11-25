module TestEduction

using Test
using Transducers

@testset "composition" begin
    ed1 = eduction(Map(sin), 1:2)
    ed2 = eduction(Map(cos), ed1)
    ed3 = eduction(Map(tan), ed2)
    @test Transducer(ed1) === Map(sin)
    @test Transducer(ed2) === opcompose(Map(sin), Map(cos))
    @test Transducer(ed3) === opcompose(Map(sin), Map(cos), Map(tan))
    @test eduction(Map(cos), eduction(Map(sin), 1:2)) ===
          eduction(opcompose(Map(sin), Map(cos)), 1:2)
    @test collect(eduction(x^2 for x in 1:2)) == collect(eduction(Map(x -> x^2), 1:2))
    @test eduction(ed1) === ed1 
end

end  # module
