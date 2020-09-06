"""
    _foldl_blockarray(rf, acc, coll::BlockArrays.BlockArray)
"""
function _foldl_blockarray(rf::RF, acc, coll) where {RF}
    # `isempty` is required for `map(first, blockaxes(coll))` below
    isempty(coll) && return complete(rf, acc)
    return complete(rf, @return_if_reduced _foldl_blockarray(
        rf, acc, coll,
        (),  # (outer) `Block`s
        (),  # (outer) offset indices
        Val(ndims(coll) - 1),  # stop recursion when `== Val(length(block))`
    ))
end

# Looping over outer/right dimensions; i.e., one of `b`, `c`, `d` in
# `coll[a, b, c, d]` but not `a`.
@inline function _foldl_blockarray(rf::RF, acc, coll, block, offset, ValN₋₁) where {RF}
    blockaxes = BlockArrays.blockaxes

    d = ndims(coll) - length(block)
    sample_block_template = map(first, blockaxes(coll))
    for b in blockaxes(coll, d)
        sample_block = @set sample_block_template[d] = b
        for k in axes(coll[sample_block...], d)
            acc = @return_if_reduced _foldl_blockarray(
                rf, acc, coll, (b, block...), (k, offset...), ValN₋₁,
            )
        end
    end
    return acc
end

# Finally, looping over the inner/left -most dimension:
@inline function _foldl_blockarray(
    rf::RF,
    acc,
    coll,
    block::NTuple{N₋₁, Any},
    offset::NTuple{N₋₁, Int},
    ::Val{N₋₁},
) where {RF,N₋₁}

    blockaxes = BlockArrays.blockaxes

    @inbounds for b in blockaxes(coll, 1)
        array = coll[b, block...]
        @simd_if rf for k in axes(array, 1)
            acc = @next(rf, acc, array[k, offset...])
        end
    end
    return acc
end

# TODO: write reduce for BlockArrays which can be done in the "natural" order
