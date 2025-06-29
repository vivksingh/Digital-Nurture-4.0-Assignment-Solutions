package com.mocking_and_stubbing;

public class MyService {
    private ExternalApi api;

    public MyService(ExternalApi api){
        this.api = api;
    }

    public String fetchData(){
        return "Mock Data";
    }
}
