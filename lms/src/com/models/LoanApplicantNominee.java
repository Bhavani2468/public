package com.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "H_loanApplicantsNominees")
public class LoanApplicantNominee {
	@Id
	private Integer lnap_id;
	private String lnap_nominee;
	private String lanp_relation;

	// Constructors

	public LoanApplicantNominee() {
		// Default constructor
	}

	public LoanApplicantNominee(Integer lnap_id, String lnap_nominee, String lanp_relation) {
		this.lnap_id = lnap_id;
		this.lnap_nominee = lnap_nominee;
		this.lanp_relation = lanp_relation;
	}

	// Getter and Setter methods

	public Integer getLnap_id() {
		return lnap_id;
	}

	public void setLnap_id(Integer lnap_idd) {
		this.lnap_id = lnap_idd;
	}

	public String getLnap_nominee() {
		return lnap_nominee;
	}

	public void setLnap_nominee(String lnap_nominee) {
		this.lnap_nominee = lnap_nominee;
	}

	public String getLanp_relation() {
		return lanp_relation;
	}

	public void setLanp_relation(String lanp_relation) {
		this.lanp_relation = lanp_relation;
	}

	@Override
	public String toString() {
		return "LoanApplicantNominee [lnap_id=" + lnap_id + ", lnap_nominee=" + lnap_nominee + ", lanp_relation="
				+ lanp_relation + "]";
	}
}
