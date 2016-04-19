Feature: Sign Up student.com

  As a student
  I want to sign up student.com
  So I can be a member of student.com

  Scenario: Sign Up cn.student.com
    Given I'm in sign up page
    When I fill in all required fields and submit
    Then I can find redirecting included in the page
