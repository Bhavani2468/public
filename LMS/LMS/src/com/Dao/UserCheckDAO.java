package com.Dao;

import com.models.UserSession;

public interface UserCheckDAO {


	public void persist(UserSession us);

	boolean validateUser(String username, String password, String usertype);

}
