using Test
@testset begin
    @test collectwords("This is a sample") == ["This", "is", "a", "sample"]
    @test collectwords(" Here is another sample ") == ["Here", "is", "another", "sample"]
    @test collectwords("JustOneWord") == ["JustOneWord"]
    @test collectwords(" ") == []
    @test collectwords("") == []
end
