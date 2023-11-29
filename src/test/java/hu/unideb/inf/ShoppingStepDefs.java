package hu.unideb.inf;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.awt.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class ShoppingStepDefs extends AbstractStepDefs {
    @Given("the {string} is added to the cart")
    public void somethingIsAddedToTheCart(String item) {
        homePage.addItemToCart(item);
    }

    @Given("the {string} is removed from the cart")
    public void itemIsRemovedFromTheCart(String item) {
        homePage.removeItemFromCart(item);
    }
    @Then("the price should read {string}")
    public void thePriceShouldRead(String total) {
        assertEquals(total, homePage.getTotal());
    }

    @Then("the cart should contain {string} and {string}")
    public void theCartShouldContainTheseItems(String item1,String item2) {
        //System.out.println("Verifying cart contains " + item1 + " and " + item2);
        String cartContent = homePage.getCartContent();
        assertTrue(cartContent.contains(item1), "Item " + item1 + " not found in the cart");
        assertTrue(cartContent.contains(item2), "Item " + item2 + " not found in the cart");
    }


    @And("the {string} field is left empty")
    public void leaveFieldEmpty(String field) {
        homePage.fillOutField(field, "");
    }


    @Then("the {string} checkout message is shown")
    public void theErrorMessageCheckoutMessageIsShown(String errorMessage) {
        assertEquals(errorMessage, homePage.getError());
    }

    @Then("the number of items should be {string}")
    public void theNumberOfItemsShouldBe(String num) {
        assertEquals(num, homePage.getNumOfItemInCart());
        //System.out.println("The number of items in the cart = " + num);
    }

    @Then("the {string} message should be displayed during checkout")
    public void verifyErrorMessageDuringCheckout(String message) {
        System.out.println(message);
    }
}
