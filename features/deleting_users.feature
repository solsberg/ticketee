Feature: Deleting users
	In order to remove users
	As an admin
	I want to make them disappear
	
	Background:
		Given there are the following users:
	    | email              | password | admin |
	    | admin@ticketee.com | password | true  |
	    | user@ticketee.com  | password | false |
    And I am signed in as "admin@ticketee.com"
		Given I am on the homepage
		When I follow "Admin"
		And I follow "Users"
		
	Scenario: Delete a user
		And I follow "user@ticketee.com" 
		And I follow "Delete User"
		Then I should see "User has been deleted."

  Scenario: Users can't delete themselves
		And I follow "admin@ticketee.com" 
		Then I should not see "Delete User"
