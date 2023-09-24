package insurancePol.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import insurancePol.DAO.ClaimsDAO;
import insurancePol.models.ClaimBills;

@Repository
public class ClaimRepository {
	
	@Autowired
	ClaimsDAO dao;

	public  boolean addClaim(ClaimBills cm) {
		
		return dao.createClaim(cm);
	}

}
