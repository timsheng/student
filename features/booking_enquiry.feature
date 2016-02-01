Feature: Booking Enquiry

  As a student.com user
  I want to booking enquiry
  So they can live overseas around the school

  Scenario: Booking Enquiry as a new user
    When I go to a property page
    And I click on the room type
    And I book an enquiry
    And I create password in the popup
    Then I should see a new enquiry in the booking system