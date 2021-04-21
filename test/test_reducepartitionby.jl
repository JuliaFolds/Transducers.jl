module TestReducePartitionBy
include("preamble.jl")
using BangBang: append!!
using DataTools: inc1
using MicroCollections: vec0, vec1

@testset for ex in [
    SequentialEx(),
    PreferParallel(basesize = 1),
    PreferParallel(basesize = 2),
    PreferParallel(basesize = 3),
    PreferParallel(),
]
    count_partitionby(f, xs) = xs |> ReducePartitionBy(f, Completing(inc1)) |> fcollect(ex)
    collect_partitionby(f, xs) =
        xs |> ReducePartitionBy(f, Map(vec1)'(Completing(append!!)), vec0()) |> fcollect(ex)
    view_partitionby(f, xs::AbstractArray) = xs |> PartitionBy(f) |> fcollect(ex)

    @test count_partitionby(x -> x ÷ 3, 1:6) == [2, 3, 1]
    @test collect_partitionby(x -> x ÷ 3, 1:6) == [1:2, 3:5, 6:6]
    @test view_partitionby(x -> x ÷ 3, 1:6) == [1:2, 3:5, 6:6]
end

@testset "array_partitionby" begin
    @test PartitionBy(identity)(1:3) === Transducers.array_partitionby(identity, 1:3)
    # Test for Julia < 1.3:
    @test 1:3 |> PartitionBy(identity) === Transducers.array_partitionby(identity, 1:3)
end

end  # module
