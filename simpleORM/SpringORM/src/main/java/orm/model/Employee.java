package orm.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="chinnuemp")
@Entity
public class Employee {
	
	@Id    
	private Integer empno;
	private Integer dept_no;
	private String ename;
	private String job;
	private Double sal;
	

	public Employee() {
	}

	
	@Override
	public String toString() {
		return "Employee{" + "Emp No=" + empno + ", deptNo=" + dept_no + ", EmpName='" + ename + '\'' + ", job='" + job
				+ '\'' + '}';
	}


	public Integer getEmpno() {
		return empno;
	}


	public Integer getDept_no() {
		return dept_no;
	}


	public String getEname() {
		return ename;
	}


	public String getJob() {
		return job;
	}


	public Double getSal() {
		return sal;
	}


	public void setEmpno(Integer empno) {
		this.empno = empno;
	}


	public void setDept_no(Integer dept_no) {
		this.dept_no = dept_no;
	}


	public void setEname(String ename) {
		this.ename = ename;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public void setSal(Double sal) {
		this.sal = sal;
	}

}