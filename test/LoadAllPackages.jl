module LoadAllPackages

using Base: PkgId, UUID
using Pkg: Pkg, TOML

function loadall(project = Base.active_project())
    deps = get(TOML.parsefile(project), "deps", nothing)
    deps === nothing && return
    @info "Loading $(length(deps)) packages..."
    t0 = time_ns()
    for (name, uuid) in deps
        pkg = PkgId(UUID(uuid), name)
        @debug "Loading `$pkg`..."
        Base.require(pkg)
        @debug "`$pkg` loaded."
    end
    sec = (time_ns() - t0) / 10^9
    @info "$(length(deps)) packages loaded in $sec seconds"
    return
end

end
