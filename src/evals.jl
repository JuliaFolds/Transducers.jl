for name in names(@__MODULE__; all=true)
    T = getproperty((@__MODULE__), name)
    T isa Type{<:Transducer} || continue
    isstructtype(T) || continue
    nameof(T) === name || continue
    T === Composition && continue
    @assert T !== Transducer
    @assert T !== AbstractFilter

    if :init ∈ fieldnames(T)
        # This is required only for `Initializer`.
        @eval needintype(T::Type{<:$T}) = default_needintype_with_init(T)
    elseif T ∈ [
        TeeZip,
    ]
        # Use the default `needintype(T) = true` for these transducers.
        # TODO: use `push!!`-based solutions in them.
    else
        # All other builtin transducers do not require the input type.
        @eval needintype(::Type{<:$T}) = false
    end
end
