processcount(x) = Base.ImmutableDict(x => 1)
countxf = wordsxf |> Map(processcount)

countwords(s; kwargs...) =
    mapreduce(Map(Char) |> countxf,
              (xs...) -> merge(+, xs...),
              transcode(UInt8, s);
              init = Base.ImmutableDict{String,Int}(),
              kwargs...)
