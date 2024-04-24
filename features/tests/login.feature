Feature: Login Test Suite

  @smoke
  Scenario: Login successfully
    Given fill user name with "kloia" on login page
    And fill password with "kloia1234" on login page
    When click login button on login page
    Then verify login