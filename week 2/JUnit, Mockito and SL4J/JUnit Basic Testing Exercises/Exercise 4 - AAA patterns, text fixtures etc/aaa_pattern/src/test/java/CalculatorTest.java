import static org.junit.Assert.assertEquals;
import org.junit.*;
import exercise3.Calculator;

public class CalculatorTest {
    private Calculator calc;

    @Before
    public void setup(){
        calc = new Calculator();
        System.out.println("calculator initialized");
    }

    @Test 
    public void additionTest(){
        int a = 2;
        int b = 3;
        int expected = 5;

        int calculated = calc.addition(a, b);

        assertEquals(calculated, expected);
    }

     @Test 
    public void multiplicationTest(){
        int a = 2;
        int b = 3;
        int expected = 6;

        int calculated = calc.multiplication(a, b);

        assertEquals(calculated, expected);
    }

    @After
    public void teardown(){
        calc = null;
        System.out.println("finishing up...");
    }
}


