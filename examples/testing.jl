using Test

if !@isdefined TESTING
    TESTING = false
end

macro testing(ex)
    @assert ex.head === :call
    @assert length(ex.args) == 2
    quote
        ans = $(esc(ex.args[2]))
        @test $(esc(ex.args[1])) == ans
        ans
    end
end
