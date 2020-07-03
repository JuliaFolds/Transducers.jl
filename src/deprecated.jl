using Base: @deprecate

function Base.:|>(f::Transducer, g::Transducer)
    Base.depwarn(
        "`f::Transducer |> g::Transducer` is deprecated. " *
        "Use `xs |> f |> g |> collect` instead of `collect(f |> g, xs)`. " *
        "For more information, see " *
        "https://juliafolds.github.io/Transducers.jl/dev/howto/upgrade-to-ixf/",
        :|>,
    )
    if Base.JLOptions().depwarn == 1
        @warn """
        `f::Transducer |> g::Transducer` is deprecated.  Instead of

            collect(Filter(f) |> Map(g), xs)
            foldl(+, Filter(f) |> Map(g), xs)

        it's now recommended to use `|>` with input collection

            xs |> Filter(f) |> Map(g) |> collect
            foldl(+, xs |> Filter(f) |> Map(g))

        If there is no input collection; e.g.,

            foldl(right, GroupBy(key, Filter(f) |> Map(g), push!!), xs)

        use `opcompose` instead:

            foldl(right, GroupBy(key, opcompose(Map(f), Filter(g)), push!!), xs)

        For more information, see:
        https://juliafolds.github.io/Transducers.jl/dev/howto/upgrade-to-ixf/
        """ maxlog = 1
    end
    return g ∘ f
end

@deprecate Distinct() Unique()
@deprecate TeeZip(xf) ZipSource(xf) false

# It wasn't a public API but to play on the safe side:
@deprecate induction(itr) extract_transducer(itr) false
