import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Product[] products = new Product[4];
        products[0] = new Product(1, "Laptop", "Electronics");
        products[1] = new Product(2, "Phone", "Electronics");
        products[2] = new Product(3, "Shirt", "Clothing");
        products[3] = new Product(4, "Book", "Education");

        Product foundLinear = ProductSearch.linearSearch(products, "Phone");
        System.out.println("Linear Search Result: " + (foundLinear != null ? foundLinear.productName : "Not Found"));

        Product notFoundLinear = ProductSearch.linearSearch(products, "iPhone");
        System.out.println("Linear Search Result :" + (notFoundLinear != null ? foundLinear.productName : "Not Found"));

        Arrays.sort(products, (a, b) -> a.productName.compareToIgnoreCase(b.productName));

        Product foundBinary = ProductSearch.binarySearch(products, "Book");
        System.out.println("Binary Search Result: " + (foundBinary != null ? foundBinary.productName : "Not Found"));

        Product notFoundBinary = ProductSearch.binarySearch(products, "iPhone");
        System.out.println("Binary Search Result :" + (notFoundBinary != null ? notFoundBinary.productName : "Not Found"));
    }    
}
