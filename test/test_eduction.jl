module TestEduction

using Test
using Transducers

@testset "composition" begin
    ed1 = eduction(Map(sin), 1:2)
    ed2 = eduction(Map(cos), ed1)
    ed3 = eduction(Map(tan), ed2)
    @test Transducer(ed1) === Map(sin)
    @test Transducer(ed2) === Map(sin) |> Map(cos)
    @test Transducer(ed3) === Map(sin) |> Map(cos) |> Map(tan)
    @test eduction(Map(cos), eduction(Map(sin), 1:2)) ===
          eduction(Map(sin) |> Map(cos), 1:2)
    @test eduction(sin(x) for x in 1:2) === eduction(Map(sin), 1:2)
end

end  # module
