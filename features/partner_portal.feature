Feature: Submit Enquiry on Partner Portal

  As a partner
  I want to use partner portal to submit enquiry
  So student needn't to submit enquiry

  Scenario: Submit Enquiry on Partner Portal for new student
    Given I'm on CN homepage
    When I get into Partner Portal
    And I submit enquiry for new student on partner portal
    Then I can see success included in url

  Scenario: Submit Enquiry on Parter Potal with Overall Info
    Given I'm on CN homepage
    When I get into Partner Portal
    And I submit enquiry for new student on partner portal with overall info
    Then I can see success included in url

