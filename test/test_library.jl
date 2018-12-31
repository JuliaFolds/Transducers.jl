module TestLibrary
include("preamble.jl")
using Dates

@testset "Cat" begin
    # Inner transducer is stateful:
    @testset for xs in iterator_variants([1:5, 1:2])
        xf = DropWhile(x -> x < 3)
        @test collect(Cat() |> xf, xs) == collect(xf, vcat(xs...))
    end

    # Inner transducer is stateful and requires complete:
    @testset for xs in iterator_variants([1:5, 1:2])
        xf = PartitionBy(isequal(3)) |> Map(copy)
        @test collect(Cat() |> xf, xs) == collect(xf, vcat(xs...))
    end
end

@testset "MapCat" begin
    # https://clojuredocs.org/clojure.core/mapcat
    # (transduce (mapcat reverse) conj [[3 2 1 0] [6 5 4] [9 8 7]])
    @testset for xs in iterator_variants(
            [[3, 2, 1, 0], [6, 5, 4], [9, 8, 7]]
            )
        @test collect(MapCat(reverse), xs) == 0:9
    end
end

@testset "PartitionBy" begin
    # https://clojuredocs.org/clojure.core/partition-by#example-542692c7c026201cdc3269da
    xf = PartitionBy(isequal(3)) |> Map(copy)
    @testset for xs in iterator_variants(1:5)
        @test collect(xf, xs) == [[1, 2], [3], [4, 5]]
    end
end

@testset "Scan" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(Scan(+), 1:10) == cumsum(1:10)
    end

    ed = eduction(Scan(+), 1:10)
    @test eltype(ed) === Int

    xs0 = [0, -1, 3, -2, 1]
    @testset for xs in [xs0, collect(xs0)]
    # @testset for xs in iterator_variants([0, -1, 3, -2, 1])  # TODO: fix
        @test collect(Scan(max), xs) == [0, 0, 3, 3, 3]
        @test collect(Scan(min), xs) == [0, -1, -1, -2, -2]
    end
end

@testset "ScanEmit" begin
    @testset for xs in iterator_variants(1:3)
        @test collect(ScanEmit(tuple, 0), xs) == 0:2
        @test collect(ScanEmit(tuple, nothing), xs) == [nothing; 1:2]
    end
end

@testset "TeeZip" begin
    @testset for xs in iterator_variants(1:5)
        @test collect(TeeZip(Filter(isodd) |> Map(inc)), xs) ==
            collect(zip(1:2:5, 2:2:6))
    end

    ed = eduction(TeeZip(Filter(isodd) |> Map(x -> x + 1)), 1:5)
    @test eltype(ed) === Tuple{Int,Int}

    xf = Map(inc) |> TeeZip(Filter(isodd)) |> Map(first)
    @testset for xs in iterator_variants(1:6)
        @test collect(xf, xs) == 3:2:7
    end
end

@testset "Replace" begin
    @testset for xs in iterator_variants(1:3)
        @test collect(Replace(Dict(1 => 10, 2 => 20)), xs) == [10, 20, 3]
    end
end

@testset "Take" begin
    @testset for xs in iterator_variants(1:5)
        @test collect(Take(3), xs) == 1:3
        @test collect(Take(3) |> Take(4), xs) == 1:3
        @test collect(Take(4) |> Take(3), xs) == 1:3
        @test collect(Take(10), xs) == 1:5
        @test collect(Take(10) |> Take(20), xs) == 1:5
        @test collect(Take(20) |> Take(10), xs) == 1:5
    end
    @testset "Combination with stateless transducers" begin
        @testset for xs in iterator_variants(1:5)
            @test collect(Filter(isodd) |> Take(2), xs) == 1:2:3
            @test collect(Filter(iseven) |> Take(3), xs) == 2:2:4  # no abort
            @test collect(Take(3) |> Filter(isodd), xs) == 1:2:3
            @test collect(Take(3) |> Filter(iseven), xs) == [2]
        end
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in Any[1:5, collect(1:5)]
            @test eltype(xs) <: Number
            @test collect(Take(3) |> Scan(+), xs) == cumsum(1:3)
            @test collect(Scan(+) |> Take(3), xs) == cumsum(1:3)
        end
        @testset for xs in iterator_variants(1:5)
            @test collect(TakeLast(4) |> Take(2), xs) == 2:3
            @test collect(Take(4) |> TakeLast(2), xs) == 3:4
        end
    end
end

@testset "TakeLast" begin
    @testset for xs in iterator_variants(1:5)
        @test collect(TakeLast(2), xs) == 4:5
        @test collect(TakeLast(10), xs) == 1:5
        @test collect(TakeLast(3) |> TakeLast(4), xs) == 3:5
        @test collect(TakeLast(4) |> TakeLast(3), xs) == 3:5
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:5)
            @test collect(Take(4) |> TakeLast(2), xs) == 3:4
            @test collect(TakeLast(4) |> Take(2), xs) == 2:3
        end
    end
end

@testset "TakeWhile" begin
    @testset for xs in iterator_variants(1:5)
        @test collect(TakeWhile(x -> x < 3), xs) == 1:2
    end
end

@testset "TakeNth" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(TakeNth(3), xs) == 1:3:10
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test collect(Take(4) |> TakeNth(2), xs) == (1:4)[1:2:end]
            @test collect(TakeNth(2) |> Take(4), xs) == (1:2:10)[1:4]
        end
    end
end

@testset "Drop" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(Drop(3), xs) == 4:10
        @test collect(Drop(3) |> Drop(3), xs) == 7:10
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test collect(Drop(3) |> Take(3), xs) == 4:6
            @test collect(Take(5) |> Drop(3), xs) == 4:5
        end
    end
end

@testset "DropLast" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(DropLast(3), xs) == 1:7
    end
end

@testset "DropWhile" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(DropWhile(x -> x % 3 != 0), xs) == 3:10
    end
end

# https://clojuredocs.org/clojure.core/keep
@testset "Keep" begin
    xf = Keep() do x
        if x % 3 == 0
            x
        end
    end
    @testset for xs in iterator_variants(1:10)
        @test collect(xf, xs) == 3:3:10
    end
end

# https://clojuredocs.org/clojure.core/distinct
@testset "Distinct" begin
    @testset for xs in iterator_variants([1, 1, 2, 1, 3, 2])
        @test collect(Distinct(), xs) == [1, 2, 3]
    end
end

# https://clojuredocs.org/clojure.core/interpose
@testset "Interpose" begin
    @testset for xs in iterator_variants(1:3)
        @test collect(Interpose(0), xs) == [1, 0, 2, 0, 3]
    end
end

# https://clojuredocs.org/clojure.core/dedupe
@testset "Dedupe" begin
    @testset for xs in iterator_variants([1, 1, 1, 2, 3, 3, 1])
        @test collect(Dedupe(), xs) == [1:3; 1]
    end
end

# https://clojuredocs.org/clojure.core/partition-all
@testset "Partition" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(Partition(3) |> Map(copy), xs) == [[1:3;], [4:6;], [7:9;]]
    end
    @testset for xs in iterator_variants(1:6)
        @test collect(Partition(3, 1) |> Map(copy), xs) ==
            [[1:3;], [2:4;], [3:5;], [4:6;]]
    end
    @testset "w=3, 7:$i" for i in 7:9
        @testset for xs in iterator_variants(1:i)
            @test collect(Partition(3, flush=true) |> Map(copy), xs) ==
                [[1:3;], [4:6;], [7:i;]]
        end
    end
    @testset "w=4, 5:$i" for i in 5:8
        @testset for xs in iterator_variants(1:i)
            @test collect(Partition(4, flush=true) |> Map(copy), xs) ==
                [[1:4;], [5:i;]]
        end
    end
    @testset "w=4, 9:$i" for i in 9:12
        @testset for xs in iterator_variants(1:i)
            @test collect(Partition(4, flush=true) |> Map(copy), xs) ==
                [[1:4;], [5:8;], [9:i;]]
        end
    end
end

@testset "Count" begin
    @testset for xs in iterator_variants(1:3)
        @test collect(Count(), xs) == 1:3
        @test collect(Count(1im), xs) == [0+1im, 1+1im, 2+1im]
        @test collect(Count(Second(1)), xs) == Second.(xs)
        @test_broken collect(Count(Second(1), Millisecond(1)), xs) == [
            Second(1) + Millisecond(0),
            Second(1) + Millisecond(1),
            Second(1) + Millisecond(2),
        ]
    end
end

@testset "(Get|Set)Index" begin
    for T in [GetIndex, SetIndex]
        @test T([0 + 1im]) == T([0 + 1im])
        @test T{true}([0]) != T([0])
        @test T([0]) != T{true}([0])
        @test T([0]) != T([0im])  # should it?
    end
end

end  # module
