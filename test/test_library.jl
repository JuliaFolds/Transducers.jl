module TestLibrary
include("preamble.jl")

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
    @test finaltype(ed.rf) === Int

    xs0 = [0, -1, 3, -2, 1]
    @testset for xs in [xs0, collect(xs0)]
    # @testset for xs in iterator_variants([0, -1, 3, -2, 1])  # TODO: fix
        @test collect(Scan(max), xs) == [0, 0, 3, 3, 3]
        @test collect(Scan(min), xs) == [0, -1, -1, -2, -2]
    end
end

@testset "TeeZip" begin
    @testset for xs in iterator_variants(1:5)
        @test collect(TeeZip(Filter(isodd) |> Map(inc)), xs) ==
            collect(zip(1:2:5, 2:2:6))
    end

    ed = eduction(TeeZip(Filter(isodd) |> Map(x -> x + 1)), 1:5)
    @test finaltype(ed.rf) === Tuple{Int,Int}

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

@testset "TakeWhile" begin
    @testset for xs in iterator_variants(1:5)
        @test collect(TakeWhile(x -> x < 3), xs) == 1:2
    end
end

@testset "TakeNth" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(TakeNth(3), xs) == 1:3:10
    end
end

@testset "Drop" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(Drop(3), xs) == 4:10
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
@testset "Window" begin
    @testset for xs in iterator_variants(1:10)
        @test collect(Window(3) |> Map(copy), xs) == [[1:3;], [4:6;], [7:9;]]
    end
    @testset for xs in iterator_variants(1:6)
        @test collect(Window(3, 1) |> Map(copy), xs) ==
            [[1:3;], [2:4;], [3:5;], [4:6;]]
    end
    @testset "w=3, 7:$i" for i in 7:9
        @testset for xs in iterator_variants(1:i)
            @test collect(Window(3, flush=true) |> Map(copy), xs) ==
                [[1:3;], [4:6;], [7:i;]]
        end
    end
    @testset "w=4, 5:$i" for i in 5:8
        @testset for xs in iterator_variants(1:i)
            @test collect(Window(4, flush=true) |> Map(copy), xs) ==
                [[1:4;], [5:i;]]
        end
    end
    @testset "w=4, 9:$i" for i in 9:12
        @testset for xs in iterator_variants(1:i)
            @test collect(Window(4, flush=true) |> Map(copy), xs) ==
                [[1:4;], [5:8;], [9:i;]]
        end
    end
end

end  # module
