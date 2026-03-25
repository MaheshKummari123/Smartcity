package com.smartcity.model;

import java.sql.Timestamp;

public class User {
	private int userId;
	private String username;
	private String password;
	private String email;
	private String userType;
	private String fullName;
	private String phone;
	private Timestamp createdAt;
	
	public User() {
	}
	
	
	public User(int userId, String username , String fullName, String email, String phone,String userType) {
		super();
		this.userId = userId;
		this.username = username;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.userType = userType;
	}


	public User(String username, String password, String email, String userType, String fullName,Timestamp createdAt) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.userType = userType;
		this.fullName = fullName;
		this.createdAt=createdAt;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt=createdAt;
	}
	
}
