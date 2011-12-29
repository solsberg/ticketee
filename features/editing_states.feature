Feature: Editing the list of states
  In order to be able to change the states for tickets
  As an admin
  I want to add and drop them from the application

  Background:
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    
  Scenario: Creating a state
    When I follow "Admin"
    And I follow "States"
    And I follow "New State"
    And I fill in "Name" with "Duplicate"
    And I press "Create State"
    Then I should see "State has been created."

  Scenario: Marking a state as default
    And I am on the homepage
    When I follow "Admin"
    And I follow "States"
    And I follow "Make Default" for the "Open" state
    Then I should see "Open is now the default state."
