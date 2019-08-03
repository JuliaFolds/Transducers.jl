module BenchMissingArgmax

using BenchmarkTools
using Transducers

function manual_missing_argmax(xs)
    v = typemin(Base.nonmissingtype(eltype(xs)))
    n = 0
    @inbounds @simd for i in eachindex(xs)
        x = xs[i]
        if x !== missing
            if x > v
                v = x
                n = i
            end
        end
    end
    return n, v
end

random_missings(n = 10^3, th=2) = [abs(x) > th ? missing : x for x in randn(n)]

argext_step(should_update) =
    (old, (index, value)) ->
        if old === nothing || should_update(old[2], value)
            (index, value)
        else
            old
        end

xf_scanext(should_update) = Scan(argext_step(should_update), nothing)

xf_argmax = Enumerate() |>
    OfType(Tuple{Integer, Number}) |>
    xf_scanext(<)

suite = BenchmarkGroup()

let xs = randn(10)
    @assert manual_missing_argmax(xs)[1] == argmax(xs)
end

let xs = random_missings()
    @assert manual_missing_argmax(xs) == foldl(right, eduction(xf_argmax, xs))
end

suite["xf"] = @benchmarkable(
    foldl(right, ed; init=nothing),
    setup=(ed = eduction(xf_argmax, random_missings())))

rf = reducingfunction(
    xf_argmax,
    right;
    # simd = true,
)
suite["rf"] = @benchmarkable(
    transduce($rf, nothing, xs),
    setup=(xs = random_missings()))

suite["man"] = @benchmarkable(
    manual_missing_argmax(xs),
    setup=(xs = random_missings()))

end  # module
BenchMissingArgmax.suite
