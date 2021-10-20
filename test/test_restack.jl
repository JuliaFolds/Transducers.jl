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

struct CustomizedProperties{A,B,C}
    a::A
    b::B
    c::C
end

Base.getproperty(::CustomizedProperties, n::Symbol) = n

struct IncompleteInitialization{A,B}
    a::A
    b::B
    IncompleteInitialization{A,B}(a::A) where {A,B}= new{A,B}(a)
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
    CustomizedProperties(1, 2, 3),
    CustomizedProperties(1, 2, ABC(1, 2, CustomizedProperties(1, 2, 3))),
    IncompleteInitialization{Int,String}(2)
]
    @test restack(x) === x
end

@testset "CustomizedProperties" begin
    abc = CustomizedProperties(1, 2, 3)
    @test abc.a === :a
    @test getfield(abc, :a) === 1
end

end  # module
