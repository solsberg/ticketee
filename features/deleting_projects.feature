Feature: Deleting projects
	In order to remove needless projects
	As a user
	I want to make hem disappear
	
	Scenario: Delete a project
		Given there are the following users:
	    | email              | password | admin |
	    | admin@ticketee.com | password | true |
    And I am signed in as them
		Given there is a project called "TextMate 2" 
		And I am on the homepage 
		When I follow "TextMate 2" 
		And I follow "Delete Project"
		Then I should see "Project has been deleted."
		And I should be on the projects page
		And I should not see "TextMate 2"
