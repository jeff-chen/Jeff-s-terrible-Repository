Feature: Testing knight legal movements

  Scenario: Moving a knight
    Given I have a blank game
    When I make a black knight at 4, 4
    Then the piece at 4, 4 should be allowed to move to 2, 3
    And the piece at 4, 4 should be allowed to move to 3, 2
    And the piece at 4, 4 should be allowed to move to 5, 6
    And the piece at 4, 4 should be allowed to move to 6, 5
    And the piece at 4, 4 should be allowed to move to 5, 2
    And the piece at 4, 4 should be allowed to move to 2, 5
    And the piece at 4, 4 should be allowed to move to 6, 3
    And the piece at 4, 4 should be allowed to move to 3, 6

  Scenario: Moving a knight into another occupied square
    Given I have a blank game
    When I make a black knight at 4, 4
    And I make a black piece at 3, 2
    And I make a white piece at 3, 6
    Then the piece at 4, 4 should be allowed to move to 3, 6
    And the piece at 4, 4 should not be allowed to move to 3, 2