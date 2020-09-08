module TestAqua

using Aqua
using Setfield
using Test
using Transducers

Aqua.test_all(
    Transducers;
    # https://github.com/JuliaCollections/DataStructures.jl/pull/511
    ambiguities = (; exclude = [Base.get, Setfield.set, Setfield.modify, map!]),
    unbound_args = false,  # TODO: make it work
)

@testset "Compare test/Project.toml and test/environments/main/Project.toml" begin
    @test Text(read(joinpath(@__DIR__, "Project.toml"), String)) ==
          Text(read(joinpath(@__DIR__, "environments", "main", "Project.toml"), String))
end

end  # module
