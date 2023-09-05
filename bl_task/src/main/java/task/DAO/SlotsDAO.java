package task.DAO;

import java.util.ArrayList;
import java.util.List;

import task.model.DoctorSlot;
import task.model.Slot;

public interface SlotsDAO {
	
	public List<DoctorSlot> getGeneratedDoctorSlots(int doctorid);
	
	public void updateDoctorSlots();

}
