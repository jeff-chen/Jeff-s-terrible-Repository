Feature: Setting up a game
  Hi Game!

  Scenario: Setting up the game
    As a White Player,
    Given I have a game
    Then the White Player should be the Current Player
    And the piece at 1, 1 should be black
    And the piece at 8, 8 should be white
    And I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P | P | P | P | P |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    | P | P | P | P | P | P | P | P |
    | R | N | B | Q | K | B | N | R |

  Scenario: Taking A Turn
    As a White Player,
    Given I have a game
    And I move the piece at 5, 7 to 5, 5
    #Then the Black Player should be the Current Player
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P | P | P | P | P |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   | P |   |   |   |
    |   |   |   |   |   |   |   |   |
    | P | P | P | P |   | P | P | P |
    | R | N | B | Q | K | B | N | R |

  Scenario: Counting the Pieces
    As a White Player,
    Given I have a game
    Then White should have the following pieces:
    | number | piece |
    | 8 | Pawn |
    | 2 | Knight | 
    | 2 | Bishop | 
    | 2 | Rook | 
    | 1 | Queen |
    | 1 | King |

  Scenario: Recognizing a king is capturable
    As a White Player,
    Given I have a blank game
    When I make a black king at 1, 1
    And I make a white pawn at 2, 2
    Then the king for black should be capturable

  Scenario: Recognizing a king is not capturable
    As a White Player,
    Given I have a blank game
    When I make a black king at 1, 1
    And I make a white pawn at 3, 2
    Then the king for black should not be capturable

  Scenario: Recognizing Checkmate
    Given I have a game
    When I move the piece at 5, 7 to 5, 5
    And I move the piece at 6, 2 to 6, 3
    And I move the piece at 4, 7 to 4, 5
    And I move the piece at 7, 2 to 7, 4
    And I move the piece at 4, 8 to 8, 4
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P | P |   |   | P |
    |   |   |   |   |   | P |   |   |
    |   |   |   |   |   |   | P | Q |
    |   |   |   | P | P |   |   |   |
    |   |   |   |   |   |   |   |   |
    | P | P | P |   |   | P | P | P |
    | R | N | B |   | K | B | N | R |
    Then White should win the game

  Scenario: Not recognizing checkmate when there is an escape for the king
    Given I have a game
    When I move the piece at 5, 7 to 5, 5
    And I move the piece at 6, 2 to 6, 3
    And I move the piece at 4, 7 to 4, 5
    And I move the piece at 5, 2 to 5, 4
    And I move the piece at 4, 8 to 8, 4
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P |   |   | P | P |
    |   |   |   |   |   | P |   |   |
    |   |   |   |   | P |   |   | Q |
    |   |   |   | P | P |   |   |   |
    |   |   |   |   |   |   |   |   |
    | P | P | P |   |   | P | P | P |
    | R | N | B |   | K | B | N | R |
    And the piece at 6, 1 should not be allowed to move anywhere
    And the piece at 5, 1 should be allowed to move to 5, 2
    And the piece at 7, 2 should be allowed to move to 7, 3
    And there should be no winner

  Scenario: Recognizing not Checkmate
    Given I have a game
    When I move the piece at 5, 7 to 5, 5
    And I move the piece at 6, 2 to 6, 3
    And I move the piece at 4, 7 to 4, 5
    And I move the piece at 7, 2 to 7, 4
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P | P |   |   | P |
    |   |   |   |   |   | P |   |   |
    |   |   |   |   |   |   | P |   |
    |   |   |   | P | P |   |   |   |
    |   |   |   |   |   |   |   |   |
    | P | P | P |   |   | P | P | P |
    | R | N | B | Q | K | B | N | R |
    And there should be no winner

  Scenario: Recognizing Stalemate lol
    Given I have a blank game
    When I make a black rook at 5, 1
    And I make a black queen at 3, 1
    And I make a black king at 4, 6
    And I make a white king at 4, 8
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    |   |   | Q |   | R |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   | K |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   | K |   |   |   |   |
    And it should be stalemate
