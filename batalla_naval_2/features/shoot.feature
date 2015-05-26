Feature: Shoot 

  Background:
    Given a board with dimensions "5" x "5"
    And a large ship in position: “3:3”
  
  @wip
  Scenario: Shoot and hit
    When I shoot to position “3:3”
    Then I get hit

  @wip
  Scenario: Shoot and miss
    When I shoot to position “1:1”
    Then I get water
 
  @wip
  Scenario: Shoot and sink
    When I shoot to position “3:4”
    Then I get hit
    And I shoot to position “3:3”
    Then I get sink

  @wip
  Scenario: Shoot outside of board
    When I shoot to position “5:5”
    Then it should raise error "Shoot out of board!"
