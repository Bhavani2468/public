package com.Dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.models.LoanApplication;

@Component
public interface DAO {
	public List<LoanApplication> getAllLoanApplicants();
}
