package com.Dao;

import java.util.List;

import com.models.UrlCheck;
import com.models.UserSession;

public interface UserCheckDAO {


	public void persist(UserSession us);

	boolean validateUser(String username, String password, String usertype);

	public List<UrlCheck> checkLink(String usr);

}