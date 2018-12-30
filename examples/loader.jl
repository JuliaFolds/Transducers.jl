module TransducersExamplesLoaders

expath(parts...) = joinpath(@__DIR__, parts...)

exload(m, dir, file) = Base.include(m, expath(dir, file))

function exload(m, dir)
    for file in sort(filter(x -> endswith(x, ".jl"), readdir(expath(dir))))
        exload(m, dir, file)
    end
end

macro exload(args...)
    :(exload($(__module__), $(esc.(args)...)))
end

end  # module
