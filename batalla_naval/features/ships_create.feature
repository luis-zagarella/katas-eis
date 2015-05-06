Feature: Ships create

  Background:
    Given a board with dimensions "5" x "5"

  
  Scenario: Create a small ship in a valid location
    When I create a small ship in position "3:3"
    Then position "3:3" is not empty

   Scenario: Create a large ship in a valid location
     When I create a large ship in position "1:1"
     Then position "1:1" and two more positions are not empty
     And position "1:2" is not empty
     And position "1:3" is not empty

   Scenario: Create a medium ship in a valid location
     When I create a medium ship in position "2:2"
     Then position "2:2" and one more position are not empty
     And position "2:3" is not empty

   Scenario: Create a medium ship in a invalid location
     When I create a medium ship in position "4:4"
     Then it should raise error "Ship is out of board!"
    
