package com.cognizant.orm_learn;

import com.cognizant.orm_learn.model.Country;
import com.cognizant.orm_learn.service.CountryService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.List;

@SpringBootApplication
public class OrmLearnApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(OrmLearnApplication.class);

    // Static reference to CountryService
    private static CountryService countryService;

    public static void main(String[] args) {
        // Start Spring context and retrieve CountryService bean
        ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
        countryService = context.getBean(CountryService.class);

        // Call test method
        testGetAllCountries();
    }

    private static void testGetAllCountries() {
        LOGGER.info("Start");

        List<Country> countries = countryService.getAllCountries();
        LOGGER.debug("countries={}", countries);

        LOGGER.info("End");
    }
}
