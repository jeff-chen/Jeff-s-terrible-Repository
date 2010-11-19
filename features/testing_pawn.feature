Feature: Testing pawn legal movements
  Testing a pawn

  Scenario: Allowing a pawn to advance two squares
    Given I have a blank game
    When I make a black pawn at 2, 2
    And I make a white pawn at 2, 7
    Then the piece at 2, 2 should be allowed to move to 2, 4
    And the piece at 2, 7 should be allowed to move to 2, 5

  Scenario: Not allowing an advanced pawn to advance two squares
    Given I have a blank game
    When I make a black pawn at 2, 3
    And I make a white pawn at 2, 6
    Then the piece at 2, 3 should not be allowed to move to 2, 5
    And the piece at 2, 6 should not be allowed to move to 2, 4

  Scenario: Allowing a white pawn to capture diagonally
    Given I have a blank game
    When I make a black pawn at 4, 4
    And I make a black pawn at 5, 4
    And I make a black pawn at 6, 4
    And I make a white pawn at 4, 5
    And I make a white pawn at 5, 5
    And I make a white pawn at 6, 5
    Then the piece at 4, 4 should be allowed to move to 5, 5
    And the piece at 6, 4 should be allowed to move to 5, 5
    And the piece at 5, 4 should be allowed to move to 4, 5
    And the piece at 5, 4 should be allowed to move to 6, 5
    And the piece at 4, 5 should be allowed to move to 5, 4
    And the piece at 6, 5 should be allowed to move to 5, 4

  Scenario: Not allowing a white pawn to capture in front
    Given I have a blank game
    When I make a black pawn at 4, 4
    And I make a white pawn at 4, 5
    Then the piece at 4, 5 should not be allowed to move to 4, 4
    And the piece at 4, 4 should not be allowed to move to 4, 5

  Scenario: Not allowing a white pawn to capture a friendly piece
    Given I have a blank game
    When I make a white pawn at 4, 4
    And I make a white pawn at 5, 5
    Then the piece at 5, 5 should not be allowed to move to 4, 4

  Scenario: Not allowing a pawn at a boundary to move anywhere!
    Given I have a blank game
    When I make a white pawn at 5, 1
    Then the piece at 5, 1 should not be allowed to move anywhere

  Scenario: Not allowing an unmoved pawn to jump two squares to capture
    Given I have a blank game
    When I make a white pawn at 5, 7
    And I make a black pawn at 5, 6
    And I make a black pawn at 5, 5
    Then the piece at 5, 7 should not be allowed to move anywhere

  Scenario: Not allowing a pinned pawn to move
    pending
    Given I have a game
    When I make a black bishop at 3, 6
    Then I should see the following board: 
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P | P | P | P | P |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   | B |   |   |   |   |   |
    | P | P | P | P | P | P | P | P |
    | R | N | B | Q | K | B | N | R |
    And the piece at 5, 7 should not be allowed to move anywhere