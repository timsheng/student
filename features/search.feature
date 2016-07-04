Feature: Search Function

  As a student
  I hope to be able to seach city , area, university and property
  So I can find the most propriate choice to live aboard

  Scenario Outline: Autosuggestion on hero banner
    Given I'm on homepage for "<locale>"
    When I input "<keywords>" in the hero banner searchbox
    Then "<expected_city>" should be available in the city autosuggestion result
    Then "<expected_university>" should be available in the univeristy autosuggestion result
    Then "<expected_property>" should be available in the property autosuggestion result

     Examples:
     | locale |   keywords  |  expected_city |   expected_university      |   expected_property        |
     | zh-cn  |   liverpool |  利物浦         |  University of Liverpool   |   Victoria Hall Liverpool  |
     | zh-cn  |   利物浦     |  利物浦         |  University of Liverpool   |   null                     |
     | en-us  |   liverpool |  liverpool     |  University of Liverpool   |   Victoria Hall Liverpool  |

  Scenario Outline: Autosuggestion on navigation
    Given I'm on homepage for "<locale>"
    When I let the navigation searchbox appear
    When I input "<keywords>" in the navigation searchbox
    Then "<expected_city>" should be available in the city autosuggestion result
    Then "<expected_university>" should be available in the univeristy autosuggestion result
    Then "<expected_property>" should be available in the property autosuggestion result

     Examples:
     | locale |   keywords  |  expected_city |   expected_university      |   expected_property        |
     | zh-cn  |   liverpool |  利物浦         |  University of Liverpool   |   Victoria Hall Liverpool  |
     | zh-cn  |   利物浦     |  利物浦         |  University of Liverpool   |   null                     |
     | en-us  |   liverpool |  liverpool     |  University of Liverpool   |   Victoria Hall Liverpool  |

  Scenario Outline: Popular search
    Given I'm on homepage for "<locale>"
    When I click popular text in the popular section
    Then Corresponding popular text should be available in the SRP or PP

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |

  Scenario Outline: Search city via 'Enter' keyboard on hero banner
    Given I'm on homepage for "<locale>"
    When I input "london" in the hero banner searchbox
    And I hit enter keyboard
    Then "london" should be included in the url

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |

  Scenario Outline: Search university via clicking search button on hero banner
    Given I'm on homepage for "<locale>"
    When I input "University of Liverpool" in the hero banner searchbox
    And I click search button
    Then "university-of-liverpool" should be included in the url

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |

  Scenario Outline: Non Matched Search
    Given I'm on homepage for "<locale>"
    When I input "adkfhajhf" in the hero banner searchbox
    And I click search button
    Then "browse" should be included in the url

    Examples:
    | locale  |
    | zh-cn   |
    | en-us   |
