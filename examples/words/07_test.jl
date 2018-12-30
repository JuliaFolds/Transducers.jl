@testset begin
    @test countwords("This is a sample") ==
        Dict("This" => 1, "is" => 1, "a" => 1, "sample" => 1)
    @test countwords(" Here is another sample ") ==
        Dict("Here" => 1, "is" => 1, "another" => 1, "sample" => 1)
    @test countwords("JustOneWord") == Dict("JustOneWord" => 1)
    @test countwords(" ") == Dict()
    @test countwords("") == Dict()
end
