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
    When I make a vulpix at 2, 2
    Then I should see the following board:
    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    |   |   |   |   |   |   |   |   |
    |   | V |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |

	  Scenario: Representing some pieces on board
	    Given I have a board
	    And I am setting up pieces
	    When I make a vulpix at 2, 2
	    And I make a vulpix at 4, 4
	    And I make a vulpix at 6, 8
	    Then I should see the following board:
	    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
	    |   |   |   |   |   |   |   |   |
	    |   | V |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   | V |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   | V |   |   |
	
	  Scenario: Representing a piece on board
	    Given I have a board
	    And I am setting up pieces
	    When I make a vulpix at 2, 2
	    And I move the vulpix at 2, 2 right 2 spaces and down 1 space
	    And I move the vulpix at 4, 3 left 1 spaces and down 0 space
	    Then I should see the following board:
	    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   | V |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |	
	
	  Scenario: Not moving a piece out of bounds to the right
	    Given I have a board
	    And I am setting up pieces
	    When I make a vulpix at 7, 2
	    And I move the vulpix at 7, 2 right 2 spaces and down 0 space
	    Then I should see the following board:
	    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   | V |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	    |   |   |   |   |   |   |   |   |
	
	  Scenario: Not moving a piece out of bounds to the left
	    Given I have a board
      And I am setting up pieces
      When I make a vulpix at 2, 2
      And I move the vulpix at 2, 2 left 2 spaces and down 0 space
      Then I should see the following board:
      | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
      |   |   |   |   |   |   |   |   |
      | V |   |   |   |   |   |   |   |
      |   |   |   |   |   |   |   |   |
      |   |   |   |   |   |   |   |   |
      |   |   |   |   |   |   |   |   |
      |   |   |   |   |   |   |   |   |
      |   |   |   |   |   |   |   |   |
      |   |   |   |   |   |   |   |   |
  Scenario: Assigning a piece to a square
    Given I have a board
    And I am setting up pieces
    #W
    