package com.models;

import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "H_loantypes")
public class LoanType {
	private Integer lnty_id;
	private String lnty_name;
	private String lnty_desc;

	// Constructors

	public LoanType() {
		// Default constructor
	}

	public LoanType(Integer lnty_id, String lnty_name, String lnty_desc) {
		this.lnty_id = lnty_id;
		this.lnty_name = lnty_name;
		this.lnty_desc = lnty_desc;
	}

	// Getter and Setter methods

	public Integer getLnty_id() {
		return lnty_id;
	}

	public void setLnty_id(Integer lnty_id) {
		this.lnty_id = lnty_id;
	}

	public String getLnty_name() {
		return lnty_name;
	}

	public void setLnty_name(String lnty_name) {
		this.lnty_name = lnty_name;
	}

	public String getLnty_desc() {
		return lnty_desc;
	}

	public void setLnty_desc(String lnty_desc) {
		this.lnty_desc = lnty_desc;
	}
}
