Feature: Saucedemo Checkout

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked


    Scenario: Attempt to checkout without adding items to cart
      And the 'Cart' button is clicked
      And the 'Checkout' button is clicked
      Then the 'You cannot checkout' message should be displayed during checkout


  Scenario Outline: Incorrect checkout attempts
    Given the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with '<firstName>'
    And the 'Last Name' field is filled with '<lastName>'
    And the 'Zip Code' field is filled with '<zipcode>'
    When the 'Continue' button is clicked
    Then the '<errorMessage>' checkout message is shown
    Examples:
      | firstName | lastName | zipcode | errorMessage |
      |           |          |         | Error: First Name is required |
      | Jake      |          |         | Error: Last Name is required |
      | Jake      | Sim      |         | Error: Postal Code is required |
