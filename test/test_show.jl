module TestShow

include("preamble.jl")

xforms = [
    Cat(),
    Count(),
    Count(2),
    Count(3, 4),
    GetIndex([0]),
    # GetIndex{true}([0]),
    Iterated(sqrt, 0.1),
    # Iterated(sqrt, 0.1, Number),
    Map(sin),
    Filter(isfinite),
    Scan(*),
    TeeZip(Filter(isfinite)),
    TeeZip(Filter(isfinite) |> Map(sin)),
    TeeZip(Filter(isfinite) |> Map(sin)) |> Map(sum),
    let xf = TeeZip(Filter(isfinite) |> Map(sin))
        xf |> Map(sum) |> xf
    end,
    let xf = Map(first) |> Map(last)
        xf = TeeZip(TeeZip(xf) |> Map(identity)) |> xf
        xf |> TeeZip(xf) |> xf
    end,
    # Zip(Map(sin), Map(cos), Map(tan)) |> Map(prod),
]

@testset "smoke test summary(xf)" begin
    for xf in xforms
        @test sprint(summary, xf) isa String
    end
end

# Note: Use `ENV["JULIA_DEBUG"] = "Main"` to enable debugging
@testset "eval(show(xf))" begin
    @testset "$(summary(xf))" for xf in xforms
        code = sprint(show, xf)
        @debug """
        show(xf) =
        $code
        """
        xf2 = include_string(@__MODULE__, code)
        @test xf == xf2
    end
end
@testset "eval(show(text/plain, xf))" begin
    @testset "$(summary(xf))" for xf in xforms
        code = sprint(show, "text/plain", xf)
        @debug """
        show("text/plain", xf) =
        $code
        """
        xf2 = include_string(@__MODULE__, code)
        @test xf == xf2
    end
end

end  # module
