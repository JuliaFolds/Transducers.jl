using Base: @deprecate

@deprecate Distinct() Unique()
@deprecate TeeZip(xf) ZipSource(xf) false

# It wasn't a public API but to play on the safe side:
@deprecate induction(itr) extract_transducer(itr) false
