Feature: Reset application information
  In order to test out different scenarios
  I should be able to reset all the
  information related with the players' ranking

  Scenario: I reset all players' ranking information
    Given I am on the home page

    When I click on Reset
    Then I should be on the player page
    And I should see that no players have played a game
