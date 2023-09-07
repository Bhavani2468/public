package com.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.models.Customer;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;

@Component
public class DAOImp implements DAO {

	@PersistenceContext
	private EntityManager em;

	public void persist(Customer la) {
		em.persist(la);
	}

	public void persist(LoanApplication la) {
		em.persist(la);
	}

	public void persist(LoanApplicantNominee la) {
		em.persist(la);
	}

	@SuppressWarnings("unchecked")
	public List<LoanApplication> getAllLoanApplicants() {
		return em.createQuery("SELECT la FROM LoanApplication la").getResultList();
	}
}
