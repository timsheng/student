Feature: Login student.com

  As a student
  I want to login student.com
  So I can view personal info

  Scenario Outline: Existing User Login student.com
    Given I'm in login page for "<locale>"
    When I fill in account and password field and submit login
    Then I should see logout on the dropdown list of my account

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |
