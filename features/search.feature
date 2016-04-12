Feature: Search Function
  As a student
  I hope to be able to seach city , area, university and property
  So I can find the most propriate choice to live aboard

  @Test
  Scenario Outline: Autosuggestion on hero banner for china
    Given I'm on CN homepage
    When I input "<keywords>" in the searchbox
    Then "<expected_city>" should be available in the city autosuggestion result
    Then "<expected_university>" should be available in the univeristy autosuggestion result
    Then "<expected_property>" should be available in the property autosuggestion result

     Examples:
     |     keywords      |     expected_city     |     expected_univeristy         |     expected_property           |
     |     liverpool     |     利物浦             |     University of Liverpool     |     Victoria Hall Liverpool     |
     |     利物浦         |     利物浦             |     University of Liverpool     |     null                        |
