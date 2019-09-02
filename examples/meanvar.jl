# # Welford's algorithm
#
# * Welford, B. P. (1962). "Note on a method for calculating corrected sums of squares and products". Technometrics. 4 (3): 419–420. doi:10.2307/1266577. JSTOR 1266577
# * [Welford's online algorithm - Algorithms for calculating variance - Wikipedia](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance#Welford's_online_algorithm)


using Transducers
using Transducers: R_, start, next, complete, inner, xform, wrap, unwrap, wrapping

struct MeanVar <: Transducer
end


function T.start(rf::T.R_{MeanVar}, result)
    private_state = (0, 0.0, 0.0)
    return T.wrap(rf, private_state, T.start(T.inner(rf), result))
end


function T.next(rf::T.R_{MeanVar}, result, input)
    T.wrapping(rf, result) do st, iresult
        (n, μ, M2) = st
        n += 1
        δ = input - μ
        μ += δ/n
        δ2 = input - μ
        M2 += δ*δ2
        iinput = (μ, M2 / (n-1))
        iresult = T.next(T.inner(rf), iresult, iinput)
        return (n, μ, M2), iresult
    end
end

function T.complete(rf::T.R_{MeanVar}, result)
    _private_state, inner_result = T.unwrap(rf, result)
    return T.complete(T.inner(rf), inner_result)
end

collect(MeanVar(),randn(10))

using BenchmarkTools
@btime foldl(right, MeanVar(), 1:100)

using StatsBase
@btime mean_and_var(1:100)
