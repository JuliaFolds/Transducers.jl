# Copied from
# https://github.com/tkf/Restacker.jl/blob/master/test/test_core.jl
module TestRestack

using Test
using Transducers: restack

struct ABC{A,B,C}
    a::A
    b::B
    c::C
end

function testlabel(x)
    n = 50
    s = repr(x)
    length(s) < n && return s
    label = join(Iterators.take(s, n))
    return string(label, "…")
end

@testset "$(testlabel(x))" for x in Any[
    nothing,
    missing,
    1,
    1.0,
    NaN,
    1+2im,
    :symbol,
    "string",
    Int,
    Array,
    Vector,
    Vector{Int},
    ABC,
    ABC{Int},
    ABC{Int,Int,Int},
    (nothing, missing, 1, 1.0, NaN, 1 + 2im, :symbol, "string"),
    (Val(1), Val(2), nothing, missing, undef),
    (
        a = (nothing, missing, 1, 1.0, NaN, 1 + 2im, :symbol, "string"),
        b = (Val(1), Val(2), nothing, missing, undef),
    ),
    ABC(
        (nothing, missing, 1, 1.0, NaN, 1 + 2im, :symbol, "string"),
        (Val(1), Val(2), nothing, missing, undef),
        (d = 1, e = ABC(1, 2, 3)),
    ),
]
    @test restack(x) === x
end

end  # module
