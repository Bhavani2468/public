package com.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.models.Customer;
import com.models.UserSession;
import com.models.Users;

@Component
public class UserCheckDAOImpl implements UserCheckDAO {
	
	
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public boolean validateUser(String username, String password, String usertype) {
		
		System.out.println("In UserCheckDAOImpl... "+username+" "+password);
		
		List<Users> users = em.createQuery("SELECT us FROM Users us WHERE us.user_name = :username and us.user_pwd = :password and us.user_type = :usertype")
	            .setParameter("username", username)
	            .setParameter("password", password)
	            .setParameter("usertype", usertype)
	            .getResultList();
	    
	    return !users.isEmpty();
	}

	@Override
	public void persist(UserSession us) {
		em.persist(us);
	}

}
