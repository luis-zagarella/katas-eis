Feature: Shoot 


  Background:
    Given a board with dimensions "5" x "5"
    And a medium ship in position: “3:3”

  Scenario: Shoot and hit
    When I shoot to position “3:3”
    Then I get hit

  Scenario: Shoot and miss
    When I shoot to position “1:1”
    Then I get water
 
  Scenario: Shoot and sink
    When I shoot to position “3:4”
    Then I get hit
    And I shoot to position “3:3”
    Then I get sink

