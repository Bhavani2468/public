package com.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "H_loanApplicantsNominees")
public class LoanApplicantNominee {
	@Id
	@Column(name="lnap_id")
	private Integer lnap_idd;
	private String lnap_nominee;
	private String lanp_relation;

	// Constructors

	public LoanApplicantNominee() {
		// Default constructor
	}

	public LoanApplicantNominee(Integer lnap_idd, String lnap_nominee, String lanp_relation) {
		this.lnap_idd = lnap_idd;
		this.lnap_nominee = lnap_nominee;
		this.lanp_relation = lanp_relation;
	}

	// Getter and Setter methods

	public Integer getLnap_id() {
		return lnap_idd;
	}

	public void setLnap_id(Integer lnap_idd) {
		this.lnap_idd = lnap_idd;
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
		return "LoanApplicantNominee [lnap_id=" + lnap_idd + ", lnap_nominee=" + lnap_nominee + ", lanp_relation="
				+ lanp_relation + "]";
	}
}
