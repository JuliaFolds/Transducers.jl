module BenchMissingDot

using BenchmarkTools
using Transducers

function manual_missing_dot(x, y)
    acc = zero(eltype(x))
    @inbounds for i = eachindex(x)
        xi = x[i]  # this helps type inference
        yi = y[i]
        # Nested if helps type inference:
        if !(xi isa Missing)
            if !(yi isa Missing)
                acc += xi * yi
            end
        end
    end
    return acc
end

function equiv_missing_dot(x, y)
    acc = zero(eltype(x))
    @inbounds for i = eachindex(x)
        xy = x[i] * y[i]
        if !(xy isa Missing)
            acc += xy
        end
    end
    return acc
end

function naive_missing_dot(x, y)
    acc = zero(eltype(x))
    @inbounds for i = eachindex(x)
        if !(x[i] isa Missing) && !(y[i] isa Missing)
            acc += x[i] * y[i]
        end
    end
    return acc
end

random_missings(n::Int, th=2) = [abs(x) > th ? missing : x for x in randn(n)]

suite = BenchmarkGroup()

n = 10^3
let xs = random_missings(n)
    ys = random_missings(n)
    @assert manual_missing_dot(xs, ys) == foldl(
        +,
        eduction(
            OfType(Tuple{Vararg{Number}}) |> MapSplat(*),
            zip(xs, ys)))
end

suite["xf_nota"] = @benchmarkable(
    foldl(+, ed),
    setup=(ed = eduction(
        MapSplat(*) |> NotA(Missing),
        zip(random_missings.(($n, $n))...))))

suite["xf"] = @benchmarkable(
    foldl(+, ed),
    setup=(ed = eduction(
        OfType(Tuple{Vararg{Number}}) |> MapSplat(*),
        zip(random_missings.(($n, $n))...))))

# This is a bit "cheating" since it's using non-public API.  It is
# just to show the lower-bound of Transducers.jl runtime:
rf_nota = reducingfunction(
    MapSplat(*) |> NotA(Missing),
    +;
    # simd = true,
)
suite["rf_nota"] = @benchmarkable(
    transduce($rf_nota, 0.0, zs),
    setup=(zs = zip(random_missings.(($n, $n))...)))

rf_oftype = reducingfunction(
    OfType(Tuple{Vararg{Number}}) |> MapSplat(*),
    +;
    # simd = true,
)
suite["rf"] = @benchmarkable(
    transduce($rf_oftype, 0.0, zs),
    setup=(zs = zip(random_missings.(($n, $n))...)))

suite["man"] = @benchmarkable(
    manual_missing_dot(xs, ys),
    setup=((xs, ys) = random_missings.(($n, $n))))
suite["equiv"] = @benchmarkable(
    equiv_missing_dot(xs, ys),
    setup=((xs, ys) = random_missings.(($n, $n))))
suite["naive"] = @benchmarkable(
    naive_missing_dot(xs, ys),
    setup=((xs, ys) = random_missings.(($n, $n))))

end  # module
BenchMissingDot.suite
