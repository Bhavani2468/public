package com.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.models.Customer;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;
import com.models.UserSession;
import com.models.Users;

@Component
public class DAOImp implements DAO {

	@PersistenceContext
	private EntityManager em;

	public void persist(Customer la) {
		em.persist(la);
	}

	public void persist(LoanApplication la, LoanApplicantNominee l) {
		em.persist(la);
		l.setLnap_id(la.getLnap_id());
		System.out.println(la.toString());
		em.persist(l);
	}

	// public void persist(LoanApplicantNominee la, LoanApplication l) {
	// la.setLnap_id(l.getLnap_id());
	// System.out.println(l.toString());
	// em.persist(la);
	// }

	public void updaid(LoanApplication la) {
		LoanApplication laa = (LoanApplication) em.createQuery("select e from LoanApplication e where e.lnap_id=:id")
				.setParameter("id", la.getLnap_id()).getSingleResult();
		laa.setLnap_status(la.getLnap_status());
		laa.setLnap_conclusion_remarks(la.getLnap_conclusion_remarks());
		laa.setLnap_nom_requested(la.getLnap_nom_requested());
		laa.setLnap_processed_Date(la.getLnap_processed_Date().toString());
		laa.setLnap_processed_user(la.getLnap_processed_user());
		System.out.println(la.getLnap_processed_user());
	}

	@SuppressWarnings("unchecked")
	public List<LoanApplication> getAllLoanApplicants() {
		return em.createQuery("SELECT la FROM LoanApplication la").getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Users> getAllLogins() {
		return em.createQuery("SELECT la FROM Users la").getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<UserSession> getAllSessions() {
		return em.createQuery("SELECT la FROM UserSession la").getResultList();
	}

}
