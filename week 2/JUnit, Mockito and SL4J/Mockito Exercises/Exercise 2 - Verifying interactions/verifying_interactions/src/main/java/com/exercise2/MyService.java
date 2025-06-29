package com.exercise2;

public class MyService {
    private ExternalApi api;

    public MyService(ExternalApi api){
        this.api = api;
    }

    public String fetchData(){
        System.out.println("fetching data");
        return api.getData();
    }
}