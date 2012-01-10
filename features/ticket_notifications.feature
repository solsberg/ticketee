Feature: Ticket Notifications
  In order to track the progress of a ticket I have a stake in
  As a user
  I want to receive email notifications when the ticket is updated

  Background:
    Given there are the following users:
      | email               | password |
      | alice@ticketee.com  | password |
      | bob@ticketee.com    | password |

    And a clear email queue
    And there is a project called "Textmate 2"
    And "alice@ticketee.com" can view the "Textmate 2" project
    And "bob@ticketee.com" can view the "Textmate 2" project
    And "alice@ticketee.com" has created a ticket for this project:
      | title               | description             |
      | Release date        | TBA very shortly        |
    And I am signed in as "bob@ticketee.com"
    And I am on the homepage

  Scenario: Ticket owner is automatically subscribed to a ticket
    When I follow "Textmate 2"
    And I follow "Release date"
    And I fill in "Text" with "Is it out yet?"
    And I press "Create Comment"

    Then "alice@ticketee.com" should receive an email
    When "alice@ticketee.com" opens the email
    And they should see "[ticketee] Textmate 2 - Release date" in the email subject
    Then they should see "updated the Release date ticket" in the email body
    When they click the first link in the email
    Then I should see "Release date" within "#ticket h2"
