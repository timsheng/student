Feature: Login student.com

  As a student
  I want to login student.com
  So I can view personal info

  Scenario: Existing User Login cn.student.com
    Given I'm in login page
    When I fill in account and password field and submit login
    Then I should see logout on the dropdown list of my account
