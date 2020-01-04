asfoldable(df::DataFrames.AbstractDataFrame) = DataFrames.eachrow(df)
# We can't use `Compat.eachrow` here.  See:
# https://github.com/JuliaData/DataFrames.jl/pull/2067
