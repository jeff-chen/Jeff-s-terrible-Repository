Feature: Setting up a game
  Hi Game!

  Scenario: Setting up the game
    As a White Player,
    Given I have a game
    Then the White Player be the Current Player
    And I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P | P | P | P | P |
    | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | P | P | P | P | P | P | P | P |
    | R | N | B | Q | K | B | N | R |

  Scenario: Taking A Turn
    As a White Player,
    Given I have a game
    And I move the piece at 5, 7 to 5, 5
    Then the Black Player be the Current Player
    And I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    | R | N | B | Q | K | B | N | R |
    | P | P | P | P | P | P | P | P |
    | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | 0 | 0 | 0 | 0 | P | 0 | 0 | 0 |
    | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
    | P | P | P | P | 0 | P | P | P |
    | R | N | B | Q | K | B | N | R |

  Scenario: Counting the Pieces
    As a White Player,
    Given I have a game
    Then I should have the following pieces:
    | piece | number |
    | 8 | Pawn |
    | 2 | Knight | 
    | 2 | Bishop | 
    | 2 | Rook | 
    | 1 | Queen |
    | 1 | King |