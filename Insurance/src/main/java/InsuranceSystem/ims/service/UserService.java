package InsuranceSystem.ims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import InsuranceSystem.ims.Repository.IUserRepository;
import InsuranceSystem.ims.models.InsurancePackages;
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
    
	public List<InsurancePackages> getInsurancePackages()
	{
		return ur.getAllInsurancePackages();
	}
    
	
	public boolean updateUserStatus(Long userId, String newStatus)
	{
		return ur.updateUserStatus(userId, newStatus);
	}
	
}

