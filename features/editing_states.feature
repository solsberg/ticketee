Feature: Editing the list of states
  In order to be able to change the states for tickets
  As an admin
  I want to add and drop them from the application

  Background:
		Given there are the following users:
	    | email              | password | admin |
	    | admin@ticketee.com | password | true |
    And I am signed in as them
    
  Scenario: Creating a state
    When I follow "Admin"
    And I follow "States"
    And I follow "New State"
    And I fill in "Name" with "Duplicate"
    And I press "Create State"
    Then I should see "State has been created."
