module TestAqua

using Aqua
using Setfield
using Test
using Transducers

# Aqua.test_all(  # TODO: make it work
#     Transducers;
#     # https://github.com/JuliaCollections/DataStructures.jl/pull/511
#     ambiguities=(exclude=[Base.get, Setfield.set, Setfield.modify],),
# )

@testset "Method ambiguity" begin
    Aqua.test_ambiguities(Transducers)
end

# @testset "Unbound type parameters" begin
#     Aqua.test_unbound_args(Transducers)
# end

@testset "Undefined exports" begin
    Aqua.test_undefined_exports(Transducers)
end

end  # module
