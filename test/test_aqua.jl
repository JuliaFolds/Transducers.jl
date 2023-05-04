module TestAqua

using Aqua
using Setfield
using Test
using Transducers

# https://github.com/JuliaCollections/DataStructures.jl/pull/511
to_exclude = [Base.get, Setfield.set, Setfield.modify, map!]

# These are needed because of a potential ambiguity with ChainRulesCore's mapfoldl on a Thunk.
# mapreduce is deprecated, so if we remove it, then that would solve this
push!(to_exclude, mapreduce)
if isdefined(Core, :kwcall)
    push!(to_exclude, Core.kwcall)
else
    push!(to_exclude, getproperty(Base, Symbol("#mapreduce##kw")))
end

Aqua.test_all(
    Transducers;
    ambiguities = (; exclude = to_exclude),
    unbound_args = false,  # TODO: make it work
)

@testset "Compare test/Project.toml and test/environments/main/Project.toml" begin
    @test Text(read(joinpath(@__DIR__, "Project.toml"), String)) ==
          Text(read(joinpath(@__DIR__, "environments", "main", "Project.toml"), String))
end

end  # module
