"""
    Broadcasting()

Broadcast inner reducing function over elements in the input.  Roughly
speaking, it transforms the inner reducing function `op` to `op′(a, b)
= op.(a, b)`.  However, it has a better memory usage and better
initial value handling.

If the input is an array, the array created at the first iteration is
reused if it can hold the element types of subsequent iterations.
Otherwise, the array type is widen as needed.

If `init` passed to the fold function is a lazy "initializer" object
such as [`OnInit`](@ref), it is initialized independently for each
item in the first input array.  This makes using `Broadcasting` for
(possibly) in-place functions safe.

!!! compat "Transducers.jl 0.4.32"

    New in version 0.4.32.

!!! note

    `Broadcasting` transducer is not supported in Julia 1.0.

# Examples
```jldoctest Broadcasting
julia> using Transducers

julia> foldl(+, Broadcasting(), [[1, 2], [3, 4], 5])
2-element Vector{Int64}:
  9
 11

julia> foldl(+, Broadcasting(), [(0,), [1], [2.0], [3 + 0im]])
1-element Vector{ComplexF64}:
 6.0 + 0.0im

julia> foldl(
           *,
           [[[1], [10, 100]], [[2], [20, 200]], [[3], [30, 300]]] |>
               Broadcasting() |> Broadcasting(),
       )
2-element Vector{Vector{Int64}}:
 [6]
 [6000, 6000000]
```

When processing nested data structure (e.g., array-of-arrays) and
mutating accumulator in-place, be careful with sharing the
accumulators with each processing of items in the input.  For example,
this is a bad example:

```jldoctest Broadcasting
julia> add!(a, b) = a .+= b;

julia> foldl(add!, Broadcasting(), [[[1], [2, 3]], [[4, 5], 6]];
             init = Ref([0, 0]))
2-element Vector{Vector{Int64}}:
 [13, 15]
 [13, 15]

julia> ans[1] === ans[2]  # they are the same object
true
```

Use `OnInit` to initialize a new array with each item in the input:

```jldoctest Broadcasting
julia> foldl(add!, Broadcasting(), [[[1], [2, 3]], [[4, 5], 6]];
             init = OnInit(() -> [0, 0]))
2-element Vector{Vector{Int64}}:
 [5, 6]
 [8, 9]

julia> ans == [
           add!(add!([0, 0], [1]), [4, 5]),
           add!(add!([0, 0], [2, 3]), 6),
       ]
true
```
"""
struct Broadcasting <: Transducer end


OutputSize(::Type{<:Broadcasting}) = SizeStable()

struct LazyInit{I}
    init::I
end

# Defer calling inner `start`. This is for broadcasting `init` to the
# shape of the first item:
start(::R_{Broadcasting}, init) = LazyInit(init)

@inline next(rf::R_{Broadcasting}, acc::LazyInit, xs) =
    next.(inner(rf), start.(inner(rf), acc.init), xs)
@inline function next(rf::R_{Broadcasting}, accs, xs)
    @! accs .= next.(inner(rf), accs, xs)
    return accs
end
@inline (rf::R_{Broadcasting})(accs, xs) = next(rf, accs, xs)

complete(rf::R_{Broadcasting}, ::LazyInit{typeof(DefaultInit)}) =
    DefaultInitOf{typeof(rf)}()

# Is this the right thing to do?
@inline complete(rf::R_{Broadcasting}, acc::LazyInit) = start.(inner(rf), acc.init)

@inline function complete(rf::R_{Broadcasting}, accs)
    @! accs .= complete.(inner(rf), accs)
    if any(r -> r isa DefaultInitOf, accs)  # is `any` too strict?
        return DefaultInitOf{typeof(rf)}()
    end
    return accs
end

combine(::R_{Broadcasting}, ::LazyInit, accs) = accs
combine(::R_{Broadcasting}, accs, ::LazyInit) = accs
combine(::R_{Broadcasting}, accs::LazyInit, ::LazyInit) = accs
@inline function combine(rf::R_{Broadcasting}, lefts, rights)
    @! lefts .= combine.(inner(rf), lefts, rights)
    return lefts
end
