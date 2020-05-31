module TestDeprecated

using Test
using Transducers

@testset "|>" begin
    @test_deprecated Map(identity) |> Map(identity)
end

end  # module
