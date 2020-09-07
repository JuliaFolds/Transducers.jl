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
    if VERSION >= v"1.6.0-DEV.816"
        @warn "Ignoring ambiguities from `Base` to workaround JuliaLang/julia#36962"
        packages = [Transducers]
    else
        packages = [Transducers, Base]
    end
    Aqua.test_ambiguities(
        packages,
        exclude = [Base.get, Setfield.set, Setfield.modify, map!],
    )
end

# @testset "Unbound type parameters" begin
#     Aqua.test_unbound_args(Transducers)
# end

@testset "Undefined exports" begin
    Aqua.test_undefined_exports(Transducers)
end

@testset "Compare Project.toml and test/Project.toml" begin
    Aqua.test_project_extras(Transducers)
    @testset "... and test/environments/main/Project.toml" begin
        @test Text(read(joinpath(@__DIR__, "Project.toml"), String)) ==
            Text(read(joinpath(@__DIR__, "environments", "main", "Project.toml"), String))
    end
end

@testset "Stale dependencies" begin
    Aqua.test_stale_deps(Transducers)
end

end  # module
