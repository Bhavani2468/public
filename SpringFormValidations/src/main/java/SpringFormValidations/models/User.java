package SpringFormValidations.models;

import java.util.Date;

import javax.validation.constraints.*;
 
import org.springframework.format.annotation.DateTimeFormat;
 
public class User {
    @Size(min = 3, max = 50)
    private String username;
     
    @NotBlank
    @Email(message = "Please enter a valid e-mail address")
    private String email;
     
    @NotBlank
    @Size(min = 8, max = 15)
    private String password;
     
    @NotBlank
    private String gender;
     
    @Size(max = 100)
    private String note;
     
    @AssertTrue
    private boolean married;
     
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthDate;
     
    @NotBlank
    private String profession;
 
    @Min(value = 20_000)
    @Max(value = 200_000)
    private long income;

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getGender() {
		return gender;
	}

	public String getNote() {
		return note;
	}

	public boolean isMarried() {
		return married;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public String getProfession() {
		return profession;
	}

	public long getIncome() {
		return income;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public void setMarried(boolean married) {
		this.married = married;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public void setIncome(long income) {
		this.income = income;
	}
         
}
