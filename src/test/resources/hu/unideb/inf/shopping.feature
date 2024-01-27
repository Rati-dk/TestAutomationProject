Feature: Saucedemo Shopping

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked

#

#  Scenario Outline: Add Various Items to Cart And Verify
#    Given the '<item1>' is added to the cart
#    And the '<item2>' is added to the cart
#    And the 'Cart' button is clicked
#    Then the cart should contain '<item1>' and '<item2>'
#
#    Examples:
#      | item1                             | item2                   |
#      | Sauce Labs Backpack               | Sauce Labs Bolt T-Shirt |
#      | Sauce Labs Fleece Jacket          | Sauce Labs Onesie       |
#      | Test.allTheThings() T-Shirt (Red) | Sauce Labs Bike Light   |



Scenario Outline: Adding an item and calculate the total
  Given the '<item>' is added to the cart
  And the 'Cart' button is clicked
  And the 'Checkout' button is clicked
  And the 'First Name' field is filled with '<firstName>'
  And the 'Last Name' field is filled with '<lastName>'
  And the 'Zip Code' field is filled with '<zipcode>'
  When the 'Continue' button is clicked
  Then the price should read '<total>'
Examples:
| item | firstName | lastName | zipcode | total |
| Sauce Labs Backpack | Jake | Sim | 1111 | Total: $32.39 |
| Test.allTheThings() T-Shirt (Red) | Snow | John | 2222 | Total: $49.66 |
| Sauce Labs Bolt T-Shirt | Tony | Stark | 4027 | Total: $66.93 |
| Sauce Labs Bike Light | Yati | Koko | 5024 | Total: $77.72 |
| Sauce Labs Fleece Jacket | Jack | Sparrow | 4028 | Total: $131.71 |
| Sauce Labs Onesie | Mark | Zuckerberg  | 4444 | Total: $140.34 |



  Scenario Outline: Verifying Number of items after removing items from cart
    Given the '<item>' is removed from the cart
    Then the number of items should be '<num>'
    Examples:
      | item                            | num |
      | Sauce Labs Bike Light Remove    | 5   |
      | Sauce Labs Onesie Remove        | 4   |
      | Sauce Labs Fleece Jacket Remove | 3   |
      | Sauce Labs Backpack Remove      | 2   |
      | Test.allTheThings() T-shirt (Red) Remove | 1 |



    #  Scenario: Buying a backpack and t-shirt
#    Given the 'Sauce Labs Backpack' is added to the cart
#    And the 'Sauce Labs Bolt T-Shirt' is added to the cart
#    And the 'Cart' button is clicked
#    And the 'Checkout' button is clicked
#    And the 'First Name' field is filled with 'testname_first'
#    And the 'Last Name' field is filled with 'testname_last'
#    And the 'Zip Code' field is filled with '1111'
#    When the 'Continue' button is clicked
#    Then the price should read 'Total: $49.66'













