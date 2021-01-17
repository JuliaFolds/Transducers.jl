module TestCopy

include("../preamble.jl")
import Tables
using Compat: Iterators
using DataFrames: DataFrame, eachrow
using StructArrays: StructVector, StructArray
using TypedTables: Table

@testset "$copy" for copy in [copy, tcopy, dcopy]
    @testset "$copy(_, ::$(prettytypeof(src)))" for src in Any[
        DataFrame(a=[1:4;], b=[5:8;]),
        StructVector(a=[1:4;], b=[5:8;]),
        Table(a=[1:4;], b=[5:8;]),
    ]
        if copy in (tcopy, dcopy) && src isa DataFrame
            @test_broken copy(Map(identity), src) ==ₜ src
            @test_broken copy(Map(identity), src; basesize=1) ==ₜ src
            continue
        end
        @test copy(Map(identity), src) ==ₜ src
        @test copy(eduction(Iterators.map(identity, src))) ==ₜ src
        if copy in (tcopy, dcopy)
            @test copy(Map(identity), src; basesize=1) ==ₜ src
            @test copy(Iterators.map(identity, src)) ==ₜ src
            @test copy(Iterators.map(identity, src); basesize = 1) ==ₜ src
        end
    end
    @testset "$copy(_, $T, ::$(prettytypeof(src)))" for src in Any[
            StructVector(a = [1:4;], b = [5:8;]),
            Table(a = [1:4;], b = [5:8;]),
        ],
        T in Any[DataFrame, StructArray, Table]

        @test copy(Map(identity), T, src) ==ₜ T(src)
        @test copy(T, eduction(Iterators.map(identity, src))) ==ₜ T(src)
        if copy in (tcopy, dcopy)
            @test copy(Map(identity), T, src; basesize = 1) ==ₜ T(src)
            @test copy(T, Iterators.map(identity, src)) ==ₜ T(src)
            @test copy(T, Iterators.map(identity, src); basesize = 1) ==ₜ T(src)
        end
    end
    @testset "$copy(_, eachrow(df))" begin
        df = DataFrame(a=[1:4;], b=[5:8;])
        if Tables.materializer(eachrow(df)) == DataFrame
            # requires https://github.com/JuliaData/DataFrames.jl/pull/2055
            if copy in (tcopy, dcopy)
                @test copy(Map(identity), eachrow(df); basesize=1) ==ₜ df
                @test copy(Iterators.map(identity, eachrow(df)); basesize = 1) ==ₜ df
                @test copy(eduction(Iterators.map(identity, eachrow(df))); basesize = 1) ==ₜ
                      df
            else
                @test copy(Map(identity), eachrow(df)) ==ₜ df
                @test copy(eduction(Iterators.map(identity, eachrow(df)))) ==ₜ df
            end
        else
            @test_broken copy(Map(identity), eachrow(df)) ==ₜ df
        end
    end
end

@testset "$collect" for collect in [collect, tcollect, dcollect]
    @testset "$collect(_, ::$(prettytypeof(src)))" for src in Any[
        1:64,
        StructVector(a=[1:4;], b=[5:8;]),
     ]
        @test collect(Map(identity), src) ==ₜ Base.collect(src)
        @test collect(IdentityTransducer(), src) ==ₜ Base.collect(src)
        @test collect(eduction(Iterators.map(identity, src))) ==ₜ Base.collect(src)
        if collect in (tcollect, dcollect)
            @test collect(Map(identity), src; basesize=1) ==ₜ Base.collect(src)
            @test collect(Iterators.map(identity, src)) ==ₜ Base.collect(src)
            @test collect(Iterators.map(identity, src); basesize = 1) ==ₜ Base.collect(src)
        end
    end
end

end  # module
