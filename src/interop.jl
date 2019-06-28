"""
    _foldl_lazy_vcat(rf, acc, coll::LazyArrays.Vcat)
"""
function _foldl_lazy_vcat(rf, acc, coll)
    isempty(coll.arrays) && return complete(rf, acc)
    result = @return_if_reduced foldlargs(acc, coll.arrays...) do acc, arr
        foldl_nocomplete(rf, acc, arr)
    end
    return complete(rf, result)
end
