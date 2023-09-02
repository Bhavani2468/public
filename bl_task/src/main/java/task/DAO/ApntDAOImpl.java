package task.DAO;
import java.sql.Date;
import java.math.BigDecimal;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import task.model.Patient;
import task.model.Slot;

@Component
public class ApntDAOImpl implements ApntDAO{
	JdbcTemplate jdbcTemplate;

	int sid,pid;
	java.sql.Date sqlDate=null;
	
	@Autowired
	public ApntDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public boolean createSlot(Slot s) {
		
		int lastid=s.getLastId();
		int buttonid=s.getButtonId();
		int dateid=s.getDateId();
				
		String dateString="2023-09-"+dateid;
				
		if(dateid<10)
		{
			try 
			{
				DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
		        LocalDate date = LocalDate.parse(dateString, inputFormatter);
		        String formattedDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		        sqlDate = java.sql.Date.valueOf(formattedDate);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			try {
			    LocalDate localDate = LocalDate.parse(dateString, formatter);
			    sqlDate = java.sql.Date.valueOf(localDate);

			} catch (Exception e) {
			    e.printStackTrace(); 
			}
		}
		
		
		System.out.println("Final date of sept is "+sqlDate);
		String timeStringFrom="";
		String timeStringTo="";
		if(buttonid==8)
		{
			timeStringFrom="08:00:00";
			timeStringTo="09:30:00";
		}
		else if(buttonid==2)
		{
			timeStringFrom="02:00:00";
			timeStringTo="03:30:00";
		}
		else
		{
			timeStringFrom="06:00:00";
			timeStringTo="07:30:00";
		}
		
		
		

		
		java.sql.Time sqlTimeFrom = null;
		java.sql.Time sqlTimeTo = null;

		try {
		    LocalTime localTimeFrom = LocalTime.parse(timeStringFrom);
		    LocalTime localTimeTo = LocalTime.parse(timeStringTo);

		    sqlTimeFrom = java.sql.Time.valueOf(localTimeFrom);
		    sqlTimeTo = java.sql.Time.valueOf(localTimeTo);
		    
		    System.out.println("Implementing......"+sqlTimeFrom+" "+sqlTimeTo);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		    
		return jdbcTemplate.update("insert into cl_acal (slot_doct_id,slot_date,slot_from,slot_to,slot_status) values(?,?,?,?,?)", 1,sqlDate , sqlTimeFrom,sqlTimeTo,"bd") > 0;
	}

	@Override
	public boolean registerPatient(Patient p) {
		
		return jdbcTemplate.update("insert into patient (p_name,p_age,p_gen,p_mobile) values(?,?,?,?)", p.getName(),p.getAge(),p.getGender(),p.getMobile()) > 0;
	}
	@Override
	public List<Integer> adateList() {
		return jdbcTemplate.queryForList("SELECT EXTRACT(DAY FROM ap_adate) FROM apmnt where EXTRACT(month FROM ap_adate)=9 group by ap_adate  having count(ap_adate)>=9", Integer.class);

	}@Override
	public List<String> slotList() {
		
		
		List<Map<String, Object>> resultList = jdbcTemplate.queryForList("SELECT EXTRACT(DAY FROM slot_date) as day,EXTRACT(hour FROM slot_from) as sf FROM cl_acal where EXTRACT(month FROM slot_date)=9 group by (slot_date,slot_from)  having count(*)>=3");

			List<String> l = new ArrayList<>();

			for (Map<String, Object> row : resultList) {
				BigDecimal dayDouble = (BigDecimal) row.get("day");
			    Integer day = (dayDouble != null) ? dayDouble.intValue() : null;
			    BigDecimal sfv = (BigDecimal) row.get("sf");
			    Integer slotId = (sfv != null) ? sfv.intValue() : null;
			    

			    String concatenatedValue = day + ":" + slotId;
			    l.add(concatenatedValue);
			}
			return l;
	}
	@Override
	public boolean bookApnt() {
		
		sid = jdbcTemplate.queryForObject("SELECT slot_id FROM cl_acal ORDER BY slot_id DESC LIMIT 1", Integer.class);
		pid = jdbcTemplate.queryForObject("SELECT p_id FROM patient ORDER BY p_id DESC LIMIT 1", Integer.class);
		
		LocalDate currentDate = LocalDate.now();
		java.sql.Date sqlbd = Date.valueOf(currentDate);
		return jdbcTemplate.update("insert into apmnt (ap_bdate,ap_adate,ap_doct_id,ap_patn_id,slot_id,ap_status) values(?,?,?,?,?,?)", sqlbd,sqlDate,1,pid,sid,"bd") > 0;
	}
@Override
public int lastSlotId() {
	
	return jdbcTemplate.queryForObject("SELECT slot_id FROM cl_acal ORDER BY slot_id DESC LIMIT 1", Integer.class);
}


}