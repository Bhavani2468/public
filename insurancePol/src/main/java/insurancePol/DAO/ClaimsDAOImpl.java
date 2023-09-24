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
		String ClaimsInsert = "INSERT INTO ClaimBills (clbl_claim_amount,clbl_processed_by,clbl_remarks,clbl_status) VALUES (?,?,?,?)";
		String BillsInsert="";
		boolean flag=true;
		if(flag)
		{
		for(int i=0;i<bills.size();i++)
		   flag = jdbcTemplate.update("INSERT INTO Bill (clbl_document_title,clbl_document_path) VALUES (?,?)",bills.get(i).getClbl_document_title(),bills.get(i).getClbl_document_path()) > 0;
		}

       return jdbcTemplate.update(ClaimsInsert,cm.getClbl_claim_amount(),cm.getClbl_processed_by(),cm.getClbl_remarks(),"full")>0 && flag;
	}

}
