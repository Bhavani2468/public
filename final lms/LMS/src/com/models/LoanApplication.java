package com.models;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "H_loanApplicants")
public class LoanApplication {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer lnap_id;
	private Integer lnap_cust_id;
	private Date lnap_apdate;
	private BigDecimal lnap_lnty_id;
	private double lnap_amount;
	private double lnap_emi;
	private double lnap_nom_requested;
	private Integer lnap_cibil_Score;
	private String lnap_status;
	private String lnap_conclusion_remarks;
	private Integer lnap_processed_user;
	private Date lnap_processed_Date;

	public LoanApplication() {
		// Default constructor
	}

	public Integer getLnap_id() {
		return lnap_id;
	}

	public void setLnap_id(Integer lnap_id) {
		this.lnap_id = lnap_id;
	}

	public Integer getLnap_cust_id() {
		return lnap_cust_id;
	}

	public void setLnap_cust_id(Integer lnap_cust_id) {
		this.lnap_cust_id = lnap_cust_id;
	}

	public Date getLnap_apdate() {
		return lnap_apdate;
	}

	public void setLnap_apdate(String lnap_apdate) {
		this.lnap_apdate = Date.valueOf(lnap_apdate);
	}

	public BigDecimal getLnap_lnty_id() {
		return lnap_lnty_id;
	}

	public void setLnap_lnty_id(BigDecimal lnap_lnty_id) {
		this.lnap_lnty_id = lnap_lnty_id;
	}

	public double getLnap_amount() {
		return lnap_amount;
	}

	public void setLnap_amount(double lnap_amount) {
		this.lnap_amount = lnap_amount;
	}

	public double getLnap_emi() {
		return lnap_emi;
	}

	public void setLnap_emi(double lnap_emi) {
		this.lnap_emi = lnap_emi;
	}

	public double getLnap_nom_requested() {
		return lnap_nom_requested;
	}

	public void setLnap_nom_requested(double lnap_nom_requested) {
		this.lnap_nom_requested = lnap_nom_requested;
	}

	public Integer getLnap_cibil_Score() {
		return lnap_cibil_Score;
	}

	public void setLnap_cibil_Score(Integer lnap_cibil_Score) {
		this.lnap_cibil_Score = lnap_cibil_Score;
	}

	public String getLnap_status() {
		return lnap_status;
	}

	public void setLnap_status(String lnap_status) {
		this.lnap_status = lnap_status;
	}

	public String getLnap_conclusion_remarks() {
		return lnap_conclusion_remarks;
	}

	public void setLnap_conclusion_remarks(String lnap_conclusion_remarks) {
		this.lnap_conclusion_remarks = lnap_conclusion_remarks;
	}

	public Integer getLnap_processed_user() {
		return lnap_processed_user;
	}

	public void setLnap_processed_user(Integer lnap_processed_user) {
		this.lnap_processed_user = lnap_processed_user;
	}

	public Date getLnap_processed_Date() {
		return lnap_processed_Date;
	}

	public void setLnap_processed_Date(String lnap_processed_Date) {
		this.lnap_processed_Date = Date.valueOf(lnap_processed_Date);
	}

	@Override
	public String toString() {
		return "LoanApplication [lnap_id=" + lnap_id + ", lnap_cust_id=" + lnap_cust_id + ", lnap_apdate=" + lnap_apdate
				+ ", lnap_lnty_id=" + lnap_lnty_id + ", lnap_amount=" + lnap_amount + ", lnap_emi=" + lnap_emi
				+ ", lnap_nom_requested=" + lnap_nom_requested + ", lnap_cibil_Score=" + lnap_cibil_Score
				+ ", lnap_status=" + lnap_status + ", lnap_conclusion_remarks=" + lnap_conclusion_remarks
				+ ", lnap_processed_user=" + lnap_processed_user + ", lnap_processed_Date=" + lnap_processed_Date + "]";
	}
}
