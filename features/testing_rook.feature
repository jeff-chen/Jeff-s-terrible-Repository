Feature: Testing rook legal movements

  Scenario: Allowing a rook to move vertically or horizontally
    Given I have a blank game
    When I make a black rook at 4, 5
    Then the piece at 4, 5 should be allowed to move to 4, 4
    And the piece at 4, 5 should be allowed to move to 4, 6
    And the piece at 4, 5 should be allowed to move to 5, 5
    And the piece at 4, 5 should be allowed to move to 3, 5
    And the piece at 4, 5 should be allowed to move to 2, 5
    And the piece at 4, 5 should be allowed to move to 1, 5
    And the piece at 4, 5 should be allowed to move to 6, 5
    And the piece at 4, 5 should be allowed to move to 7, 5
    And the piece at 4, 5 should be allowed to move to 8, 5
    And the piece at 4, 5 should be allowed to move to 4, 3
    And the piece at 4, 5 should be allowed to move to 4, 2
    And the piece at 4, 5 should be allowed to move to 4, 1
    And the piece at 4, 5 should be allowed to move to 4, 7
    And the piece at 4, 5 should be allowed to move to 4, 8

  Scenario: Allowing a rook to move into an enemy piece
    Given I have a blank game
    When I make a black rook at 8, 1
    And I make a white pawn at 7, 1
    And I make a white pawn at 8, 3
    Then the piece at 8, 1 should be allowed to move to 7, 1
    And the piece at 8, 1 should be allowed to move to 8, 3
    And the piece at 8, 1 should not be allowed to move to 6, 1
    And the piece at 8, 1 should not be allowed to move to 8, 5

  Scenario: Not allowing a rook to move into a friendly piece or jump
    Given I have a blank game
    When I make a black rook at 8, 1
    And I make a black pawn at 7, 1
    And I make a black pawn at 8, 3
    Then the piece at 8, 1 should not be allowed to move to 7, 1
    And the piece at 8, 1 should not be allowed to move to 8, 3
    And the piece at 8, 1 should not be allowed to move to 6, 1
    And the piece at 8, 1 should not be allowed to move to 8, 5