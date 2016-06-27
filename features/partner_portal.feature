Feature: Submit Enquiry on Partner Portal

  As a partner
  I want to use partner portal to submit enquiry
  So student needn't to submit enquiry

  Scenario Outline: Submit Enquiry on Partner Portal for new student
    Given I'm on CN homepage
    When I get into Partner Portal
    Then I fill in student details with "<university>"
    And I choose contact person as "no"
    And I fill in referrer details and submit
    Then I can see success included in url

    Examples:
    | university  | 
    | london      |
    | liverpool   |

  Scenario: Submit Enquiry on Parter Potal with Overall Info
    Given I'm on CN homepage
    When I get into Partner Portal
    Then I fill in student details with "london"
    And I choose contact person as "yes"
    And I fill in referrer details and submit
    Then I can see success included in url

