Feature: Testing king legal movements

  Scenario: Moving a king
    Given I have a blank game
    When I make a black king at 4, 5
    Then the piece at 4, 5 should be allowed to move to 4, 4
    And the piece at 4, 5 should be allowed to move to 4, 6
    And the piece at 4, 5 should be allowed to move to 5, 4
    And the piece at 4, 5 should be allowed to move to 5, 5
    And the piece at 4, 5 should be allowed to move to 5, 6
    And the piece at 4, 5 should be allowed to move to 3, 4
    And the piece at 4, 5 should be allowed to move to 3, 5
    And the piece at 4, 5 should be allowed to move to 3, 6

  Scenario: Not Moving a king
    Given I have a blank game
    When I make a black king at 4, 5
    Then the piece at 4, 5 should not be allowed to move to 4, 3
    And the piece at 4, 5 should not be allowed to move to 4, 7
    And the piece at 4, 5 should not be allowed to move to 6, 3
    And the piece at 4, 5 should not be allowed to move to 6, 5
    And the piece at 4, 5 should not be allowed to move to 6, 7
    And the piece at 4, 5 should not be allowed to move to 2, 3
    And the piece at 4, 5 should not be allowed to move to 2, 5
    And the piece at 4, 5 should not be allowed to move to 2, 7

  Scenario: Moving a king into a friendly or enemy square
    Given I have a blank game
    When I make a black king at 4, 5
    And I make a white piece at 4, 4
    And I make a black piece at 4, 6
    Then the piece at 4, 5 should be allowed to move to 4, 4
    And the piece at 4, 5 should not be allowed to move to 4, 6

  Scenario: Not Moving a king into check
    Given I have a blank game
    When I make a black king at 4, 5
    And I make a white rook at 5, 3
    Then the piece at 4, 5 should not be allowed to move to 5, 5