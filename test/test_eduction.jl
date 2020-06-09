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
end

end  # module
