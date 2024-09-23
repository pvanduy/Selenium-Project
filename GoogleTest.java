package Google;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;


public class GoogleTest {

    public WebDriver driver;
    
    @BeforeClass
    public void setUp() {
        System.out.println("Setting up...");
    }

    @Test(enabled = true)
    public void googleTitleTest(){

        System.out.println("Running Test...");
        Assert.assertEquals(driver.getTitle(), "Google", "Values did not match!");
        System.out.println("Title of page is: " + driver.getTitle());
    }

    @BeforeMethod
    public void beforeMethod() {

        driver = new ChromeDriver();
        driver.get("https://www.google.com/");

    }

    @AfterMethod
    public void afterMethod() {
        System.out.println("Clean up...");
        driver.quit();
    }
}
