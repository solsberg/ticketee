Feature: Signing in
	In order to use the site
	As a user
	I want to be able to sign in
	
	Scenario: Signing in via confirmation
		Given there are the following users:
			| email							| password 	| unconfirmed |
			| simon@olsberg.com | password	| true |
		And "simon@olsberg.com" opens the email with subject "Confirmation instructions"
		And they click the first link in the email
		Then I should see "Your account was successfully confirmed."
		And I should see "Signed in as simon@olsberg.com"
		
	Scenario: Signing in via form
		Given there are the following users:
			| email							| password 	|
			| simon@olsberg.com | password	|
	  And I am signed in as them
		Then I should see "Signed in successfully."