module TestIR

using Test

if Base.JLOptions().check_bounds == 1
    # Run IR tests in a different process as `--check-bounds=yes` is
    # specified.
    path = joinpath(@__DIR__, "__test_ir.jl")
    code = """
    $(Base.load_path_setup_code())
    include($(repr(path)))
    """
    cmd = Base.julia_cmd()
    cmd = `$cmd --check-bounds=no`
    if Base.JLOptions().color == 1
        cmd = `$cmd --color=yes`
    end
    @test success(run(pipeline(`$cmd -e $code`; stdout=stdout, stderr=stderr)))
else
    include("__test_ir.jl")
end

end  # module
