Feature: Starting a Game
  As a player
  In order to play the game
  I must start a game

  Scenario: Starting the Game
    Given I am not yet playing
    When I start a new game
    Then I should be greeted
