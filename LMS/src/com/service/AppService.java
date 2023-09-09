package com.service;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.DAOImp;
import com.Dao.UserCheckDAO;
import com.models.Customer;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;
import com.models.UserSession;
import com.models.Users;

@Component
public class AppService {

	private DAOImp serv;

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

	public void update(LoanApplication l) {
		// TODO Auto-generated method stub
		
	}
	
	@Autowired
	UserCheckDAO usd;
	public boolean checkUser(String username, String password, String usertype) {
		
		System.out.println("In service, validate user() "+usd.validateUser(username,password,usertype));
		if(usd.validateUser(username,password,usertype))
			return true;
		return false;
		
	}

	@Autowired
	private UserSession uss;

	@Transactional
	public void sendData(String sessionId, String key, String hostAddress) {
		
		uss.setUser_id(1);
		uss.setUssn_sessionid(sessionId);
		uss.setUssn_key(key);
		uss.setUssn_host(hostAddress);
		uss.setUssn_cdate(LocalDateTime.now());
		uss.setUssn_expdate(LocalDateTime.now().plusMinutes(30));
		uss.setUssn_status("ac");
		
		usd.persist(uss);
	}
}