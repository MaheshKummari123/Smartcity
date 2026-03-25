package com.smartcity.model;

import java.sql.Timestamp;

public class Institutions {
	private int institutionId;
	private String name;
	private String instituitionType;
	private String address;
	private String contactEmail;
	private String contactPhone;
	private String courseOffer;
	private String website;
	private String facilities;
	private Timestamp createdAt;
		
	
	public Institutions() {
		
	}

	public Institutions(String name, String instituitionType, String address, String contactEmail, String contactPhone,
			String courseOffer, String website, String facilities) {
		this.name = name;
		this.instituitionType = instituitionType;
		this.address = address;
		this.contactEmail = contactEmail;
		this.contactPhone = contactPhone;
		this.courseOffer = courseOffer;
		this.website = website;
		this.facilities = facilities;
	}



	public int getInstitutionId() {
		return institutionId;
	}



	public void setInstitutionId(int institutionId) {
		this.institutionId = institutionId;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getInstituitionType() {
		return instituitionType;
	}



	public void setInstituitionTyoe(String instituitionType) {
		this.instituitionType = instituitionType;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getContactEmail() {
		return contactEmail;
	}



	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}



	public String getContactPhone() {
		return contactPhone;
	}



	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}



	public String getCourseOffer() {
		return courseOffer;
	}



	public void setCourseOffer(String courseOffer) {
		this.courseOffer = courseOffer;
	}



	public String getWebsite() {
		return website;
	}



	public void setWebsite(String website) {
		this.website = website;
	}



	public String getFacilities() {
		return facilities;
	}



	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}



	public Timestamp getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
}
