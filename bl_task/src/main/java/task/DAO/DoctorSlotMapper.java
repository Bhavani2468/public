package task.DAO;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import task.model.DoctorSlot;
public class DoctorSlotMapper implements RowMapper<DoctorSlot>{

	@Override
	public DoctorSlot mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		DoctorSlot ds=new DoctorSlot();
		ds.setSlotDoctId(rs.getInt(1));
		ds.setSlotDate(rs.getDate("slot_date"));
	    ds.setSlotFrom(rs.getString("slot_from"));
	    ds.setSlotTo(rs.getString("slot_to"));
	    ds.setSlotStatus(rs.getString("slot_status"));
	    ds.setSlotCount(rs.getInt("slot_count"));
		return ds;
	}

}
