const Comprehension = Union{
    Iterators.Generator,
    Iterators.Filter,
    Iterators.Flatten,
}

"""
    eduction(iterator::Iterators.Generator)
    eduction(iterator::Iterators.Filter)
    eduction(iterator::Iterators.Flatten)

Convert an `iterator` to an eduction.  The iterators that are
typically used in the generator comprehensions are supported.

!!! compat "Transducers.jl 0.3"

    New in version 0.3.

# Examples
```jldoctest
julia> using Transducers

julia> iter = (y for x in 1:10 if x % 2 == 0 for y in (x, x + 1));

julia> ed = eduction(iter);

julia> collect(iter) == collect(ed)
true
```
"""
eduction(itr::Comprehension) = eduction(extractxf(itr)...)
eduction(ed::Eduction) = ed

"""
    Transducer(iterator::Iterators.Generator)
    Transducer(iterator::Iterators.Filter)
    Transducer(iterator::Iterators.Flatten)

Extract "processing" part of an `iterator` as a `Transducer`.  The
"data source" iterator (i.e., `xs` in `(f(x) for x in xs)`) is ignored
and `nothing` must be used as a place holder (i.e., `(f(x) for x in
nothing)`).

See also [`eduction`](@ref).

!!! compat "Transducers.jl 0.3"

    New in version 0.3.

# Examples
```jldoctest
julia> using Transducers

julia> xf1 = Transducer(2x for x in nothing if x % 2 == 0);

julia> xf2 = Filter(x -> x % 2 == 0) |> Map(x -> 2x);  # equivalent

julia> xs = 1:10
       collect(xf1, xs) == collect(xf2, xs)
true
```
"""
function Transducer(iter::Comprehension)
    xf, dataiter = extractxf(iter)
    dataiter === nothing && return xf

    if dataiter isa Iterators.ProductIterator
        throw(ArgumentError("""
              Conversion of the product generator comprehension, i.e.,
                  Transducer(... for x in xs, y in ys ...)
              is not supported.
              """))
    else
        throw(ArgumentError("""
              Unsupported iterator:
                  $(typeof(dataiter))
              Note that the "data source" iterator must be set to `nothing`.
              """))
    end
end

iterinner(iter::Iterators.Generator) = iter.iter
iterinner(iter::Iterators.Filter) = iter.itr
iterinner(iter::Iterators.Flatten) = iter.it
# iterf(iter::Iterators.Generate) = iter.f
# iterf(iter::Iterators.Filter) = iter.flt

extractxf(iter) = IdentityTransducer(), iter

function extractxf(iter::Iterators.Generator)
    xf, bottom = extractxf(iterinner(iter))
    return xf |> Map(iter.f), bottom
end

function extractxf(iter::Iterators.Filter)
    xf, bottom = extractxf(iterinner(iter))
    return xf |> Filter(iter.flt), bottom
end

function extractxf(iter::Iterators.Flatten)
    xf, bottom = extractxf(iterinner(iter))
    return xf |> Cat(), bottom
end
