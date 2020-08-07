module TestThreadingAux

include("preamble.jl")
using Transducers: use_threads_for_inner_cats

@testset "use_threads_for_inner_cats" begin
    fivecats = opcompose(Cat(), Cat(), Cat(), Cat(), Cat())
    @test use_threads_for_inner_cats(fivecats'(+), 3, Val(:inf)) ===
          opcompose(TCat(1), TCat(1), TCat(1), TCat(1), TCat(3))'(+)
    @test use_threads_for_inner_cats(fivecats'(+), 3, Val(10)) ===
          opcompose(TCat(1), TCat(1), TCat(1), TCat(1), TCat(3))'(+)
    @test use_threads_for_inner_cats(fivecats'(+), 3, Val(4)) ===
          opcompose(TCat(1), TCat(1), TCat(1), TCat(3), Cat())'(+)
    @test use_threads_for_inner_cats(fivecats'(+), 3, 1) ===
          opcompose(TCat(3), Cat(), Cat(), Cat(), Cat())'(+)

    @test use_threads_for_inner_cats(
        opcompose(Cat(), Map(sin), TCat(1), Map(cos), Cat(), Map(tan))'(+),
        3,
        Val(:inf),
    ) === opcompose(TCat(1), Map(sin), TCat(1), Map(cos), TCat(3), Map(tan))'(+)
    @test use_threads_for_inner_cats(
        opcompose(Cat(), Map(sin), TCat(1), Map(cos), Cat(), Map(tan))'(+),
        3,
        10,
    ) === opcompose(TCat(1), Map(sin), TCat(1), Map(cos), TCat(3), Map(tan))'(+)
    @test use_threads_for_inner_cats(
        opcompose(Cat(), Map(sin), TCat(1), Map(cos), Cat(), Map(tan))'(+),
        3,
        Val(2),
    ) === opcompose(TCat(1), Map(sin), TCat(3), Map(cos), Cat(), Map(tan))'(+)

    @testset "not int" begin
        err = @test_error use_threads_for_inner_cats(fivecats'(+), 3, Val(:non_int))
        @test occursin("`nestlevel` must be an integer", sprint(showerror, err))
    end
    @testset "not positive" begin
        err = @test_error use_threads_for_inner_cats(fivecats'(+), 3, 0)
        @test occursin("`nestlevel` must be positive", sprint(showerror, err))
    end
end

@testset "foldxt" begin
    @testset "`nestlevel` requires `basesize`" begin
        err = @test_error foldxt(+, 1:0; nestlevel = 3)
        @test occursin("`nestlevel` requires `basesize`", sprint(showerror, err))
    end
    @testset "not int" begin
        err = @test_error foldxt(Cat()'(+), 1:0; nestlevel = Val(:not_int), basesize = 3)
        @test occursin("`nestlevel` must be an integer", sprint(showerror, err))
    end
    @testset "not positive" begin
        err = @test_error foldxt(Cat()'(+), 1:0; nestlevel = -1, basesize = 3)
        @test occursin("`nestlevel` must be positive", sprint(showerror, err))
    end
end

end  # module
