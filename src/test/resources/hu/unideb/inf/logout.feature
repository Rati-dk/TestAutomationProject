Feature: Saucedemo User Logout

  Background:
    Given the home page is opened

  # 6points
  Scenario Outline: Logout with Different Credentials
    Given the 'Username' field is filled with '<username>'
    And the 'Password' field is filled with '<password>'
    And the 'Login' button is clicked
    When the 'Dropdown' button is clicked
    And  the 'Logout' button is clicked
    Then the user is directed to 'https://www.saucedemo.com/'

    Examples:
      | username                | password      |
      | standard_user           | secret_sauce  |
      | problem_user            | secret_sauce  |
      | visual_user             | secret_sauce  |
      | performance_glitch_user | secret_sauce  |
      | error_user              | secret_sauce  |


