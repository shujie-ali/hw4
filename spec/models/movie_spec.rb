require 'spec_helper'

describe Movie do
  before(:each) do
    @my_movie = Movie.find_by_title("2001: A Space Odyssey")
    @not_found = Movie.where("director != ?", @my_movie.director)
    @found = Movie.where(director: @my_movie.director)
  end

  it "Gives Movie of Same Director" do
    movies = @my_movie.find_director
    @found.each do |movie|
      movies.should include(movie)

    end
  @not_found.each do |movie|
      movies.should_not include(movie)
    end
  end
end

