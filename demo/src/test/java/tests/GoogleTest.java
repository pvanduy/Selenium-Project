package tests;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.testng.annotations.Test;



public class GoogleTest {    

    @Test
    public void googleTitleTest(){
        
        WebDriver driver = new FirefoxDriver();
        driver.get("https://www.google.com/");
        Assert.assertEquals(driver.getTitle(), "Google");
        System.out.println("Title of page is: " + driver.getTitle());
    }

}