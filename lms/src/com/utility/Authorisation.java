package com.utility;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.Dao.UserCheckDAO;
import com.models.UrlCheck;


@Component
public class Authorisation {
	
	@Autowired
	UserCheckDAO usd;
	
	public boolean checkUrl(String usr,String url,String method)
	{
		int i=0;
		if(usr.equals("user"))
			i=1;
		List<UrlCheck>links=usd.checkLink(i);
		
		for(UrlCheck u : links)
		{
			if(u.getPriv_id()==i && u.getPriv_rpattern().equals(url) && u.getPriv_action().equals(method))
				return true;
		}
		
		return false;
		
	}

}
