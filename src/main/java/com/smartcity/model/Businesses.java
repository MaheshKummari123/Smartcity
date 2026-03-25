package com.smartcity.model;

import java.sql.Timestamp;

public class Businesses {
	private int businessId;
	private String businessName;
	private String category;
	private String description;
	private String adress;
	private String contactNumber;
	private String contactEmail;
	private String website;
	private int ownerId;
	private int rating;
	private Timestamp createdAt;
	public Businesses() {
	}
	public Businesses(int businessId, String businessName, String category, String description, String adress,
			String contactNumber, String contactEmail, String website, int rating,Timestamp createdAt) {
		super();
		this.businessId = businessId;
		this.businessName = businessName;
		this.category = category;
		this.description = description;
		this.adress = adress;
		this.contactNumber = contactNumber;
		this.contactEmail = contactEmail;
		this.website = website;
		this.rating = rating;
		this.createdAt=createdAt;
	}
	public int getBusinessId() {
		return businessId;
	}
	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt=createdAt;
	}
	
	
}
