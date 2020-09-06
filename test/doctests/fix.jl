import LoadAllPackages
LoadAllPackages.loadall(joinpath((@__DIR__), "..", "Project.toml"))
using Documenter: doctest
doctest((@__DIR__), Module[]; fix = true)
