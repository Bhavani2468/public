package InsuranceSystem.ims.Repository;

import java.util.List;

import InsuranceSystem.ims.models.InsurancePackages;
import InsuranceSystem.ims.models.Users;

public interface IUserRepository {
	
	public boolean saveUser(Users user);
	
	public List<InsurancePackages> getAllInsurancePackages();
	
	public boolean updateUserStatus(Long userId, String newStatus);

}
