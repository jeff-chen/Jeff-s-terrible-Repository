Feature: Vulpix is fat
  Vulpix is really frakking fat

  Scenario: The beginning!
    Given I have a box of vulpixes
    Then my box should have 0 vulpixes

  Scenario: Vulpix is sooooooo fat
    Given I have a box of vulpixes
    When I have a Vulpix
    Then I should see no eyes
    And my box should have 1 vulpixes

  Scenario: Vulpix lose some weight fatty
    Given I have a box of vulpixes
    When I have 3 vulpixes
    Then I should see no eyes
    And I should see 0 hit points
    And my box should have 3 vulpixes

  Scenario: OMG Vulpix
    Given I have a box of vulpixes
    When I have a vulpix with 15 hit points
    And I have a vulpix with 10 hit points
    Then I should see 25 hit points
    And my box should have 2 vulpixes