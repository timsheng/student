Feature: User Profile

  As a student
  I want to maintain user profile
  So the student can supply enough infomation to BC

  Scenario Outline: Existing user update user profile
    Given The existing user logged in for "<locale>"
    When The user update profile in application details page
    Then The username has been changed to new one.

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |

  Scenario Outline: New user create user profile
    Given The new user get into application deatils page for "<locale>"
    When The user update profile in application details page
    Then Profile percentage should be 100%

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |
