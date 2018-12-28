# --- Utilities

ieltype(T) =
    if Base.IteratorEltype(T) isa Base.HasEltype
        eltype(T)
    else
        Any
    end

const DenseSubVector{T} =
    SubArray{T, 1, Vector{T}, Tuple{UnitRange{Int64}}, true}


identityof(::typeof(+), e) = zero(e)
identityof(::typeof(*), e) = one(e)
identityof(::typeof(min), e) = typemax(e)
identityof(::typeof(max), e) = typemin(e)
identityof(::typeof(append!), e) = empty(e)
ridentityof(::typeof(append!), e) = ()

_cljapiurl(name) =
    "https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/$name"
_cljref(name) =
    "[`$name` in Clojure]($(_cljapiurl(name)))"
_thx_clj(name) =
    "This API is modeled after $(_cljref(name))."
