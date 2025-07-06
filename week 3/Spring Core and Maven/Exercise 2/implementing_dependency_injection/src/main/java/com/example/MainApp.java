package com.example;

import com.example.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Retrieve BookService bean
        BookService bookService = (BookService) context.getBean("bookService");

        // Test method call to verify injection
        bookService.addBook("To Kill a Mockingbird");
    }
}
