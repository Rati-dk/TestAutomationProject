package hu.unideb.inf;

import io.cucumber.java.en.Then;

public class SideBarStepDefs extends AbstractStepDefs{
    @Then("the cart should be empty")
    public void theCartShouldBeEmpty() {

        System.out.println("The cart is empty");

    }
}
