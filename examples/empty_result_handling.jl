# # Empty result handling
#
# Transducible processes [`foldl`](@ref) and [`mapfoldl`](@ref) try to
# do the right thing even when `init` is not given, _if_ the given
# binary operation `step` is supported by
# [UniversalIdentity.jl](https://tkf.github.io/UniversalIdentity.jl/dev/)
# (for example, `+`, `*`, `&`, and `|` are supported).  However, those
# functions _throw_ an exception if the given collection is empty or
# filtered out by the transducers:

using Test                                                             #src

using Transducers

add1(x) = x + 1

err = try                                                            # hide
foldl(*, Map(add1), [])
catch err; err; end                                                  # hide
@test err isa Transducers.EmptyResultError                           #src
#md showerror(stdout, err)                                           # hide

# To write robust code, it is recommended to use `init` if there is a
# reasonable default.  However, it may be useful to postpone
# "materializing" the result.  In such case, `Id` from
# UniversalIdentity.jl can be used as a placeholder.

using UniversalIdentity

result = foldl(*, Map(add1), [], init=Id)
nothing                                                              # hide

# `init=Id` is a short-hand notation of `init=Id(*)` (so that `*` does
# not have to be repeated):

@assert result === foldl(*, Map(add1), [], init=Id(*))

# Note also that [`transduce`](@ref) can be used for passing `init` as
# a positional argument:

@assert result === transduce(Map(add1), Completing(*), Id, [])

# Since the input collection `[]` is empty, `result` is `Id(*)` (which
# is an `UniversalIdentity.Identity`):

using UniversalIdentity: Identity
@assert result::Identity === Id(*)

# `Id(*)` is the left identity of `*`.  Multiplying it with any `x`
# from right returns `x` as-is.  This property may be useful, e.g., if
# `result` is known to be a scalar that is multiplied by a matrix just
# after the `foldl`:

@test ones(2, 2) ==                                                    #src
result * ones(2, 2)

# The identities `Id(*)` and `Id(+)` can be `convert`ed to numbers:

@test 1 ===                                                            #src
convert(Int, Id(*))

# `Id(*)` can also be `convert`ed to a `String`:

@test "" ===                                                           #src
convert(String, Id(*))

# This means that no special code is required if the result is going
# to be stored into, e.g., an `Array` or a `struct`:

@test begin                                                            #src
xs = [true, true]
xs[1] = Id(+)
xs
end == [false, true]                                                   #src

# They can be converted into numbers also by using `Integer`:

@test 0 ===                                                            #src
Integer(Id(+))

# or `float`:

@test 1.0 ===                                                          #src
float(Id(*))
#-
