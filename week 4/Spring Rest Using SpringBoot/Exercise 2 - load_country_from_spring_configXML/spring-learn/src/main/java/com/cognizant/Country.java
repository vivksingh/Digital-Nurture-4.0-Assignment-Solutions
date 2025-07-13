package com.cognizant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Country {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(Country.class);
    
    private String code;
    private String name;

    // Empty constructor with debug log
    public Country() {
        LOGGER.debug("Inside Country Constructor.");
    }

    // Getter for 'code'
    public String getCode() {
        LOGGER.debug("Getting Code: {}", code);
        return code;
    }

    // Setter for 'code'
    public void setCode(String code) {
        LOGGER.debug("Setting Code: {}", code);
        this.code = code;
    }

    // Getter for 'name'
    public String getName() {
        LOGGER.debug("Getting Name: {}", name);
        return name;
    }

    // Setter for 'name'
    public void setName(String name) {
        LOGGER.debug("Setting Name: {}", name);
        this.name = name;
    }

    // toString method
    @Override
    public String toString() {
        return "Country [code=" + code + ", name=" + name + "]";
    }
}
