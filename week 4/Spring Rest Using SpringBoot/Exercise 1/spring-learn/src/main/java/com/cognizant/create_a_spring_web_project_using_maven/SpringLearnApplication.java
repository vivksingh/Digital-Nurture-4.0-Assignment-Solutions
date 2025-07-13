package com.cognizant.create_a_spring_web_project_using_maven;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class SpringLearnApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(SpringLearnApplication.class);

    public static void main(String[] args) {
        LOGGER.info("\nSTART\n");
        SpringApplication.run(SpringLearnApplication.class, args);
        LOGGER.info("\nEnding main\n");
    }
}
