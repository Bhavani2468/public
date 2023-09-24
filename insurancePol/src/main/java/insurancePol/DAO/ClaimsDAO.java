package insurancePol.DAO;

import java.util.List;

import insurancePol.models.Bill;
import insurancePol.models.ClaimBills;

public interface ClaimsDAO {

	boolean createClaim(ClaimBills cm, List<Bill> bills);

}
