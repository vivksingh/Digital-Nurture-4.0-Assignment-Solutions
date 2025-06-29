import static org.junit.Assert.assertEquals;
import com.exercise1.Main;
import org.junit.Test;


public class MainTest{
    @Test
    public void additionTest(){
        int retrived = Main.addition(2, 4);
        int expected = 6;

        assertEquals("retrived and actual do not match", retrived, expected );
    }
}