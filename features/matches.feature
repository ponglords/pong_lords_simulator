Feature: Match management
  In order to test the different algorithms
  I should be able to add arbitrary matches
  so I can decide which one is the best

  Scenario: I add a match with two different players
    Given I go to the new match page
    And I select a winner
    And I select a loser

    When I submit my match
    Then I should be on the player page

  Scenario: I mistakenaly select the same player as a winner and a loser
    Given I go to the new match page
    And I select the same player as a winner and a loser

    When I submit my match
    Then I should be on the new match page
    And I should see an error message about selecting the same players

  Scenario: I try to add a match without selecting players
    Given I go to the new match page

    When I submit my match
    Then I should be on the new match page
