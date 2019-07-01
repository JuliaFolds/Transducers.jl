for name in names(@__MODULE__)
    T = getproperty((@__MODULE__), name)
    T isa Type || continue
    T <: Transducer || continue
    isstructtype(T) || continue
    nameof(T) === name || continue

    if :init ∈ fieldnames(T)
        @eval needintype(T::Type{<:$T}) = default_needintype_with_init(T)
    elseif T ∈ [
        Zip,
    ]
        # Use the default `needintype(T) = true` for these transducers.
        # TODO: use `push!!`-based solutions in them.
    else
        @eval needintype(::Type{<:$T}) = false
    end
end
