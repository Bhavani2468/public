package task.DAO;

import java.sql.Date;
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
	@Override
	public void updateSlotCount(Date sdate,int doctorid) {
		jdbcTemplate.update("UPDATE doctor_slots SET slot_count = CASE WHEN slot_count > 1 THEN slot_count - 1 ELSE 0 END,slot_status = CASE WHEN slot_count = 1 THEN 'booked' ELSE slot_status END WHERE slot_date = ? and slot_doct_id= ?", new Object[]{sdate,doctorid});
	}
	
	@Override
	public List<DoctorSlot> checkBookedSlot(int doctorid)
	{
	    return jdbcTemplate.query("SELECT * FROM doctor_slots where slot_doct_id= ? and slot_status='booked'", new Object[]{doctorid}, new DoctorSlotMapper());
	}
}
