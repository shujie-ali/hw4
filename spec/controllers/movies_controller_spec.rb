require 'spec_helper'

describe MoviesController do
  before :each do
    @director = "George Lucas"
    @movies_found = Movie.where(director: @director)
    @movies_not_found = Movie.where("director != ?", @director)
  end

  describe "GET 'similar_movies'" do
    it "should load movies of same director in @movies" do
      get :similar_movies, :movie_id => "1"
      @movies_found.each do |movie|
        assigns(:movies).should include(movie)
      end
      @movies_not_found.each do |movie|
        assigns(:movies).should_not include(movie)
      end
    end
  end
end