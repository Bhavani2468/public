package InsuranceSystem.ims.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import InsuranceSystem.ims.Repository.IUserRepository;
import InsuranceSystem.ims.models.Users;


@Service
public class UserService {
	
	@Autowired
	IUserRepository ur;

	public boolean registerUsers(Users u) {
		
		if(ur.saveUser(u))
			return true;
		return false;
	}
    
    
}

