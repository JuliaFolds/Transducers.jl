module TestAdapt

using Adapt
using Test
using Transducers
using Transducers: GetIndex, SetIndex

struct UseG end

struct F end
struct G end

const f = F()
const g = G()

Adapt.adapt_storage(::UseG, ::F) = g

@testset "shallow" begin
    @test adapt(UseG(), Map(f)) === Map(g)
    @test adapt(UseG(), MapSplat(f)) === MapSplat(g)
    @test adapt(UseG(), Filter(f)) === Filter(g)
    @test adapt(UseG(), GetIndex(f)) === GetIndex(g)
    @test adapt(UseG(), SetIndex(f)) === SetIndex(g)
end

@testset "reducing function" begin
    @test adapt(UseG(), Map(f)'(+)) === Map(g)'(+)
    @test adapt(UseG(), MapCat(f)'(+)) === MapCat(g)'(+)
    @test adapt(UseG(), opcompose(Filter(isodd), Map(f), NotA(Nothing))'(+)) ===
          opcompose(Filter(isodd), Map(g), NotA(Nothing))'(+)
    @test adapt(UseG(), opcompose(Filter(f), Map(f), NotA(Nothing))'(+)) ===
          opcompose(Filter(g), Map(g), NotA(Nothing))'(+)
end

end  # module
