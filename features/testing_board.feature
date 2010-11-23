Feature: Setting up the board
  Hi Board!

  Scenario: Board spaces 1,1 8,8 are defined
    Given I have a board
    Then It should be defined at 1, 1
    And It should be defined at 8, 8

  Scenario: Board spaces 0,0 9,9 are not defined
    Given I have a board
    Then It should not be defined at 0, 0
    And It should not be defined at 9, 9

  Scenario: Setting up a pieces
    Given I have a board
    And I am setting up pieces
    When I have a piece at 1, 1
    Then It should be defined at 1, 1

  Scenario: Representation
    Given I have a board
    Then I should see the following board: 
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |

  Scenario: Representing a piece on board
    Given I have a board
    And I am setting up pieces
    When I make a piece at 2, 2
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    |   |   |   |   |   |   |   |   |
    |   | P |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |

	  Scenario: Representing some pieces on board
	    Given I have a board
	    And I am setting up pieces
	    When I make a piece at 2, 2
	    And I make a piece at 4, 4
	    And I make a piece at 6, 8
	    Then I should see the following board:
	    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
	    |   |   |   |   |   |   |   |   |
	    |   | P |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   | P |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   | P |   |   |
