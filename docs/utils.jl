import BangBang
import OnlineStats
using Documenter
using Transducers
# Not importing `JSON` and `Literate` here so that this file can be
# included from test without adding them as dependencies.

EXAMPLE_PAGES = [
    "Tutorial: Missing values" => "tutorials/tutorial_missings.md",
    "Tutorial: Parallelism" => "tutorials/tutorial_parallel.md",
    "Parallel word count" => "tutorials/words.md",
    "Upgrade to new `|>` of Transducers.jl 0.4.39" => "howto/upgrade-to-ixf.md",
    "Empty result handling" => "howto/empty_result_handling.md",
    "Writing transducers" => "howto/transducers.md",
    "Writing reducibles" => "howto/reducibles.md",
]

function transducers_rm_examples()
    rm(joinpath(@__DIR__, "src/tutorials"); force = true, recursive = true)
    rm(joinpath(@__DIR__, "src/howto"); force = true, recursive = true)
end

function transducers_literate(;
        inputbase = joinpath(@__DIR__, "..", "examples"),
        outputbase = joinpath(@__DIR__, "src"),
        examples = EXAMPLE_PAGES,
        kwargs...)
    transducers_rm_examples()
    for (_, outpath) in examples
        name, = splitext(basename(outpath))
        inputfile = joinpath(inputbase, "$name.jl")
        outputdir = joinpath(outputbase, dirname(outpath))
        Literate.markdown(
            inputfile, outputdir;
            config = LiterateTest.config(),
            documenter = true,
            kwargs...)
    end
end

function transducers_rm_duplicated_docs()
    shareddocs =
        Docs.Binding.(Ref(Transducers), [:whenstart, :whencomplete, :whencombine]) .=>
            Ref(Docs.Binding(Transducers, :wheninit))
    for (dup, canonical) in shareddocs
        @info "Simplifying docstring: $dup => $canonical"
        pop!(Docs.meta(dup.mod), dup, nothing)
        canstr = only(values(Docs.meta(canonical.mod)[canonical].docs))
        txt = "See [`$(canonical.var)`](@ref $canonical)"
        @eval dup.mod $Docs.@doc $txt $(dup.var)
    end
end

function transducers_makedocs(;
        examples = EXAMPLE_PAGES,
        strict = get(ENV, "CI", "false") == "true",
        doctest = get(ENV, "CI", "false") == "true",
        kwargs...)
    if isempty(examples)
        # Make some dummy examples
        examples = String[]
        for outdir in ["tutorials", "howto"]
            dummypage = joinpath(outdir, "dummy.md")
            path = joinpath(@__DIR__, "src", dummypage)
            mkpath(dirname(path))
            write(
                path,
                """
            # Dummy page
            ## Empty result handling
            """
            )
            push!(examples, dummypage)
        end
    end
    tutorials = filter(((_, path),) -> startswith(path, "tutorials/"), examples)
    howto = filter(((_, path),) -> startswith(path, "howto/"), examples)
    @assert issetequal(union(tutorials, howto), examples)
    @info "`makedocs` with" strict doctest kwargs = (; kwargs...)
    makedocs(;
        modules = [Transducers],
        pages = [
            "Home" => "index.md",
            "Reference" => [
                "Manual" => "reference/manual.md",
                "Interface" => "reference/interface.md",
            ],
            "Tutorials" => tutorials,
            "How-to guides" => howto,
            "Explanation" => [
                "Parallelism" => "parallelism.md",  # TODO: merge this to index.md
                "Comparison to iterators" => "explanation/comparison_to_iterators.md",
                "Glossary" => "explanation/glossary.md",
                hide("Internals" => "explanation/internals.md"),
            ],
        ],
        repo = "https://github.com/JuliaFolds/Transducers.jl/blob/{commit}{path}#L{line}",
        sitename = "Transducers.jl",
        authors = "Takafumi Arakaki",
        root = @__DIR__,
        strict = strict,
        doctest = doctest,
        kwargs...)
end

function transducers_redirection_mapping()
    mapping = [
        # old page => new page
        "manual" => "reference/manual",
        "interface" => "reference/interface",
    ]

    old_examples = [
        "tutorials/tutorial_missings",
        "tutorials/tutorial_parallel",
        "tutorials/words",
        "howto/empty_result_handling",
        "howto/transducers",
        "howto/reducibles",
    ]

    for e in old_examples
        push!(mapping, joinpath("examples", basename(e)) => e)
    end

    return mapping
end

function transducers_make_redirections(;
    mapping = transducers_redirection_mapping(),
    build = joinpath((@__DIR__), "build"),
)
    for (old, new) in mapping
        oldpath = joinpath(build, old)
        newpath = joinpath(build, new)
        relurl = relpath(newpath, oldpath)
        html = """<meta http-equiv="refresh" content="0; url=$relurl"/>"""
        mkpath(oldpath)
        write(joinpath(oldpath, "index.html"), html)
    end
end

function should_push_preview(event_path = get(ENV, "GITHUB_EVENT_PATH", nothing))
    event_path === nothing && return false
    event = JSON.parsefile(event_path)
    pull_request = get(event, "pull_request", nothing)
    pull_request === nothing && return false
    labels = [x["name"] for x in pull_request["labels"]]
    # https://developer.github.com/v3/activity/events/types/#pullrequestevent
    yes = "push_preview" in labels
    if yes
        @info "Trying to push preview as label `push_preview` is specified." labels
    else
        @info "Not pushing preview as label `push_preview` is not specified." labels
    end
    return yes
end
