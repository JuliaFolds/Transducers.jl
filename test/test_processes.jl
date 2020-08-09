module TestProcesses
include("preamble.jl")

@testset "foldl" begin
    # https://clojure.org/reference/transducers#_transduce
    xf = opcompose(Filter(isodd), Map(inc))
    @testset for xs in iterator_variants(0:4)
        @test foldl(+, xf, xs, init=0) == 6
        @test foldl(+, xf, xs, init=100) == 106
    end

    # https://clojuredocs.org/clojure.core/transduce
    xf = opcompose(Filter(isodd), Take(10))
    @testset "$(typeof(xs))" for xs in iterator_variants(0:1000)
        @test foldl(push!, xf, xs, init=Int[]) == 1:2:19
        @test foldl(+, xf, xs, init=0) == 100
        @test foldl(+, xf, xs, init=17) == 117
        @test foldl(string, xf, xs, init="") == "135791113151719"

        @test transduce(xf, push!, Int[], xs) == Reduced(1:2:19)
        @test transduce(xf, +, 0, xs) == Reduced(100)
        @test transduce(xf, +, 17, xs) == Reduced(117)
        @test transduce(xf, string, "", xs) == Reduced("135791113151719")
    end

    @testset "no init" begin
        @test foldl(+, Map(identity), 1:4) == 10
        @test foldl((a, b) -> a + b, Map(identity), 1:4) == 10
        @test foldl(-, Map(x -> parse(Int, x)), "1234") == -8
        @test foldl((a, b) -> a - b, Map(x -> parse(Int, x)), "1234") == -8
    end

    @testset "empty" begin
        xf = Filter(_ -> false)
        iter = 1:4
        @test_throws EmptyResultError foldl(+, xf, iter)
        @test foldl(+, xf, iter, init=32.) === 32.

        ed = eduction(xf, iter)
        @test_throws EmptyResultError foldl(+, ed)
        @test foldl(+, ed, init=32.) === 32.

        # @test_throws EmptyResultError foldl(+, xf, iter)  # broken
        @test foldl(+, xf, iter, init=32.) === 32.

        nested_xf = opcompose(Drop(10^9), FlagFirst(), Map(x -> 32))
        @test_throws EmptyResultError foldl(+, nested_xf, iter)
    end

    @testset "zip-of-arrays" begin
        @testset for arrays in [
                (0:3,),
                (0:3, 1:2:8),
                (0:3, 1:2:8, 10:3:19),
                (reshape([1:9;], (3, 3)), [10:3:34;]),
                ]
            xs = zip(arrays...)
            VERSION >= v"1.1-" && @test xs isa Iterators.Zip
            @test foldl(+, MapSplat(*), xs) == sum(map(*, arrays...))
        end
    end

    @testset "CartesianIndices" begin
        @testset for cartesian in [
            CartesianIndices((1:2,)),
            CartesianIndices((1:2, 3:5)),
            CartesianIndices((1:2, 3:5, 6:9)),
        ]
            @test collect(Map(identity), cartesian) == vec(cartesian)
        end
    end

    @testset "product-of-iterators" begin
        iterator_prototypes = [
            (1, 2),
            0:3,
            [-1, 2, 1],
        ]
        @testset for iterators in Iterators.product(iterator_prototypes,
                                                    iterator_prototypes,
                                                    iterator_prototypes),
                n in 1:length(iterators)
            xs = Iterators.product(iterators[1:n]...)
            @test collect(Map(identity), xs) == collect(xs)[:]
            @test foldl(+, MapSplat(*), xs) == sum(Base.splat(*), xs)
        end
    end

    @testset "zip-of-products" begin
        @testset "$i" for (i, products) in enumerate([
            (Iterators.product(10:12, 20:23), Iterators.product(30:32, 40:43)),
            (CartesianIndices((3, 4)), Iterators.product(30:32, 40:43)),
            (Iterators.product(10:12, 20:23), CartesianIndices((0:2, 0:3))),
            (CartesianIndices((3, 4)), CartesianIndices((0:2, 0:3))),
            (Iterators.product(10:12, 20:23), randn(3, 4)),
            (randn(3, 4), Iterators.product(30:32, 40:43)),
        ])
            VERSION >= v"1.1-" || break
            xs = zip(products...)
            @test collect(Map(identity), xs) == vec(collect(xs))
        end
    end

    @testset "broadcast" begin
        @testset for xs in iterator_variants(1:3)
            ys = @~ xs.^2
            @test collect(Map(identity), ys) == copy(ys)
            @test foldl(+, Filter(isodd), ys) == 10
            @test foldl(+, Filter(isodd), ys; init=0) == 10
        end
    end
end


@testset "eduction" begin
    # https://clojuredocs.org/clojure.core/eduction
    xf = opcompose(Filter(isodd), Take(5))
    @test 1:3 |> xf === eduction(xf, 1:3)
    @testset "$(typeof(xs))" for xs in iterator_variants(0:1000)
        @test collect(xf, xs) == 1:2:9
        @test collect(eduction(xf, xs)) == 1:2:9
        @test collect(Map(x -> 2x), eduction(xf, xs)) == 2(1:2:9)
    end

    @testset for xs in iterator_variants(1:5)
        @test collect(xf, xs) == 1:2:5
        @test collect(eduction(xf, xs)) == 1:2:5
        @test collect(Map(x -> 2x), eduction(xf, xs)) == 2(1:2:5)
        @test xs |> AbortIf(iseven) |> TakeLast(1) |> collect == 1:1
    end

    @testset "inference" begin
        ed = 1:10 |> Zip(Count(), Map(identity), Map(x -> 2x)) |> MapSplat(*)
        @test_broken (@inferred foldl(+, ed)) === 6050
    end

    @testset "foreach" begin
        ed = eduction(Map(identity), 1:10)
        result = []
        @test foreach(ed) do x
            x > 5 && return reduced()
            push!(result, x)
        end === reduced()
    end
end


@testset "setinput" begin
    ed = 1:10 |> Zip(Count(), Map(identity), Map(x -> 2x)) |> MapSplat(*)

    @testset for xs in iterator_variants(1:10)
        @test setinput(ed, xs).coll isa typeof(xs)
        @test collect(setinput(ed, xs)) == collect(ed)
    end

    @testset "inference" begin
        @test (@inferred setinput(ed, [0])).coll isa Vector{Int}
        @test (@inferred setinput(ed, view([0], 1:1))).coll isa SubArray{Int}
        @test_broken (@inferred setinput(ed, Float64[])).coll isa Vector{Float64}
    end
end


# Custom container without unary push! method
struct MinimalContainer
    internal
end

Base.push!(coll::MinimalContainer, x) =
    MinimalContainer(push!(coll.internal, x))

@testset "append!" begin
    # https://clojuredocs.org/clojure.core/into#example-57294b20e4b050526f331420
    xf = opcompose(Map(x -> x + 2), Filter(isodd))
    @testset for xs in iterator_variants(0:9)
        @test append!(xf, [-1, -2], xs) == [-1, -2, 3, 5, 7, 9, 11]
        @test append!(xf, MinimalContainer([-1, -2]), xs).internal ==
            [-1, -2, 3, 5, 7, 9, 11]
    end
end

@testset "map!" begin
    xs0 = 1:10
    @testset for src in [xs0, collect(xs0)]
        dest = similar(xs0)
        @test map!(Scan(+), dest, src) === dest
        @test dest == cumsum(xs0)
    end

    xs0 = 1:5
    @testset for src in [xs0, collect(xs0)]
        dest = zero(src)
        @test map!(opcompose(Filter(isodd), Scan(+)), dest, src) == [1, 0, 4, 0, 9]
        @test map!(ScanEmit(tuple, 0), dest, src) == 0:4
    end

    @testset "Expansive transducers are not allowed" begin
        @test_throws Exception map!(Cat(), [0], 1:1)
        @test_throws Exception map!(ScanEmit(tuple, 0, identity), [0], 1:1)
    end
end

@testset "copy!" begin
    xs0 = 1:10
    @testset for src in [xs0, collect(xs0)]
    # @testset for src in iterator_variants(xs0)  # TODO: fix
        dest = similar(xs0)
        @test copy!(Scan(+), dest, src) === dest
        @test dest == cumsum(src)
    end

    xs0 = 1:5
    @testset for src in [xs0, collect(xs0)]
    # @testset for src in iterator_variants(xs0)  # TODO: fix
        dest = zero(xs0)
        @test copy!(opcompose(Filter(isodd), Scan(+)), dest, src) == [1, 4, 9]
    end
end

@testset "simple_transduce" begin
    xf = opcompose(PartitionBy(x -> x > 0), Filter(xs -> mean(abs, xs) < 1.0), Map(prod))

    for _ in 1:100
        xs = randn(100)
        @test transduce(xf, +, 0.0, xs) == simple_transduce(xf, +, 0.0, xs)
    end
end

@testset "Transducer(::Reduction)" begin
    # testing Transducer(::Eduction) which calls Transducer(::Reduction)
    @testset for xf in [
        Map(sin),
        ZipSource(opcompose(Filter(isfinite), Map(tan))),
        opcompose(Map(sin), ZipSource(opcompose(Filter(isfinite), Map(tan))), Map(cos)),
        ZipSource(opcompose(Map(sin), ZipSource(Map(tan)))),
        ZipSource(opcompose(ZipSource(Map(tan)), Map(identity))),
        ZipSource(opcompose(Map(sin), ZipSource(Map(tan)), Map(identity))),
        opcompose(
            Map(cos),
            ZipSource(opcompose(Map(sin), ZipSource(Map(tan)), Map(identity))),
        ),
        opcompose(
            Map(cos),
            ZipSource(opcompose(Map(sin), ZipSource(Map(tan)), Map(identity))),
            Map(first),
        ),
        ZipSource(ZipSource(Map(tan))),
    ]
        @test Transducer(eduction(xf, 1:1)) === xf
    end
end

@testset "isexpansive" begin
    expansives = [
        Cat()
        opcompose(Cat(), Filter(isodd))
        opcompose(Filter(isodd), Cat())
    ]
    @testset for xf in expansives
        @test isexpansive(xf)
        @test isexpansive(ZipSource(xf))
    end
    nonexpansives = [
        Map(identity)
        opcompose(Map(identity), Count())
    ]
    @testset for xf in nonexpansives
        @test !isexpansive(xf)
        @test !isexpansive(ZipSource(xf))
    end
end

@testset "Non-executable transducers" begin
    @testset for ex in @expressions begin
            foldl(+, Map(error), Int[])
            foldl(+, eduction(Map(error), Int[]))
        end

        err = @eval @test_error $ex
        @test occursin("EmptyResultError:", sprint(showerror, err))
    end

    @testset for ex in @expressions begin
            foldl(+, Map(error), ["hello"]; init=0)
            foldl(+, eduction(Map(error), ["hello"]); init=0)
            foreach(tuple, Map(error), ["hello"])
            foreach(tuple, eduction(Map(error), ["hello"]))
            collect(Map(error), ["hello"])
            collect(eduction(Map(error), ["hello"]))
            append!(Map(error), [], ["hello"])
            copy!(Map(error), [], ["hello"])
        end

        @eval @test_throws ErrorException("hello") $ex
    end
end

@testset "IdentityNotDefinedError" begin
    unknownadd(x, y) = x + y
    err = @test_error foldl(unknownadd, Map(identity), 1:1; init=Init)
    @test err isa IdentityNotDefinedError
    msg = sprint(showerror, err)
    @test occursin("`InitialValue(op)` is not defined", msg)
    @test occursin("op = $unknownadd", msg)
end

@testset "identityof error" begin
    @test_throws EmptyResultError foldl(right, Map(identity), Any[])
end

@testset "AdHocFoldable" begin
    counting = AdHocFoldable() do rf, acc, _
        i = 0
        while true
            i += 1
            acc = @next(rf, acc, i)
        end
    end

    @test collect(Take(3), counting) == 1:3

    @test foreach(counting) do i
        i == 3 && return reduced()
    end === reduced()

    fold123 = AdHocFoldable() do rf, acc, _
        acc = @next(rf, acc, 1)
        acc = @next(rf, acc, 2)
        acc = @next(rf, acc, 3)
    end
    @test collect(fold123) ==ₜ [1, 2, 3]
end

@testset "foldxt" begin
    # Test that InitialValues.jl can handle right identity
    @test foldxt(+, Filter(x -> x == 1), 1:2; basesize=1) == 1
    @test foldxt(+, eduction(x for x in 1:2 if x == 1); basesize=1) == 1
end

end  # module
