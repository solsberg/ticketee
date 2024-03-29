Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
	  Given there are the following users:
	    | email              | password | admin |
	    | user@ticketee.com  | password | false |
	    | admin@ticketee.com | password | true  |
	  And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title   | description       |
      | Shiny!  | Eye-blindingly so |
    And there is a state called "Open"
    And I am signed in as "admin@ticketee.com"

    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario:
    When I check "View" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"

  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"

  Scenario: Creating tickets for a project
    When I check "View" for "TextMate 2"
    And I check "Create tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "New Ticket"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so"
    And I press "Create"
    Then I should see "Ticket has been created."

  Scenario: Updating a ticket for a project
    When I check "View" for "TextMate 2"
    And I check "Edit tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Edit"
    And I fill in "Title" with "Really shiny!"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated."

  Scenario: Deleting tickets from a project
    When I check "View" for "TextMate 2"
    And I check "Delete tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Delete"
    Then I should see "Ticket has been deleted."

  Scenario: Changing states for a ticket
    When I check "View" for "TextMate 2"
    And I check "Change states" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I fill in "Text" with "Opening this ticket."
    And I select "Open" from "State"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "Open" within "#ticket .state"

  Scenario: Adding tags to a ticket
    When I check "View" for "TextMate 2"
    And I check "tag" for "TextMate 2"
    And I press "Update"
    And I follow "Sign Out"

    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I fill in "Text" with "Opening this ticket."
    And I fill in "Tags" with "new_tag"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "new_tag" within "#ticket #tags"
