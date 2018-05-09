Feature: Register new account
  As a Customer
  I want to register my details
  So that I have an account

  Scenario: Display registration page
    Given I am on the homepage
    When I select the register link

  Scenario:  Enter registration details
    When Picsolve account does not exist
    Then I can enter new registration details