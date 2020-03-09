import BangBang
import OnlineStats
using Documenter
using Transducers
# Not importing `JSON` and `Literate` here so that this file can be
# included from test without adding them as dependencies.

EXAMPLE_PAGES = [
    "Tutorial: Missing values" => "examples/tutorial_missings.md",
    "Tutorial: Parallelism" => "examples/tutorial_parallel.md",
    "Empty result handling" => "examples/empty_result_handling.md",
    "Parallel word count" => "examples/words.md",
    "Writing transducers" => "examples/transducers.md",
    "Writing reducibles" => "examples/reducibles.md",
]

transducers_rm_examples() =
    rm(joinpath(@__DIR__, "src/examples"); force=true, recursive=true)

function transducers_literate(;
        inputbase = joinpath(@__DIR__, "..", "examples"),
        outputbase = joinpath(@__DIR__, "src", "examples"),
        examples = EXAMPLE_PAGES,
        kwargs...)
    transducers_rm_examples()
    for (_, outpath) in examples
        name, = splitext(basename(outpath))
        inputfile = joinpath(inputbase, "$name.jl")
        outputdir = outputbase
        Literate.markdown(
            inputfile, outputdir;
            documenter = true,
            kwargs...)
    end
end

function transducers_makedocs(;
        examples = EXAMPLE_PAGES,
        kwargs...)
    if isempty(examples)
        # Make some dummy examples
        dummypage = joinpath("examples", "dummy.md")
        path = joinpath(@__DIR__, "src", dummypage)
        mkpath(dirname(path))
        write(
            path,
            """
            # Dummy page
            ## Empty result handling
            """
        )
        examples = dummypage
    end
    makedocs(;
        modules = [Transducers],
        pages = [
            "Home" => "index.md",
            "Parallelism" => "parallelism.md",
            "Manual" => "manual.md",
            "Interface" => "interface.md",
            "Examples" => examples,
            hide("Internals" => "internals.md"),
            hide("doctests/show_xf.md"),
            hide("doctests/show_rf.md"),
        ],
        repo = "https://github.com/tkf/Transducers.jl/blob/{commit}{path}#L{line}",
        sitename = "Transducers.jl",
        authors = "Takafumi Arakaki",
        root = @__DIR__,
        strict = true,
        kwargs...)
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
