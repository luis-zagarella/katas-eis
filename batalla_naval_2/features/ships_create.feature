Feature: Ships create

  Background:
    Given a board with dimensions "5" x "5"
  
  @wip
  Scenario: Create a small ship in a valid location
    When I create a small ship in position "3:3"
    Then position "3:3" is not empty

   @wip
   Scenario: Create a large ship in a valid location
     When I create a large ship in position "2:2"
     Then position "2:2" and one more position are not empty
     And position "2:3" is not empty

   @wip
   Scenario: Create a ship in a invalid location
     When I create a large ship in position "4:4"
     Then it should raise error "Ship is out of board!"
    
   @wip 
   Scenario: Create a ship over another ship
    When I create a small ship in position "2:2"
    And I create a large ship in position "2:1"
    Then it should raise error "Another ship is in this area!"
