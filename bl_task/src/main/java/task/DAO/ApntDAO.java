package task.DAO;


import java.sql.Date;
import java.util.List;

import task.model.Patient;
import task.model.Slot;

public interface ApntDAO {
	boolean createSlot(Slot s);
	boolean registerPatient(Patient p);
	boolean bookApnt();
	List<Integer> adateList();
	List<String> slotList();
	int lastSlotId();
}
