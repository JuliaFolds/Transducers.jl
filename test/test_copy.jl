module TestCopy

include("preamble.jl")
import Tables
using DataFrames: DataFrame, eachrow
using StructArrays: StructVector
using TypedTables: Table

@testset "copy [base types]" begin
    @test copy(Map(x -> x^2), Vector, 1:3) == (1:3) .^ 2
    @test copy(Map(x -> x^2), [1:3;]) == (1:3) .^ 2
    @test copy(Map(x -> x^2), Set, 1:3) == Set((1:3) .^ 2)
    @test copy(Map(x -> x => x^2), Dict, 2:2) == Dict(2 => 4)
end

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
        if copy in (tcopy, dcopy)
            @test copy(Map(identity), src; basesize=1) ==ₜ src
        end
    end
    @testset "$copy(_, eachrow(df))" begin
        df = DataFrame(a=[1:4;], b=[5:8;])
        if Tables.materializer(eachrow(df)) == DataFrame
            # requires https://github.com/JuliaData/DataFrames.jl/pull/2055
            if copy in (tcopy, dcopy)
                @test copy(Map(identity), eachrow(df); basesize=1) ==ₜ df
            else
                @test copy(Map(identity), eachrow(df)) ==ₜ df
            end
        else
            @test_broken copy(Map(identity), eachrow(df)) ==ₜ df
        end
    end
end

end  # module
