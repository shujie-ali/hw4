Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # flunk "Unimplemented"
end

Then /the director of "(.*)" should be "(.*)"/ do |title,director|
  temp_movie = Movie.find_by_title(title)
  assert temp_movie.director == director
end