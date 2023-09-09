package com.models;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "H_auser")
public class User {
	@Id
	private Integer auser_id;

	private String auser_username;

	private String auser_password;

	// Constructors

	public User() {
		// Default constructor
	}

	public User(int auser_id, String auser_username, String auser_password) {
		this.auser_id = auser_id;
		this.auser_username = auser_username;
		this.auser_password = auser_password;
	}

	// Getter and Setter methods

	public int getAuser_id() {
		return auser_id;
	}

	public void setAuser_id(int auser_id) {
		this.auser_id = auser_id;
	}

	public String getAuser_username() {
		return auser_username;
	}

	public void setAuser_username(String auser_username) {
		this.auser_username = auser_username;
	}

	public String getAuser_password() {
		return auser_password;
	}

	public void setAuser_password(String auser_password) {
		this.auser_password = auser_password;
	}
}
