Feature: Editing a user
	In order to change a user's details
	As an admin 
	I want to be able to modify them through a backend form
	
	Background: 
		Given there are the following users:
			| email              | password | admin |
			| admin@ticketee.com | password | true  |
		And I am signed in as them
		And there are the following users:
			| email							| password 	|
			| user@ticketee.com | password	|
		Given I am on the homepage
		When I follow "Admin"
		And I follow "Users"
		And I follow "user@ticketee.com" 
		And I follow "Edit User" 

	Scenario: Updating a user's details
		When I fill in "Email" with "newguy@ticketee.com" 
		And I press "Update User" 
		Then I should see "User has been updated." 
		And I should see "newguy@ticketee.com"
		And I should not see "user@ticketee.com"
		
	Scenario: Toggling a user's admin ability
		When I check "Is an admin?"
		And I press "Update User" 
		Then I should see "User has been updated." 
		And I should see "user@ticketee.com (Admin)"

	Scenario: Updating a user with invalid email is bad
		And I fill in "Email" with "fake"
		And I press "Update User"
		Then I should see "User has not been updated."
		And I should see "Email is invalid"
