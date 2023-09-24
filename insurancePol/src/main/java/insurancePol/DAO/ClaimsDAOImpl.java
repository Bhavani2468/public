package insurancePol.DAO;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import insurancePol.models.Bill;
import insurancePol.models.ClaimBills;

@Component
public class ClaimsDAOImpl implements ClaimsDAO{

	private final JdbcTemplate jdbcTemplate;

    @Autowired
    public ClaimsDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
	
	@Override
	public boolean createClaim(ClaimBills cm,List<Bill> bills) {
		//String insertQuery = "INSERT INTO ClaimBills (claim_id,clbl_billindex,clbl_document_title,clbl_document_path,clbl_claim_amount,clbl_processed_by,clbl_remarks,clbl_status) VALUES (?,?,?,?,?,?,?,?)";
       // return jdbcTemplate.update(insertQuery, 1,cm.getClbl_billindex(),cm.getClbl_document_title(),cm.getClbl_document_path(),cm.getClbl_claim_amount(),cm.getClbl_processed_by(),cm.getClbl_remarks(),cm.getClbl_status(),"full") > 0;
	return false;
	}

}
