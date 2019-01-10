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
    @testset "Inner transducer terminated during complete" begin
        @testset for xs in iterator_variants(1:5)
            @test collect(xf |> Take(3), xs) == [[1, 2], [3], [4, 5]]
        end
    end
end

@testset "Scan" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(Scan(+), 1:10) == cumsum(1:10)
    end

    xs0 = [0, -1, 3, -2, 1]
    @testset for xs in [xs0, collect(xs0)]
    # @testset for xs in iterator_variants([0, -1, 3, -2, 1])  # TODO: fix
        @test collect(Scan(max), xs) == [0, 0, 3, 3, 3]
        @test collect(Scan(min), xs) == [0, -1, -1, -2, -2]
    end

    @testset "outtype" begin
        @test eltype(eduction(Scan(+), 1:10)) === Int
        @test eltype(eduction(Scan(+, 0.0), 1:10)) === Float64
        @test eltype(eduction(Scan(+, missing), 1:10)) === Missing
        @test eltype(eduction(Scan(+, Initializer(() -> rand())), Int[])) ===
            Float64
        @test eltype(eduction(Scan(+, Initializer(() -> rand(Int))), Int[])) ===
            Int
    end
end

@testset "ScanEmit" begin
    @testset for xs in iterator_variants(1:3)
        @test collect(ScanEmit(tuple, 0), xs) == 0:2
        @test collect(ScanEmit(tuple, 0, identity), xs) == 0:3
        @test collect(ScanEmit(tuple, nothing), xs) == [nothing; 1:2]
    end
    @testset "Inner transducer terminated during complete" begin
        @testset for xs in iterator_variants(1:3)
            @test collect(ScanEmit(tuple, 0, identity) |> Take(4), xs) == 0:3
        end
    end

    @testset "outtype" begin
        @test eltype(eduction(ScanEmit(tuple, 0), 1:10)) === Int
        @test eltype(eduction(ScanEmit(tuple, 0.0), 1:10)) ===
            Union{Float64, Int64}
        @test eltype(eduction(
            ScanEmit(tuple, missing), 1:10)) === Union{Missing, Int64}
        @test eltype(eduction(
            ScanEmit(tuple, Initializer(() -> rand())), Int[])) ===
                Union{Float64, Int64}
        @test eltype(eduction(
            ScanEmit(tuple, Initializer(() -> rand(Int))), Int[])) === Int
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

    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(2:2:6)
            @test collect(TeeZip(Map(identity)) |> Count(), xs) == 1:3
            @test collect(TeeZip(Count()) |> Count(), xs) == 1:3
            @test collect(Count() |> TeeZip(Map(x -> x + 10)), xs) ==
                collect(zip(1:3, (1:3) .+ 10))
            @test collect(
                Enumerate() |> TeeZip(Map(x -> x[end] + 10)) |> Enumerate(),
                xs) == [
                    (1, ((1, 2), 12))
                    (2, ((2, 4), 14))
                    (3, ((3, 6), 16))
                ]
        end
    end

    @testset "Union type input" begin
        @testset for xs in iterator_variants([10, missing, 20])
            @test collect(Zip(Count(), NotA(Missing)), xs) == [
                (1, 10)
                (3, 20)
            ]
        end
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
        @test collect(DropLast(3) |> DropLast(3), xs) == 1:4
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test collect(Take(5) |> DropLast(3), xs) == 1:2
            @test collect(DropLast(3) |> Take(5), xs) == 1:5
            @test collect(DropLast(3) |> Take(10), xs) == 1:7
        end
    end
end

@testset "DropWhile" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(DropWhile(x -> false), xs) == 1:10
        @test collect(DropWhile(x -> true), xs) == []
        @test collect(DropWhile(x -> x % 3 != 0), xs) == 3:10
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test collect(
                DropWhile(x -> x ÷ 3 == 0) |> DropWhile(x -> x ÷ 3 == 1),
                xs) == 6:10
            @test collect(
                DropWhile(x -> x ÷ 3 == 0) |> Take(3),
                xs) == 3:5
            @test collect(
                Take(3) |> DropWhile(x -> x ÷ 3 == 0),
                xs) == [3]
            @test collect(
                Take(2) |> DropWhile(x -> x ÷ 3 == 0),
                xs) == []
        end
    end
end

@testset "FlagFirst" begin
    one2three = [
        (true, 1),
        (false, 2),
        (false, 3),
    ]
    @testset for xs in iterator_variants(1:3)
        @test collect(FlagFirst(), xs) == one2three
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test collect(FlagFirst() |> FlagFirst(), xs) == [
                (true, (true, 1)),
                (false, (false, 2)),
                (false, (false, 3)),
            ]
            @test collect(FlagFirst() |> Take(5), xs) == one2three
            @test collect(Take(5) |> FlagFirst(), xs) == one2three
            @test collect(FlagFirst() |> Take(2), xs) == one2three[1:2]
            @test collect(Take(2) |> FlagFirst(), xs) == one2three[1:2]
        end
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
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:6)
            @test collect(Take(5) |> Partition(3, 1) |> Map(copy), xs) ==
                [[1:3;], [2:4;], [3:5;]]
            @test collect(Partition(3, 1) |> Map(copy) |> Take(3), xs) ==
                [[1:3;], [2:4;], [3:5;]]
        end
    end
    @testset "Inner transducer terminated during complete" begin
        @testset "w=4, 9:$i" for i in 9:12
            @testset for xs in iterator_variants(1:i)
                @test collect(
                    Partition(4, flush=true) |> Map(copy) |> Take(3),
                    xs) == [[1:4;], [5:8;], [9:i;]]
            end
        end
    end
end

@testset "Iterated" begin
    @testset for xs in iterator_variants(1:3)
        @test collect(Iterated(x -> x + 1, 1), xs) == 1:3
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test collect(
                Iterated(identity, nothing) |> Iterated(x -> x + 1, 1),
                xs) == 1:3
            @test collect(Iterated(x -> x + 1, 1) |> Drop(1), xs) == 2:3
            @test collect(Drop(1) |> Iterated(x -> x + 1, 1), xs) == 1:2
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
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test collect(Count() |> Drop(1), xs) == 2:3
            @test collect(Drop(1) |> Count(), xs) == 1:2
        end
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

@testset "Inject" begin
    @testset for xs in iterator_variants(1:3)
        @test collect(Inject(xs), xs) == collect(zip(xs, xs))
        @test collect(Inject(5:6), xs) == collect(zip(1:2, 5:6))
        @test collect(Inject(xs), 5:6) == collect(zip(5:6, 1:2))
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test collect(Inject(xs) |> Take(2), xs) == collect(zip(1:2, 1:2))
            @test collect(Take(2) |> Inject(xs), xs) == collect(zip(1:2, 1:2))
        end
    end
end

@testset "Enumerate" begin
    @testset for xs in iterator_variants(2:2:6)
        @test collect(Enumerate(), xs) == [(1,2), (2,4), (3,6)]
        @test collect(Enumerate(10, 20), xs) == [(10, 2), (30, 4), (50, 6)]
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(2:2:6)
            @test collect(Enumerate() |> Take(2), xs) == [(1, 2), (2, 4)]
            @test collect(Drop(2) |> Enumerate(), xs) == [(1, 6)]
        end
    end
end

@testset "Invalid arguments" begin
    @test_throws ArgumentError Take(-1)
    @test_throws ArgumentError TakeLast(-1)
    @test_throws ArgumentError TakeNth(0)
    @test_throws ArgumentError Drop(-1)
    @test_throws ArgumentError DropLast(-1)
    @test_throws ArgumentError Partition(0)
    @test_throws ArgumentError Partition(0, 1)
    @test_throws ArgumentError Partition(1, 0)
end

end  # module
