package insurancePol.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import insurancePol.DAO.ClaimsDAO;
import insurancePol.models.ClaimBills;
import insurancePol.models.Bill;

@Repository
public class ClaimRepository {
	
	@Autowired
	ClaimsDAO dao;

	public  boolean addClaim(ClaimBills cm) {
		String docTitles[]=cm.getClbl_document_title().split(",");
		String docPaths[]=cm.getClbl_document_path().split(",");
		if(docTitles.length==docPaths.length)
		{
			List<Bill> bills=null;
		for(int i=0;i<docTitles.length;i++)
		{
			Bill b=new Bill();	
			b.setClbl_document_title(docTitles[i]);
			b.setClbl_document_title(docPaths[i]);
			System.out.println("At repository"+docTitles[i]+" "+docPaths[i]);
		}
		
		return dao.createClaim(cm,bills);
		}
		else
			return false;
	}

}
