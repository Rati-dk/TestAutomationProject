Feature: Saucedemo Reset Cart State

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked

Scenario: Reset application state by clearing items from the cart
  And the 'Sauce Labs Onesie' is added to the cart
  When the 'Dropdown' button is clicked
  And the 'Reset App State' button is clicked
  Then the cart should be empty

  Scenario Outline: Verify Sidebar Navigation Buttons
    When the 'Dropdown' button is clicked
    And the '<NavigationButton>' button is clicked
    Then the user is directed to '<expectedURL>'
    Examples:
    | NavigationButton      | expectedURL                               |
    | All Items             | https://www.saucedemo.com/inventory.html  |
    | About                 | https://saucelabs.com/                    |
    | Logout                | https://www.saucedemo.com/                |
    | Reset App State       | https://www.saucedemo.com/inventory.html  |
#
#
