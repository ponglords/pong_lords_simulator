Feature: Doubles management
  In order to test the different algorithms
  I should be able to add arbitrary doubles matches
  so I can decide which one is the best

  Scenario: I add a doubles match with four different players
    Given I go to the new doubles page
    And I select two winners
    And I select two losers

    When I submit my match
    Then I should be on the player page

  Scenario: I mistakenaly select the same player as a winner and a loser
    Given I go to the new doubles page
    And I select the same player as one of the winners and one of the losers

    When I submit my match
    Then I should be on the new doubles page
    And I should see an error message that all players should be different

  Scenario: I try to add a match without selecting players
    Given I go to the new doubles page

    When I submit my match
    Then I should be on the new doubles page
