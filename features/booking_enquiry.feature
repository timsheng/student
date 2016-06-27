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
  Scenario Outline: Contact an expert from property page
    When I go to a property page for "<locale>"
    And I click the contact an expert button
    And I fill in contact an expert specific required info
    And I create password in the popup dialog
    Then I should find this user in the first enquiry result in the booking system
    And I lost this enquiry by student name

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |

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
