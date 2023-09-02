package task.DAO;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import task.model.Doctor;

@Component
public interface DoctorsDAO {
	ArrayList<Doctor> getAllDoctors();

}
