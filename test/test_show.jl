module TestShow

include("preamble.jl")

if VERSION >= v"1.6-"
    ==ᵣ = ==ₛ
else
    ==ᵣ = ==
end

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
    ZipSource(Filter(isfinite)),
    ZipSource(opcompose(Filter(isfinite), Map(sin))),
    opcompose(ZipSource(opcompose(Filter(isfinite), Map(sin))), Map(sum)),
    let xf = ZipSource(opcompose(Filter(isfinite), Map(sin)))
        opcompose(xf, Map(sum), xf)
    end,
    let xf = opcompose(Map(first), Map(last))
        xf = opcompose(ZipSource(opcompose(ZipSource(xf), Map(identity))), xf)
        opcompose(xf, ZipSource(xf), xf)
    end,
    # opcompose(Zip(Map(sin), Map(cos), Map(tan)), Map(prod)),
    NotA(Missing),
    OfType(Int)
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
        VERSION < v"1.5-beta" && occursin("⨟", code) && continue
        xf2 = include_string(@__MODULE__, code)
        @test xf == xf2
    end
    @test occursin("λ❓", sprint(show, Map(x -> x + 1)))
end
@testset "eval(show(text/plain, xf))" begin
    @testset "$(summary(xf))" for xf in xforms
        code = sprint(show, "text/plain", xf)
        @debug """
        show("text/plain", xf) =
        $code
        """
        VERSION < v"1.5-beta" && occursin("⨟", code) && continue
        xf2 = include_string(@__MODULE__, code)
        @test xf == xf2
    end
end

@testset "eval(show(text/plain, ::Reduction))" begin
    @testset "Reduction($(summary(xf)), +)" for xf in xforms
        rf = Transducers.Reduction(xf, +)
        code = sprint(show, "text/plain", rf)
        @debug """
        show("text/plain", rf) =
        $code
        """
        VERSION < v"1.5-beta" && occursin("⨟", code) && continue
        rf2 = include_string(@__MODULE__, code)
        @test rf == rf2
    end
end

@testset "Reduced" begin
    @test sprint(show, Reduced(1)) == "Transducers.Reduced(1)"
    @test sprint(show, Reduced(1); context = :limit => true) == "Reduced(1)"
end

@testset "Completing(+)" begin
    rf = Completing(+)
    kw = (; context = :module => Base)
    @test repr(rf; kw...) == "Transducers.Completing(+)"
    @test sprint(print, rf; kw...) == "Transducers.Completing(+)"
    @test sprint(show, rf; kw...) == "Transducers.Completing(+)"
    @test sprint(show, "text/plain", rf; kw...) == "Transducers.Completing(+)"
end

@testset "Completing{Any}(+)" begin
    rf = Completing{Any}(+)
    kw = (; context = :module => Base)
    @test repr(rf; kw...) == "Transducers.Completing{Any}(+)"
    @test sprint(print, rf; kw...) == "Transducers.Completing{Any}(+)"
    @test sprint(show, rf; kw...) == "Transducers.Completing{Any}(+)"
    @test sprint(show, "text/plain", rf; kw...) == "Transducers.Completing{Any}(+)"
end

@testset "TeeRF(min, max)" begin
    rf = TeeRF(min, max)
    kw = (; context = :module => Base)
    @test repr(rf; kw...) == "Transducers.TeeRF(min, max)"
    @test sprint(print, rf; kw...) == "Transducers.TeeRF(min, max)"
    @test sprint(show, rf; kw...) == "Transducers.TeeRF(min, max)"
    @test sprint(show, "text/plain", rf; kw...) == "Transducers.TeeRF(min, max)"
end

@testset "TeeRF{2,Tuple{Any,Any}}((min, max))" begin
    rf = TeeRF{2,Tuple{Any,Any}}((min, max))
    kw = (; context = :module => Base)
    @test repr(rf; kw...) ==ᵣ "Transducers.TeeRF{2,Tuple{Any,Any}}((min, max))"
    @test sprint(print, rf; kw...) ==ᵣ "Transducers.TeeRF{2,Tuple{Any,Any}}((min, max))"
    @test sprint(show, rf; kw...) ==ᵣ "Transducers.TeeRF{2,Tuple{Any,Any}}((min, max))"
    @test sprint(show, "text/plain", rf; kw...) ==ᵣ
          "Transducers.TeeRF{2,Tuple{Any,Any}}((min, max))"
end

@testset "ProductRF(min, max)" begin
    rf = ProductRF(min, max)
    kw = (; context = :module => Base)
    @test repr(rf; kw...) == "Transducers.ProductRF(min, max)"
    @test sprint(print, rf; kw...) == "Transducers.ProductRF(min, max)"
    @test sprint(show, rf; kw...) == "Transducers.ProductRF(min, max)"
    @test sprint(show, "text/plain", rf; kw...) == "Transducers.ProductRF(min, max)"
end

@testset "ProductRF{2,Tuple{Any,Any}}((min, max))" begin
    rf = ProductRF{2,Tuple{Any,Any}}((min, max))
    kw = (; context = :module => Base)
    @test repr(rf; kw...) ==ᵣ "Transducers.ProductRF{2,Tuple{Any,Any}}((min, max))"
    @test sprint(print, rf; kw...) ==ᵣ "Transducers.ProductRF{2,Tuple{Any,Any}}((min, max))"
    @test sprint(show, rf; kw...) ==ᵣ "Transducers.ProductRF{2,Tuple{Any,Any}}((min, max))"
    @test sprint(show, "text/plain", rf; kw...) ==ᵣ
          "Transducers.ProductRF{2,Tuple{Any,Any}}((min, max))"
end

@testset "Eduction" begin
    ed = [1, 2, 3] |> Map(identity)
    spshow_txt_plain_ed = sprint(show, "text/plain", ed)
    @test occursin("3-element", spshow_txt_plain_ed) && occursin("Map(identity)", spshow_txt_plain_ed)
    @test sprint(show, ed) == "[1, 2, 3] |> Map(identity)"
end

@testset "Init" begin
    @test occursin("OnInit(+)", sprint(show, OnInit(+)))
    @test occursin("CopyInit(Any[])", sprint(show, CopyInit([])))
end

end  # module
