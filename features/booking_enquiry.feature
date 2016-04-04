Feature: Booking Enquiry

  As a student.com user
  I want to booking enquiry
  So I can live overseas around the school

  Scenario: Booking Enquiry as A New User
    When I go to a property page
    And I click on the first enquiry now button
    And I fill in personal info
    And I create password in the popup dialog
#    And I complete the making of an enquiry
    Then I should find this user in the first enquiry result in the booking system

  @Test
  Scenario: Booking Enquiry as A Existing User
    When I go to a property page
    And I click on the first enquiry now button
    And I fill in personal info with existing account
    And I input password in the popup dialog
    Then I should find this user in the first enquiry result in the booking system
    And I lost this enquiry by student name
