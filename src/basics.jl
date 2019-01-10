# --- Utilities

ieltype(T) =
    if Base.IteratorEltype(T) isa Base.HasEltype
        eltype(T)
    else
        Any
    end

avaltype(x) = avaltype(typeof(x))
avaltype(T::Type) = valtype(T)
avaltype(T::Type{<:Union{AbstractArray,AbstractString}}) = eltype(T)

const DenseSubVector{T} =
    SubArray{T, 1, Vector{T}, Tuple{UnitRange{Int64}}, true}


identityof(op, e) = Base.reduce_empty(op, e)
identityof(::typeof(min), e) = typemax(e)
identityof(::typeof(max), e) = typemin(e)
identityof(::typeof(append!), e) = empty(e)
ridentityof(::typeof(append!), e) = ()

const _non_executable_transducer_msg = """
Output type of the transducer is inferred to be a `Union{}`.  This
probably means one or more of the composed transducers throw.
"""

identityof(::Any, ::Type{Union{}}) = error("""
$_non_executable_transducer_msg
You can pass `init` argument to run the transducer forcefully and find
out which one causes the problem.
""")

_cljapiurl(name) =
    "https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/$name"
_cljref(name) =
    "[`$name` in Clojure]($(_cljapiurl(name)))"
_thx_clj(name) =
    "This API is modeled after $(_cljref(name))."


# https://github.com/JuliaLang/julia/pull/30575
const _true_str = sprint(show, true; context=:typeinfo => Bool)
const _false_str = sprint(show, false; context=:typeinfo => Bool)
