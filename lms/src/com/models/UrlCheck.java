package com.models;

import javax.persistence.Entity;
import javax.persistence.*;

import javax.persistence.Table;

@Entity
@Table(name = "H_privileges")
public class UrlCheck {
	
	@Id
	private int pid;
	private int priv_id;
	private String priv_name;
	private String priv_rpattern;
	private String priv_action;
	public int getPriv_id() {
		return priv_id;
	}
	public String getPriv_name() {
		return priv_name;
	}
	public String getPriv_rpattern() {
		return priv_rpattern;
	}
	public String getPriv_action() {
		return priv_action;
	}
	public void setPriv_id(int priv_id) {
		this.priv_id = priv_id;
	}
	public void setPriv_name(String priv_name) {
		this.priv_name = priv_name;
	}
	public void setPriv_rpattern(String priv_rpattern) {
		this.priv_rpattern = priv_rpattern;
	}
	public void setPriv_action(String priv_action) {
		this.priv_action = priv_action;
	}

}
