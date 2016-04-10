Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |


Scenario: Find Director for unknown movie (sad path)
  Given I am on detail page of "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"


Scenario: Seaching for movie with same director
  Given I am on detail page of "THX-1138"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "THX-1138"
  And   I should see "Star Wars"
  But   I should not see "Blade Runner"
  
  
Scenario: Adding Director to existing movie with no previous director
  When I go to edit page of "Alien"
  And  I fill in "Director" with "Shujaat Ali"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Shujaat Ali"

