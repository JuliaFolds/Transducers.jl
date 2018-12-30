@testset begin
    @test collect(wordsxf, "This is a sample") == ["is", "a", "sample", "This"]
    @test collect(wordsxf, " Here is another sample ") == ["Here", "is", "another", "sample"]
    @test collect(wordsxf, "JustOneWord") == ["JustOneWord"]
    @test collect(wordsxf, " ") == []
    @test collect(wordsxf, "") == []
end
