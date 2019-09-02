# # Welford's algorithm
#
# * Welford, B. P. (1962). "Note on a method for calculating corrected sums of squares and products". Technometrics. 4 (3): 419–420. doi:10.2307/1266577. JSTOR 1266577
# * [Welford's online algorithm - Algorithms for calculating variance - Wikipedia](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance#Welford's_online_algorithm)


using Transducers
using Transducers: R_, start, next, complete, inner, xform, wrap, unwrap, wrapping

struct MeanVar <: Transducer
end


function Transducers.start(rf::R_{MeanVar}, result)
    private_state = (0, 0.0, 0.0)
    return wrap(rf, private_state, start(inner(rf), result))
end


function Transducers.next(rf::R_{MeanVar}, result, input)
    wrapping(rf, result) do st, iresult
        (n, μ, M2) = st
        n += 1
        δ = input - μ
        μ += δ/n
        δ2 = input - μ
        M2 += δ*δ2
        iinput = (μ, M2 / (n-1))
        iresult = next(inner(rf), iresult, iinput)
        return (n, μ, M2), iresult
    end
end

function Transducers.complete(rf::R_{MeanVar}, result)
    _private_state, inner_result = unwrap(rf, result)
    return complete(inner(rf), inner_result)
end

collect(MeanVar(),randn(10))

@time foldl(right, MeanVar(), 1:100)
