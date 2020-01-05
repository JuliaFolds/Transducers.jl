if lowercase(get(ENV, "CI", "false")) == "true"
    @info "Executing in CI. Instantiating benchmark environment..."
    using Pkg
    Pkg.activate(@__DIR__)
    Pkg.instantiate()
end

using BenchmarkTools
SUITE = BenchmarkGroup()
for file in readdir(@__DIR__)
    if startswith(file, "bench_") && endswith(file, ".jl")
        SUITE[file[length("bench_") + 1:end - length(".jl")]] =
            include(file)
    end
end
