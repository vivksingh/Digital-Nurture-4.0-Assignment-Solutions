package com.mocking_and_stubbing;

public class ExternalApi {
    public String getData(){
        System.out.println("Fetching dara");
        return "data";
    }
}