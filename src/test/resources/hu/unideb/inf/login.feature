Feature: Saucedemo User Login

  Background:
    Given the home page is opened

    #3points
    Scenario: Attempting login without providing username and password
      When the 'Login' button is clicked
      Then the 'Epic sadface: Username is required' message is shown

      #3points
    Scenario: Login with correct credentials and verify redirection
      Given the 'Username' field is filled with 'standard_user'
      And the 'Password' field is filled with 'secret_sauce'
      When the 'Login' button is clicked
      Then the user is directed to 'https://www.saucedemo.com/inventory.html'


    Scenario Outline: Incorrect login attempts
      Given the 'Username' field is filled with '<username>'
      And the 'Password' field is filled with '<password>'
      When the 'Login' button is clicked
      Then the '<errorMessage>' message is shown
      Examples:
        | username        | password       | errorMessage                                                              |
        |                 |                | Epic sadface: Username is required                                        |
        | standard_user   |                | Epic sadface: Password is required                                        |
        | standard_user   | wrong_password | Epic sadface: Username and password do not match any user in this service |
        | locked_out_user | secret_sauce   | Epic sadface: Sorry, this user has been locked out.                       |


    Scenario Outline: Correct login attempts
      Given the 'Username' field is filled with '<username>'
      And the 'Password' field is filled with '<password>'
      When the 'Login' button is clicked
      Then the user is directed to '<PAGE_URL>'
      Examples:
        | username                 | password      | PAGE_URL                                                 |
        | standard_user            |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
        | problem_user             |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
        | performance_glitch_user  |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
        | error_user               |  secret_sauce | https://www.saucedemo.com/inventory.html                 |
        | visual_user              |  secret_sauce | https://www.saucedemo.com/inventory.html                 |


