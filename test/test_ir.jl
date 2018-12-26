module TestIR

if Base.JLOptions().check_bounds == 1
    # Run IR tests in a different process as `--check-bounds=yes` is
    # specified.
    code = """
    $(Base.load_path_setup_code())
    """
    cmd = Base.julia_cmd()
    cmd = `$cmd --check-bounds=no`
    if Base.JLOptions().color == 1
        cmd = `$cmd --color=yes`
    end
    run(`$cmd -e $code`)
else
    include("__test_ir.jl")
end

end  # module
