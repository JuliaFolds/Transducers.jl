@assert merge(Base.ImmutableDict{String,Int}(),
              Base.ImmutableDict{String,Int}()) isa Dict{String,Int}
