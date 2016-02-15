Feature: Booking Enquiry

  As a student.com user
  I want to booking enquiry
  So they can live overseas around the school

  Scenario: Booking Enquiry as a new user
    When I go to a property page
#    And I click on the first enquiry now button
#    And I fill in personal info
#    And I create password in the popup dialog
    And I complete the making of an enquiry
    Then I should find new user in the first enquiry result in the booking system
