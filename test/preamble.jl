using Test
using Statistics: mean
using Transducers
using Transducers: finaltype, simple_transduce

inc(x) = x + oneunit(x)

