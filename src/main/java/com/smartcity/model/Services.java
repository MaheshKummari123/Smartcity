package com.smartcity.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Services {

    private int serviceId;
    private int businessId;
    private String serviceName;
    private String description;
    private BigDecimal price;
    private int durationMinutes;
    private String status;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Default Constructor
    public Services() {
    }

    // Parameterized Constructor
    public Services(int serviceId, int businessId, String serviceName,
                    String description, BigDecimal price,
                    int durationMinutes, String status,
                    Timestamp createdAt, Timestamp updatedAt) {
        this.serviceId = serviceId;
        this.businessId = businessId;
        this.serviceName = serviceName;
        this.description = description;
        this.price = price;
        this.durationMinutes = durationMinutes;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getBusinessId() {
        return businessId;
    }

    public void setBusinessId(int businessId) {
        this.businessId = businessId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getDurationMinutes() {
        return durationMinutes;
    }

    public void setDurationMinutes(int durationMinutes) {
        this.durationMinutes = durationMinutes;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    // toString Method (Useful for Debugging)

    @Override
    public String toString() {
        return "Services [serviceId=" + serviceId +
                ", businessId=" + businessId +
                ", serviceName=" + serviceName +
                ", description=" + description +
                ", price=" + price +
                ", durationMinutes=" + durationMinutes +
                ", status=" + status +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt + "]";
    }
}