package task.DAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import task.model.DoctorSlot;
import task.model.Slot;

public interface SlotsDAO {
	
	public List<DoctorSlot> getGeneratedDoctorSlots(int doctorid);
	
	public void updateDoctorSlots();

	public void updateSlotCount(Date sdate,int doctorid);
	
	public List<DoctorSlot> checkBookedSlot(int doctorid);
}
