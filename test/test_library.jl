module TestLibrary
include("preamble.jl")

@testset "MapCat" begin
    # https://clojuredocs.org/clojure.core/mapcat
    # (transduce (mapcat reverse) conj [[3 2 1 0] [6 5 4] [9 8 7]])
    @test collect(MapCat(reverse), [[3, 2, 1, 0], [6, 5, 4], [9, 8, 7]]) == 0:9
end

@testset "PartitionBy" begin
    # https://clojuredocs.org/clojure.core/partition-by#example-542692c7c026201cdc3269da
    xf = PartitionBy(isequal(3)) |> Map(copy)
    @test collect(xf, 1:5) == [[1, 2], [3], [4, 5]]
end

@testset "Scan" begin
    @test collect(Scan(+), 1:10) == cumsum(1:10)

    ed = eduction(Scan(+), 1:10)
    @test finaltype(ed.rf) === Int
end

@testset "TeeZip" begin
    @test collect(TeeZip(Filter(isodd) |> Map(inc)), 1:5) ==
        collect(zip(1:2:5, 2:2:6))

    xf = Map(inc) |> TeeZip(Filter(isodd)) |> Map(first)
    @test collect(xf, 1:6) == 3:2:7
end

@testset "Replace" begin
    @test collect(Replace(Dict(1 => 10, 2 => 20)), 1:3) == [10, 20, 3]
end

@testset "TakeWhile" begin
    @test collect(TakeWhile(x -> x < 3), 1:5) == 1:2
end

@testset "TakeNth" begin
    @test collect(TakeNth(3), 1:10) == 1:3:10
end

@testset "Drop" begin
    @test collect(Drop(3), 1:10) == 4:10
end

@testset "DropLast" begin
    @test collect(DropLast(3), 1:10) == 1:7
end

@testset "DropWhile" begin
    @test collect(DropWhile(x -> x % 3 != 0), 1:10) == 3:10
end

# https://clojuredocs.org/clojure.core/keep
@testset "Keep" begin
    xf = Keep() do x
        if x % 3 == 0
            x
        end
    end
    @test collect(xf, 1:10) == 3:3:10
end

# https://clojuredocs.org/clojure.core/distinct
@testset "Distinct" begin
    @test collect(Distinct(), [1, 1, 2, 1, 3, 2]) == [1, 2, 3]
end

# https://clojuredocs.org/clojure.core/interpose
@testset "Interpose" begin
    @test collect(Interpose(0), 1:3) == [1, 0, 2, 0, 3]
end

# https://clojuredocs.org/clojure.core/dedupe
@testset "Dedupe" begin
    @test collect(Dedupe(), [1, 1, 1, 2, 3, 3, 1]) == [1:3; 1]
end

# https://clojuredocs.org/clojure.core/partition-all
@testset "Window" begin
    @test collect(Window(3) |> Map(copy), 1:10) == [[1:3;], [4:6;], [7:9;]]
    @test collect(Window(3, 1) |> Map(copy), 1:6) ==
        [[1:3;], [2:4;], [3:5;], [4:6;]]
    @testset "w=3, 7:$i" for i in 7:9
        @test collect(Window(3, flush=true) |> Map(copy), 1:i) ==
            [[1:3;], [4:6;], [7:i;]]
    end
    @testset "w=4, 5:$i" for i in 5:8
        @test collect(Window(4, flush=true) |> Map(copy), 1:i) ==
            [[1:4;], [5:i;]]
    end
    @testset "w=4, 9:$i" for i in 9:12
        @test collect(Window(4, flush=true) |> Map(copy), 1:i) ==
            [[1:4;], [5:8;], [9:i;]]
    end
end

end  # module
