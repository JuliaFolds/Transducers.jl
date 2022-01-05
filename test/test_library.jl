module TestLibrary
include("preamble.jl")
using Dates
using BangBang: push!!

@testset "Cat" begin
    # Inner transducer is stateful:
    @testset for xs in iterator_variants([1:5, 1:2])
        xf = DropWhile(x -> x < 3)
        @test xs |> Cat() |> xf |> collect == collect(xf, vcat(xs...))
    end

    # Inner transducer is stateful and requires complete:
    @testset for xs in iterator_variants([1:5, 1:2])
        xf = opcompose(PartitionBy(isequal(3)), Map(copy))
        @test xs |> Cat() |> xf |> collect == collect(xf, vcat(xs...))
    end
end

@testset "MapCat" begin
    # https://clojuredocs.org/clojure.core/mapcat
    # (transduce (mapcat reverse) conj [[3 2 1 0] [6 5 4] [9 8 7]])
    @testset for xs in iterator_variants(
            [[3, 2, 1, 0], [6, 5, 4], [9, 8, 7]]
            )
        @test collect(MapCat(reverse), xs) == 0:9
        @test xs |> MapCat(reverse) |> Map(inc) |> collect == 1:10
        @test xs |> MapCat(x -> reverse(x) |> Map(inc)) |> collect == 1:10
    end
end

@testset "PartitionBy" begin
    # https://clojuredocs.org/clojure.core/partition-by#example-542692c7c026201cdc3269da
    xf = opcompose(PartitionBy(isequal(3)), Map(copy))
    @testset for xs in iterator_variants(1:5)
        @test collect(xf, xs) == [[1, 2], [3], [4, 5]]
    end
    @testset "Inner transducer terminated during complete" begin
        @testset for xs in iterator_variants(1:5)
            @test xs |> xf |> Take(3) |> collect == [[1, 2], [3], [4, 5]]
        end
    end
end

@testset "Scan" begin
    @testset for xs in iterator_variants(1:10)
        xs isa Base.Generator && continue
        @test collect(Scan(+), xs) == cumsum(xs)
        @test collect(Scan((a, b) -> a + b), xs) == cumsum(xs)
    end

    xs0 = [0, -1, 3, -2, 1]
    @testset for xs in [xs0, collect(xs0)]
    # @testset for xs in iterator_variants([0, -1, 3, -2, 1])  # TODO: fix
        @test collect(Scan(max), xs) == [0, 0, 3, 3, 3]
        @test collect(Scan(min), xs) == [0, -1, -1, -2, -2]
    end
end

@testset "Scanx" begin
    @testset for xs in iterator_variants(1:10)
        xs isa Base.Generator && continue
        @test collect(Scanx(+), xs) == [0;cumsum(xs)]
        @test collect(Scanx(*), xs) == [1;cumsum(xs)]
        @test collect(Scanx((a, b) -> a + b), xs) == [0;cumsum(xs)]
    end

    xs0 = [0, -1, 3, -2, 1]
    @testset for xs in [xs0, collect(xs0)]
        # TODO: confirm that -Inf/Inf are the right monoidal identities here
        @test collect(Scanx(max), xs) == [-Inf,0, 0, 3, 3, 3]
        @test collect(Scanx(min), xs) == [Inf,0, -1, -1, -2, -2]
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
            @test xs |> ScanEmit(tuple, 0, identity) |> Take(4) |> collect == 0:3
        end
    end

    @testset "Do not call `complete` when reduced" begin
        xs = 1:8
        xf = opcompose(ScanEmit(CopyInit([]), identity) do u, x
            push!(u, x)
            if x % 3 == 0
                return u, []
            else
                return nothing, u
            end
        end, NotA(Nothing))

        @testset "foreach" begin
            called_with = []
            @test foreach(xf, xs) do chunk
                push!(called_with, copy(chunk))
                5 ∈ chunk && reduced(true)
            end == reduced(true)
            @test called_with == [1:3, 4:6]
        end

        @testset "foldl" begin
            called_with = []
            history = []
            @test foldl(xf, xs; init=false) do state, chunk
                push!(history, state)
                push!(called_with, copy(chunk))
                5 ∈ chunk && reduced(true)
            end == true
            @test called_with == [1:3, 4:6]
            @test history == [false, false]
        end
    end
end

@testset "ZipSource" begin
    @testset for xs in iterator_variants(1:5)
        @test collect(ZipSource(opcompose(Filter(isodd), Map(inc))), xs) ==
            collect(zip(1:2:5, 2:2:6))
    end

    @testset for xs in iterator_variants(1:6)
        @test xs |> Map(inc) |> ZipSource(Filter(isodd)) |> Map(first) |> collect == 3:2:7
    end

    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(2:2:6)
            @test xs |> ZipSource(Map(identity)) |> Count() |> collect == 1:3
            @test xs |> ZipSource(Count()) |> Count() |> collect == 1:3
            @test xs |> Count() |> ZipSource(Map(x -> x + 10)) |> collect ==
                collect(zip(1:3, (1:3) .+ 10))
            @test (
                xs |>
                Enumerate() |>
                ZipSource(Map(x -> x[end] + 10)) |>
                Enumerate() |>
                collect
            ) == [
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

    @testset "Nested ZipSource" begin
        @testset for xs in iterator_variants(1:5)
            @test collect(
                ZipSource(opcompose(Filter(isodd), Map(inc), ZipSource(Map(inc)))),
                xs,
            ) == [
                (1, (2, 3))
                (3, (4, 5))
                (5, (6, 7))
            ]
            @test collect(ZipSource(ZipSource(Map(inc))), xs) isa Vector
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
        @test xs |> Take(3) |> collect == 1:3
        @test xs |> Take(3) |> Take(4) |> collect == 1:3
        @test xs |> Take(4) |> Take(3) |> collect == 1:3
        @test xs |> Take(10) |> collect == 1:5
        @test xs |> Take(10) |> Take(20) |> collect == 1:5
        @test xs |> Take(20) |> Take(10) |> collect == 1:5
    end
    @testset "Combination with stateless transducers" begin
        @testset for xs in iterator_variants(1:5)
            @test xs |> Filter(isodd) |> Take(2) |> collect == 1:2:3
            @test xs |> Filter(iseven) |> Take(3) |> collect == 2:2:4  # no abort
            @test xs |> Take(3) |> Filter(isodd) |> collect == 1:2:3
            @test xs |> Take(3) |> Filter(iseven) |> collect == [2]
        end
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in Any[1:5, collect(1:5)]
            @test eltype(xs) <: Number
            @test xs |> Take(3) |> Scan(+) |> collect == cumsum(1:3)
            @test xs |> Scan(+) |> Take(3) |> collect == cumsum(1:3)
        end
        @testset for xs in iterator_variants(1:5)
            @test xs |> TakeLast(4) |> Take(2) |> collect == 2:3
            @test xs |> Take(4) |> TakeLast(2) |> collect == 3:4
        end
    end
end

@testset "TakeLast" begin
    @testset for xs in iterator_variants(1:5)
        @test xs |> TakeLast(2) |> collect == 4:5
        @test xs |> TakeLast(10) |> collect == 1:5
        @test xs |> TakeLast(3) |> TakeLast(4) |> collect == 3:5
        @test xs |> TakeLast(4) |> TakeLast(3) |> collect == 3:5
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:5)
            @test xs |> Take(4) |> TakeLast(2) |> collect == 3:4
            @test xs |> TakeLast(4) |> Take(2) |> collect == 2:3
        end
    end
end

@testset "TakeWhile" begin
    @testset for xs in iterator_variants(1:5)
        @test xs |> TakeWhile(x -> x < 3) |> collect == 1:2
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:5)
            @test xs |> TakeWhile(x -> x ≤ 4) |> TakeLast(2) |> collect == 3:4
            @test xs |> TakeLast(4) |> TakeWhile(x -> x ≤ 3) |> collect == 2:3
        end
    end
end

@testset "TakeNth" begin
    @testset for xs in iterator_variants(1:10)
        @test xs |> TakeNth(3) |> collect == 1:3:10
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test xs |> Take(4) |> TakeNth(2) |> collect == (1:4)[1:2:end]
            @test xs |> TakeNth(2) |> Take(4) |> collect == (1:2:10)[1:4]
        end
    end
end

@testset "Drop" begin
    @testset for xs in iterator_variants(1:10)
        @test xs |> Drop(3) |> collect == 4:10
        @test xs |> Drop(3) |> Drop(3) |> collect == 7:10
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test xs |> Drop(3) |> Take(3) |> collect == 4:6
            @test xs |> Take(5) |> Drop(3) |> collect == 4:5
        end
    end
end

@testset "DropLast" begin
    @testset for xs in iterator_variants(1:10)
        @test xs |> DropLast(3) |> collect == 1:7
        @test xs |> DropLast(3) |> DropLast(3) |> collect == 1:4
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test xs |> Take(5) |> DropLast(3) |> collect == 1:2
            @test xs |> DropLast(3) |> Take(5) |> collect == 1:5
            @test xs |> DropLast(3) |> Take(10) |> collect == 1:7
        end
    end
end

@testset "DropWhile" begin
    @testset for xs in iterator_variants(1:10)
        @test xs |> DropWhile(x -> false) |> collect == 1:10
        @test xs |> DropWhile(x -> true) |> collect == []
        @test xs |> DropWhile(x -> x % 3 != 0) |> collect == 3:10
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:10)
            @test xs |>
                  DropWhile(x -> x ÷ 3 == 0) |>
                  DropWhile(x -> x ÷ 3 == 1) |>
                  collect == 6:10
            @test xs |> DropWhile(x -> x ÷ 3 == 0) |> Take(3) |> collect == 3:5
            @test xs |> Take(3) |> DropWhile(x -> x ÷ 3 == 0) |> collect == [3]
            @test xs |> Take(2) |> DropWhile(x -> x ÷ 3 == 0) |> collect == []
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
        @test xs |> FlagFirst() |> collect == one2three
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test xs |> FlagFirst() |> FlagFirst() |> collect == [
                (true, (true, 1)),
                (false, (false, 2)),
                (false, (false, 3)),
            ]
            @test xs |> FlagFirst() |> Take(5) |> collect == one2three
            @test xs |> Take(5) |> FlagFirst() |> collect == one2three
            @test xs |> FlagFirst() |> Take(2) |> collect == one2three[1:2]
            @test xs |> Take(2) |> FlagFirst() |> collect == one2three[1:2]
        end
    end
end

# https://clojuredocs.org/clojure.core/keep
@testset "Keep" begin
    xf = @test_deprecated Keep() do x
        if x % 3 == 0
            x
        end
    end
    DEPWARN_ERROR || @testset for xs in iterator_variants(1:10)
        @test xs |> xf |> collect == 3:3:10
    end
end

@testset "KeepSomething" begin
    @test [Some(1), nothing, 2, Some(nothing)] |> KeepSomething() |> collect ==
          [1, 2, nothing]

    xf = KeepSomething() do x
        if x == 0
            :zero
        elseif x == 1
            Some(:one)
        end
    end

    @test collect(xf, 0:3) == [:zero, :one]
end

# https://clojuredocs.org/clojure.core/distinct
@testset "Unique" begin
    @testset for xs in iterator_variants([1, 1, 2, 1, 3, 2])
        @test xs |> Unique() |> collect == [1, 2, 3]
    end

    @testset for xs in iterator_variants([1, 1, 2, -1, 3, 2])
        @test xs |> Unique(x -> x^2) |> collect == [1, 2, 3]
    end
end

# https://clojuredocs.org/clojure.core/interpose
@testset "Interpose" begin
    @testset for xs in iterator_variants(1:3)
        @test xs |> Interpose(0) |> collect == [1, 0, 2, 0, 3]
    end
end

# https://clojuredocs.org/clojure.core/dedupe
@testset "Dedupe" begin
    @testset for xs in iterator_variants([1, 1, 1, 2, 3, 3, 1])
        @test xs |> Dedupe() |> collect == [1:3; 1]
    end
end

# https://clojuredocs.org/clojure.core/partition-all
@testset "Partition" begin
    @testset for xs in iterator_variants(1:10)
        @test xs |> Partition(3) |> Map(copy) |> collect == [[1:3;], [4:6;], [7:9;]]
    end
    @testset for xs in iterator_variants(1:6)
        @test xs |> Partition(3, 1) |> Map(copy) |> collect ==
            [[1:3;], [2:4;], [3:5;], [4:6;]]
    end
    @testset "w=3, 7:$i" for i in 7:9
        @testset for xs in iterator_variants(1:i)
            @test xs |> Partition(3, flush=true) |> Map(copy) |> collect ==
                [[1:3;], [4:6;], [7:i;]]
        end
    end
    @testset "w=4, 5:$i" for i in 5:8
        @testset for xs in iterator_variants(1:i)
            @test xs |> Partition(4, flush=true) |> Map(copy) |> collect ==
                [[1:4;], [5:i;]]
        end
    end
    @testset "w=4, 9:$i" for i in 9:12
        @testset for xs in iterator_variants(1:i)
            @test xs |> Partition(4, flush=true) |> Map(copy) |> collect ==
                [[1:4;], [5:8;], [9:i;]]
        end
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:6)
            @test xs |> Take(5) |> Partition(3, 1) |> Map(copy) |> collect ==
                [[1:3;], [2:4;], [3:5;]]
            @test xs |> Partition(3, 1) |> Map(copy) |> Take(3) |> collect ==
                [[1:3;], [2:4;], [3:5;]]
        end
    end
    @testset "Inner transducer terminated during complete" begin
        @testset "w=4, 9:$i" for i in 9:12
            @testset for xs in iterator_variants(1:i)
                @test xs |> Partition(4, flush = true) |> Map(copy) |> Take(3) |> collect ==
                      [[1:4;], [5:8;], [9:i;]]
            end
        end
    end
end

@testset "Iterated" begin
    @testset for xs in iterator_variants(1:3)
        @test xs |> Iterated(x -> x + 1, 1) |> collect == 1:3
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test xs |> Iterated(identity, nothing) |> Iterated(x -> x + 1, 1) |> collect ==
                  1:3
            @test xs |> Iterated(x -> x + 1, 1) |> Drop(1) |> collect == 2:3
            @test xs |> Drop(1) |> Iterated(x -> x + 1, 1) |> collect == 1:2
        end
    end
end

@testset "Count" begin
    @testset for xs in iterator_variants(1:3)
        @test xs |> Count() |> collect == 1:3
        @test xs |> Count(1im) |> collect == [0+1im, 1+1im, 2+1im]
        @test xs |> Count(Second(1)) |> collect == Second.(xs)
        @test_broken xs |> Count(Second(1), Millisecond(1)) |> collect == [
            Second(1) + Millisecond(0),
            Second(1) + Millisecond(1),
            Second(1) + Millisecond(2),
        ]
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test xs |> Count() |> Drop(1) |> collect == 2:3
            @test xs |> Drop(1) |> Count() |> collect == 1:2
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
        @test xs |> Inject(xs) |> collect == collect(zip(xs, xs))
        @test xs |> Inject(5:6) |> collect == collect(zip(1:2, 5:6))
        @test 5:6 |> Inject(xs) |> collect == collect(zip(5:6, 1:2))
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(1:3)
            @test xs |> Inject(xs) |> Take(2) |> collect == collect(zip(1:2, 1:2))
            @test xs |> Take(2) |> Inject(xs) |> collect == collect(zip(1:2, 1:2))
            @test xs |> Inject(xs) |> TakeLast(2) |> collect == collect(zip(2:3, 2:3))
            @test xs |> TakeLast(2) |> Inject(xs) |> collect == collect(zip(2:3, 1:2))
            @test xs |> Inject(1:1) |> TakeLast(2) |> collect == collect(zip(1:1, 1:1))
            @test xs |> TakeLast(2) |> Inject(1:1) |> collect == collect(zip(2:2, 1:1))
        end
    end
end

@testset "Enumerate" begin
    @testset for xs in iterator_variants(2:2:6)
        @test xs |> Enumerate() |> collect == [(1,2), (2,4), (3,6)]
        @test xs |> Enumerate(10, 20) |> collect == [(10, 2), (30, 4), (50, 6)]
    end
    @testset "Combination with stateful transducers" begin
        @testset for xs in iterator_variants(2:2:6)
            @test xs |> Enumerate() |> Take(2) |> collect == [(1, 2), (2, 4)]
            @test xs |> Drop(2) |> Enumerate() |> collect == [(1, 6)]
        end
    end
end

@testset "OfType" begin
    @testset "_next_oftype for non-tuple" begin
        @testset for xs in iterator_variants([0.0, 1.0, missing])
            @test xs |> OfType(Float64) |> collect == [0.0, 1.0]
            @test xs |> OfType(Number) |> collect == [0.0, 1.0]
        end
        @testset for xs in iterator_variants(["a", :b])
            @test xs |> OfType(Symbol) |> collect == [:b]
            @test xs |> OfType(AbstractString) |> collect == ["a"]
        end
    end
    @testset "_next_oftype for 2-tuple" begin
        @testset for xs in iterator_variants([(0.0, missing),
                                              (missing, 0.0),
                                              (1.0, 2.0)])
            @test xs |> OfType(Tuple{Float64,Float64}) |> collect == [(1.0, 2.0)]
            @test xs |> OfType(Tuple{Number,Float64}) |> collect == [(1.0, 2.0)]
            @test xs |> OfType(Tuple{Float64,Number}) |> collect == [(1.0, 2.0)]
            @test xs |> OfType(Tuple{Vararg{Float64}}) |> collect == [(1.0, 2.0)]
            @test xs |> OfType(Tuple{Vararg{Number}}) |> collect == [(1.0, 2.0)]
        end
    end
    @testset "_next_oftype_t" begin
        @testset "$(typeof(xs))" for xs in iterator_variants([
                [Tuple(i == j ? missing : i for i in 1:10) for j in 1:10]
                Tuple(1:10)
                ])
            desired = [Tuple(1:10)]
            @test xs |> OfType(Tuple{Vararg{Int}}) |> collect == desired
            @test xs |> OfType(Tuple{Vararg{Number}}) |> collect == desired
        end
    end
end

@testset "ReduceIf" begin
    @test foldl(right, ReduceIf(x -> x == 3), 1:10) === 3
    @test foldl(right, ReduceIf(x -> x == 3), 1:2) === 2
end

@testset "AbortIf" begin
    @test foldl(right, AbortIf(x -> x == 3), 1:10) === 2
    @test foldl(right, AbortIf(x -> x == 3), 1:1) === 1
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
    @test_throws ArgumentError TCat(0)
end

end  # module
