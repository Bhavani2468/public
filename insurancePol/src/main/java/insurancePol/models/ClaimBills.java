package insurancePol.models;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "ClaimBills")
public class ClaimBills {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int clam_id;

    private Integer clbl_billindex;
    private String clbl_document_title;
    private String clbl_document_path;
    private Double clbl_claim_amount;
    private Double clbl_processed_amount;
    private Date clbl_processed_date;

    @ManyToOne
    @JoinColumn(name = "clbl_processed_by")
    private Users clbl_processed_by;

    private String clbl_remarks;
    private String clbl_status;
	public int getClam_id() {
		return clam_id;
	}
	public void setClam_id(int clam_id) {
		this.clam_id = clam_id;
	}
	public Integer getClbl_billindex() {
		return clbl_billindex;
	}
	public void setClbl_billindex(Integer clbl_billindex) {
		this.clbl_billindex = clbl_billindex;
	}
	public String getClbl_document_title() {
		return clbl_document_title;
	}
	public void setClbl_document_title(String clbl_document_title) {
		this.clbl_document_title = clbl_document_title;
	}
	public String getClbl_document_path() {
		return clbl_document_path;
	}
	public void setClbl_document_path(String clbl_document_path) {
		this.clbl_document_path = clbl_document_path;
	}
	public Double getClbl_claim_amount() {
		return clbl_claim_amount;
	}
	public void setClbl_claim_amount(Double clbl_claim_amount) {
		this.clbl_claim_amount = clbl_claim_amount;
	}
	public Double getClbl_processed_amount() {
		return clbl_processed_amount;
	}
	public void setClbl_processed_amount(Double clbl_processed_amount) {
		this.clbl_processed_amount = clbl_processed_amount;
	}
	public Date getClbl_processed_date() {
		return clbl_processed_date;
	}
	public void setClbl_processed_date(Date clbl_processed_date) {
		this.clbl_processed_date = clbl_processed_date;
	}
	public Users getClbl_processed_by() {
		return clbl_processed_by;
	}
	public void setClbl_processed_by(Users clbl_processed_by) {
		this.clbl_processed_by = clbl_processed_by;
	}
	public String getClbl_remarks() {
		return clbl_remarks;
	}
	public void setClbl_remarks(String clbl_remarks) {
		this.clbl_remarks = clbl_remarks;
	}
	public String getClbl_status() {
		return clbl_status;
	}
	public void setClbl_status(String clbl_status) {
		this.clbl_status = clbl_status;
	}
	

}
