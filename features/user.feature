Feature: User
  Scenario: User signs up
    Given I am on the "/" page
    When I fill in "Phone" with "1231231234"
    And I select "Eastport" from "Tide Location"
    And I press "Sign up"
    Then I see "Thanks for signing up"
    And I do not see "Phone Number"
