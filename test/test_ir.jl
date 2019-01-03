module TestIR

using Test

if Base.JLOptions().check_bounds == 1 || Base.JLOptions().code_coverage != 0
    # Run IR tests in a different process as `--check-bounds=yes` or
    # --code-coverage={user|all} is specified.
    path = joinpath(@__DIR__, "__test_ir.jl")
    code = """
    $(Base.load_path_setup_code())
    include($(repr(path)))
    """
    cmd = Base.julia_cmd()
    cmd = `$cmd --check-bounds=no --code-coverage=none`
    if Base.JLOptions().color == 1
        cmd = `$cmd --color=yes`
    end
    @info "Running IR test in a subprocess..." cmd
    @test success(pipeline(`$cmd -e $code`; stdout=stdout, stderr=stderr))
    @info "Running IR test in a subprocess...DONE"
else
    include("__test_ir.jl")
end

end  # module
