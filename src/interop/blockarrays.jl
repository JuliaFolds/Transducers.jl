"""
    _foldl_blockarray(rf, acc, coll::BlockArrays.BlockArray)
"""
_foldl_blockarray(rf, acc, coll) =
    complete(rf, @return_if_reduced _foldl_blockarray(
        rf, acc, coll,
        (),  # (outer) block indices
        (),  # (outer) offset indices
        Val(ndims(coll) - 1),  # stop recursion when `== Val(length(block))`
    ))

# Looping over outer/right dimensions; i.e., one of `b`, `c`, `d` in
# `coll[a, b, c, d]` but not `a`.
@inline function _foldl_blockarray(rf, acc, coll, block, offset, ValN₋₁)
    nblocks = BlockArrays.nblocks
    blocksize = BlockArrays.blocksize

    i = ndims(coll) - length(block)
    for j in 1:nblocks(coll, i)
        for k in 1:blocksize(coll, i, j)
            acc = @return_if_reduced _foldl_blockarray(
                rf, acc, coll, (j, block...), (k, offset...), ValN₋₁,
            )
        end
    end
    return acc
end

# Finally, looping over the inner/left -most dimension:
@inline function _foldl_blockarray(
    rf,
    acc,
    coll,
    block::NTuple{N₋₁, Int},
    offset::NTuple{N₋₁, Int},
    ::Val{N₋₁},
) where {N₋₁}

    nblocks = BlockArrays.nblocks
    blocksize = BlockArrays.blocksize
    Block = BlockArrays.Block

    @inbounds for j in 1:nblocks(coll, 1)
        array = coll[Block(j, block...)]
        @simd_if rf for k in 1:blocksize(coll, 1, j)
            acc = @next(rf, acc, array[k, offset...])
        end
    end
    return acc
end
