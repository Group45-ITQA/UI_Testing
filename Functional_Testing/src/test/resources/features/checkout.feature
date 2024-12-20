Feature: Checkout Form Functionality
  As a user
  I want to verify the first name field does not retain entered values incorrectly
  So that I can understand the bug present in the checkout form

#  @FirstNameBugTest
  Scenario: Verify the first name field does not retain entered values incorrectly when entering last name
    Given I am logged in as a problem user
    And I have an item in my cart
    When I proceed to the checkout page
    And I enter "John" in the first name field
    And I enter "Doe" in the last name field
    And the first name field should contain "e"
    And the last name field should be empty
