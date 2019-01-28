"""
    air.(broadcasting_expression) :: Broadcasted

Broadcast without materialization.

The idea is taken from @dawbarton's `_lazy` function:
https://discourse.julialang.org/t/19641/20.
"""
air(::Any) =
    error("Function `air` must be called with a dot as in: ",
          "`air.(YOUR .+ BROADCASTING .* EXPRESSION ./ HERE)`")

struct Aired{T}
    value::T
end
@inline Broadcast.broadcasted(::typeof(air), x) = Aired(x)
@inline Broadcast.materialize(x::Aired) = x.value


"""
    (@~ broadcasting_expression) :: Broadcasted
"""
macro ~(ex)
    esc(:($air.($ex)))
end
