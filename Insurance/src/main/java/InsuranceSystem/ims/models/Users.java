package InsuranceSystem.ims.models;


import java.util.Date;

public class Users {
    
	
    private String user_name;
    private Date user_cdate;
    private String user_pwd;
    private String user_type;
    private String user_status;
	public String getUser_name() {
		return user_name;
	}
	public Date getUser_cdate() {
		return user_cdate;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public String getUser_type() {
		return user_type;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_cdate(Date user_cdate) {
		this.user_cdate = user_cdate;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	
	

    
}

