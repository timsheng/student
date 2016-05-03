Feature: User Profile

  As a student
  I want to maintain user profile
  So the student can supply enough infomation to BC

  Scenario: Existing user update user profile
    Given The existing user logged in
    When The user update profile in application details page
    Then The username has been changed to new one.

  @dev
  Scenario: New user create user profile
    Given The new user get into application deatils page
    When The user update profile in application details page
    Then Profile percentage should be 100%
