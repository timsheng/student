Feature: Booking Enquiry

  As a student.com user
  I want to booking enquiry
  So I can live overseas around the school

  Scenario: Booking Enquiry as A New User
    When I go to a property page
    And I choose available room category
    And I select required tenancy
    And I choose available listing
    And I click enquiry now button
    And I fill in personal info
    And I create password in the popup dialog
#    And I complete the making of an enquiry
    Then I should find this user in the first enquiry result in the booking system

  @cae
  Scenario: Contact an expert from property page
    When I go to a property page for "en-us"
    And I click the contact an expert button
    And I fill in cae specific required info
    And I create password in the popup dialog
    Then I should find this user in the first enquiry result in the booking system

  Scenario: Contact an expert less than 6 months
    When I go to a property page for "en-gb"
    And I click the contact an expert button
    And I submit enquiry less than six months as a new user
    Then I should not find this user in the first enquiry result in the booking system
    And I should find this user in the first student result in the booking system

  @dev
  Scenario: Booking Enquiry as A logined User
    Given The existing user logged in
    When I go to a property page
    And I choose available room category
    And I select required tenancy
    And I choose available listing
    And I click enquiry now button
    And I click submit button on the enquiry submit page
    Then I should find this user in the first enquiry result in the booking system
    And I lost this enquiry by student name

  @room_matrix
  Scenario: Booking Enquiry as A Existing User
    When I go to a property page
    And I choose available room category
    And I select required tenancy
    And I choose available listing
    And I click enquiry now button
    And I fill in personal info with existing account
    And I input password in the popup dialog
    Then I should find this user in the first enquiry result in the booking system
    And I lost this enquiry by student name
