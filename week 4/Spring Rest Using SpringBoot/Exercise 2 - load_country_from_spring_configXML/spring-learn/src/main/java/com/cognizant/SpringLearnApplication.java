package com.cognizant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringLearnApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(SpringLearnApplication.class);
    
    public static void main(String[] args) {
        SpringLearnApplication app = new SpringLearnApplication();
        app.displayCountry();
    }

    public void displayCountry() {
        // Load Spring context from country.xml
        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
        
        // Get the 'country' bean
        Country country = (Country) context.getBean("country", Country.class);
        
        // Log the country details
        LOGGER.debug("Country: {}", country.toString());
    }
}
