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

  Scenario: Castling King side
    Given I have a game
    When I move the piece at 5, 7 to 5, 5
    And I move the piece at 5, 2 to 5, 4
    And I move the piece at 7, 8 to 6, 6
    And I move the piece at 7, 1 to 6, 3
    And I move the piece at 6, 8 to 3, 5
    And I move the piece at 6, 1 to 3, 4
    And I move the piece at 5, 8 to 7, 8
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K |   |   | R |
    | P | P | P | P |   | P | P | P |
    |   |   |   |   |   | N |   |   |
    |   |   | B |   | P |   |   |   |
    |   |   | B |   | P |   |   |   |
    |   |   |   |   |   | N |   |   |
    | P | P | P | P |   | P | P | P |
    | R | N | B | Q |   | R | K |   |
    And the Black Player should be the Current Player

  Scenario: Castling Queen side
    Given I have a game
    When I move the piece at 4, 7 to 4, 5
    And I move the piece at 4, 2 to 4, 4
    And I move the piece at 3, 8 to 5, 6
    And I move the piece at 3, 1 to 5, 3
    And I move the piece at 2, 8 to 3, 6
    And I move the piece at 2, 1 to 3, 3
    And I move the piece at 4, 8 to 4, 7
    And I move the piece at 4, 1 to 4, 2
    And I move the piece at 5, 8 to 3, 8
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R |   |   |   | K | B | N | R |
    | P | P | P | Q | P | P | P | P |
    |   |   | N |   | B |   |   |   |
    |   |   |   | P |   |   |   |   |
    |   |   |   | P |   |   |   |   |
    |   |   | N |   | B |   |   |   |
    | P | P | P | Q | P | P | P | P |
    |   |   | K | R |   | B | N | R |
    And the Black Player should be the Current Player

  Scenario: Not castling into check
    Given I have a game
    When I move the piece at 5, 7 to 5, 5
    And I move the piece at 5, 2 to 5, 4
    And I move the piece at 6, 7 to 6, 5
    And I move the piece at 6, 2 to 6, 4
    And I move the piece at 7, 8 to 8, 6
    And I move the piece at 7, 1 to 8, 3
    And I move the piece at 6, 8 to 3, 5
    And I move the piece at 6, 1 to 3, 4
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K |   |   | R |
    | P | P | P | P |   |   | P | P |
    |   |   |   |   |   |   |   | N |
    |   |   | B |   | P | P |   |   |
    |   |   | B |   | P | P |   |   |
    |   |   |   |   |   |   |   | N |
    | P | P | P | P |   |   | P | P |
    | R | N | B | Q | K |   |   | R |
    And the piece at 5, 8 should not be allowed to move to 7, 8