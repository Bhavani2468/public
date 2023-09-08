package com.Dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.models.Customer;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;

@Component
public interface DAO {
	public List<LoanApplication> getAllLoanApplicants();

	public void persist(Customer la);

	public void persist(LoanApplication la);

	public void persist(LoanApplicantNominee la);
}
