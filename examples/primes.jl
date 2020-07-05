# # Prime sieve
#
# Transducer `prime_xf` below produces a sequence of prime numbers
# given a sequence of integers 2, 3, 4, and so on.

if !@isdefined isnothing          # hide
    isnothing(x) = x === nothing  # hide
end                               # hide

using Transducers

sieve(xf, x) =
    if isnothing(foldl(right, xf, (x,), init=nothing))
        nothing, xf
    else
        x, opcompose(xf, Filter(n -> n % x != 0))
    end

prime_xf = opcompose(ScanEmit(sieve, Map(identity)), Filter(!isnothing))

using Test                                                             #src
primes = begin                                                         #src
                                                                       #src
collect(prime_xf, 2:10)
                                                                       #src
end                                                                    #src
@test primes == [2, 3, 5, 7]                                           #src
#-

# The usage of transducers in `prime_xf` here is somewhat
# unconventional; it builds a transducer inside a transducer.  That is
# to say, the _state_ of [`ScanEmit`](@ref) is itself a transducer
# (initialized as the identity transducer `Map(identity)`).  The step
# function `sieve` for [`ScanEmit`](@ref) then appends a transducer to
# filter out numbers divisible by a prime number when a prime number
# is found (i.e., a number is not filtered out by existing filter
# transducer).
#
# See: [`right`](@ref), [`ScanEmit`](@ref), [`Map`](@ref),
# [`Filter`](@ref), [`collect`](@ref)

# !!! note "Side notes"
#
#     This is inspired by the prime sieve implemented using
#     [communicating sequential
#     processes](https://en.wikipedia.org/wiki/Communicating_sequential_processes)
#     (CSP) written in [Newsqueak](https://swtch.com/~rsc/thread/) by
#     Doug McIlroy and also ported to
#     [Go](https://golang.org/doc/play/sieve.go) (See also [Google
#     Tech Talk by Rob Pike](https://youtu.be/hB05UFqOtFA?t=1656)).
#     But, once I've written this, I'm not sure if I needed to know
#     about CSP to implement this.  CSP and transducers probably do
#     not relate much.  However, I thought this was a somewhat
#     interesting intersection (and I wanted to give credit to them
#     anyway).
