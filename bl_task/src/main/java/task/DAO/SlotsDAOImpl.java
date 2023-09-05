package task.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import task.model.DoctorSlot;
import task.model.Slot;


@Component
public class SlotsDAOImpl implements SlotsDAO {
		
	JdbcTemplate jdbcTemplate;

	java.sql.Date sqlDate=null;
	
	@Autowired
	public SlotsDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<DoctorSlot> getGeneratedDoctorSlots(int doctorid) {
	    return jdbcTemplate.query("SELECT * FROM getDoctorSlotsGenerated(?)", new Object[]{doctorid}, new DoctorSlotMapper());
	}

	
	@Override
	public void updateDoctorSlots()
	{
		jdbcTemplate.update("call updateDoctorSlots()");
	}
	
}
