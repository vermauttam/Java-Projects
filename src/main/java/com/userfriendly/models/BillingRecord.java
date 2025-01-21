package com.userfriendly.models;

public class BillingRecord {
    private String customerId;
    private double amount;

    // Constructor
    public BillingRecord(String customerId, double amount) {
        this.customerId = customerId;
        this.amount = amount;
    }

    // Getters and Setters
    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
