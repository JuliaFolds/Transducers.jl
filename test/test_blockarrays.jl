module TestBlockArrays

include("preamble.jl")
using BlockArrays

enumndim(size...) = collect(reshape(1:prod(size), size))

@testset "BlockVector" begin
    B = BlockArray(1:4, [1, 3])
    A = collect(B)
    @test collect(Map(identity), B) == A
end

@testset "BlockMatrix" begin
    B = BlockArray(enumndim(2, 3), [1, 1], [2, 1])
    A = collect(B)
    @test collect(Map(identity), B) == A[:]
end

@testset "BlockArray{T, 3}" begin
    B = BlockArray(enumndim(2, 3, 4), [1, 1], [2, 1], [1, 1, 2])
    A = collect(B)
    @test collect(Map(identity), B) == A[:]
end

end  # module
