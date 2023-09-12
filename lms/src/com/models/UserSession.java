package com.models;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "H_user_sessions")
public class UserSession {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ussn_id;
	private Integer user_id;
	private String ussn_sessionid;
	private LocalDateTime ussn_cdate;
	private String ussn_key;
	private String ussn_host;
	private LocalDateTime ussn_exptime;
	private String ussn_status;

	public Integer getUser_id() {
		return user_id;
	}

	public String getUssn_sessionid() {
		return ussn_sessionid;
	}

	public LocalDateTime getUssn_cdate() {
		return ussn_cdate;
	}

	public String getUssn_key() {
		return ussn_key;
	}

	public String getUssn_host() {
		return ussn_host;
	}

	public LocalDateTime getUssn_expdate() {
		return ussn_exptime;
	}

	public String getUssn_status() {
		return ussn_status;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getUssn_id() {
		return ussn_id;
	}

	public void setUssn_id(Integer ussn_id) {
		this.ussn_id = ussn_id;
	}

	public LocalDateTime getUssn_exptime() {
		return ussn_exptime;
	}

	public void setUssn_exptime(LocalDateTime ussn_exptime) {
		this.ussn_exptime = ussn_exptime;
	}

	public void setUssn_sessionid(String ussn_sessionid) {
		this.ussn_sessionid = ussn_sessionid;
	}

	public void setUssn_cdate(LocalDateTime ussn_cdate) {
		this.ussn_cdate = ussn_cdate;
	}

	public void setUssn_key(String ussn_key) {
		this.ussn_key = ussn_key;
	}

	public void setUssn_host(String ussn_host) {
		this.ussn_host = ussn_host;
	}

	public void setUssn_expdate(LocalDateTime ussn_expdate) {
		this.ussn_exptime = ussn_expdate;
	}

	public void setUssn_status(String ussn_status) {
		this.ussn_status = ussn_status;
	}

}