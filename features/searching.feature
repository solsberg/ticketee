Feature: Searching
  In order to find specific tickets
  As a user
  I want to enter a search query and get results

  Background:
		Given there is a project called "Ticketee" 
		And there are the following users:
			| email							| password 	|
			| user@ticketee.com | password	|
    And I am signed in as them
		And "user@ticketee.com" can view the "Ticketee" project
		And "user@ticketee.com" can tag the "Ticketee" project
    And "user@ticketee.com" has created a ticket for this project:
			| title	  | description			  | tags        | state    |
			| A tag   | Tagging a ticket  | iteration_1 | Open     |
    And "user@ticketee.com" has created a ticket for this project:
			| title	  | description			  | tags        | state    |
			| Tagged! | Hey! You're it!   | iteration_2 | Closed   |
		And I am on the homepage 
    And I follow "Ticketee" within "#projects"

  Scenario: Finding by tag
    When I fill in "Search" with "tag:iteration_1"
    And I press "Search"
    Then I should see "A tag"
    And I should not see "Tagged!"

  Scenario: Finding by state
    When I fill in "Search" with "state:Closed"
    And I press "Search"
    Then I should see "Tagged!"
    And I should not see "A tag"

  Scenario: Clicking a tag lists search results
    When I follow "A tag"
    And I follow "iteration_1"
    Then I should see "A tag"
    And I should not see "Tagged!"
