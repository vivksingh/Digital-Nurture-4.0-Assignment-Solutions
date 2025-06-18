

public class test {
    public static void main(String[] args) throws Exception {
        Logger logger = Logger.getInstance();
        Logger newLogger = Logger.getInstance();

        if (logger == newLogger) {
            System.out.println("Both logger instances are the same.");
        } else {
            System.out.println("Logger instances are different.");
        }

        // Output: Both logger instances are the same.
        // This is because the getInstance method always returns the same instance.
        
    }
}
