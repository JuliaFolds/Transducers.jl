"""
    withprogress(foldable) -> foldable′

Wrap a foldable so that progress is shown in logging-based progress meter
(e.g., Juno) during `foldl`.

# Examples
```jldoctest
julia> using Transducers

julia> xf = Map() do x
           sleep(0.01)
           x
       end;

julia> foldl(+, xf, withprogress(1:100))  # see progress meter
5050
```
"""
withprogress(foldable) = ProgressLoggingFoldable(foldable)

struct ProgressLoggingFoldable{T} <: Foldable
    foldable::T
end

# Juno.progress
function __progress(f; name = "")
    _id = gensym()
    @debug name progress=0.0 _id=_id
    try
        f(_id)
    finally
        @debug name progress="done" _id=_id
    end
end

function Transducers.__foldl__(rf0, val0, coll::ProgressLoggingFoldable)
    __progress() do id
        n = length(coll.foldable)
        xf = Enumerate() |> Map() do (i, x)
            @debug "foldl" _id=id progress=i/n
            x
        end
        rf = Reduction(xf, rf0)
        val = wrap(rf, 1, val0)  # manually `start`ing `Enumerate`
        return Transducers.__foldl__(rf, val, coll.foldable)
    end
end

Base.eltype(::ProgressLoggingFoldable{T}) where {T} = eltype(T)
