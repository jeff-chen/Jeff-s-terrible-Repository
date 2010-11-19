Feature: Testing queen legal movements
  Testing a pawn


  Scenario: Allowing a queen to move diagonally
    Given I have a blank game
    When I make a black queen at 4, 5
    Then the piece at 4, 5 should be allowed to move to 5, 6
    And the piece at 4, 5 should be allowed to move to 6, 7
    And the piece at 4, 5 should be allowed to move to 7, 8
    And the piece at 4, 5 should be allowed to move to 3, 4
    And the piece at 4, 5 should be allowed to move to 2, 3
    And the piece at 4, 5 should be allowed to move to 1, 2
    And the piece at 4, 5 should be allowed to move to 5, 4
    And the piece at 4, 5 should be allowed to move to 6, 3
    And the piece at 4, 5 should be allowed to move to 7, 2
    And the piece at 4, 5 should be allowed to move to 8, 1
    And the piece at 4, 5 should be allowed to move to 3, 6
    And the piece at 4, 5 should be allowed to move to 2, 7
    And the piece at 4, 5 should be allowed to move to 1, 8

  Scenario: Allowing a queen to move vertically or horizontally
    Given I have a blank game
    When I make a black queen at 4, 5
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

  Scenario: Not allowing a queen to jump an enemy piece
    Given I have a blank game
    When I make a black queen at 4, 5
    And I make a white pawn at 3, 4
    And I make a white pawn at 3, 5
    Then the piece at 4, 5 should be allowed to move to 3, 4
    And the piece at 4, 5 should be allowed to move to 3, 5
    And the piece at 4, 5 should not be allowed to move to 2, 3
    And the piece at 4, 5 should not be allowed to move to 2, 5

  Scenario: Not allowing a queen to move into a friendly piece or jump
    Given I have a blank game
    When I make a black queen at 4, 5
    And I make a black pawn at 3, 4
    And I make a black pawn at 3, 5
    Then the piece at 4, 5 should not be allowed to move to 3, 4
    And the piece at 4, 5 should not be allowed to move to 3, 5

  Scenario: Making sure a queen in a corner can calculate moves without crashing
    Given I have a blank game
    When I make a black queen at 1, 1
    Then the piece at 1, 1 should be allowed to move to 2, 2