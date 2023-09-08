package com.service;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.DAO;
import com.Dao.DAOImp;
import com.Dao.UserCheckDAO;
import com.models.Customer;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;
import com.models.UserSession;

@Service
public class AppService {
	@Autowired
	private UserCheckDAO usd;

	@Autowired
	private DAO serv;

	@Autowired
	public AppService(DAOImp serv) {
		this.serv = serv;
	}

	@Transactional
	public void addC(Customer la) {
		serv.persist(la);
	}

	@Transactional
	public void addLa(LoanApplication la) {
		serv.persist(la);
	}

	@Transactional
	public void addN(LoanApplicantNominee la) {
		serv.persist(la);
	}

	@Transactional
	public void addAll(Collection<LoanApplication> laa) {
		for (LoanApplication la : laa) {
			serv.persist(la);
		}
	}

	@Transactional(readOnly = true)
	public List<LoanApplication> listAll() {
		return serv.getAllLoanApplicants();
	}

	public boolean checkUser(String username, String password) {
		
		
		if(usd.validateUser(username,password))
			return true;
		return false;
		
	}


	public void sendData(String sessionId, String key, String hostAddress) {
		
		UserSession us = null;
		us.setUser_id(1);
		us.setUssn_sessionid(sessionId);
		us.setUssn_key(key);
		us.setUssn_host(hostAddress);
		us.setUssn_cdate(LocalDateTime.now());
		us.setUssn_expdate(LocalDateTime.now().plusMinutes(30));
		us.setUssn_status("ac");
		
		usd.persist(us);
	}

}
