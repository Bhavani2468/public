package task.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import task.model.Doctor;



@Component
public class DoctorsDAOImpl implements DoctorsDAO {
	
	    JdbcTemplate jdbcTemplate;
	 
	 
	 @Autowired
		public DoctorsDAOImpl(DataSource dataSource) {
			jdbcTemplate = new JdbcTemplate(dataSource);
		}

	    public ArrayList<Doctor> getAllDoctors() {

	        String SQL_query = "SELECT * FROM doctors";

	        RowMapper<Doctor> rowMapper = new RowMapper<Doctor>() {
	            public Doctor mapRow(ResultSet resultSet, int rowNum) throws SQLException {
	                Doctor doctor = new Doctor();
	                doctor.setDoctorid(resultSet.getInt("doctorid"));
	                doctor.setFullname(resultSet.getString("fullname"));
	                doctor.setSpecializationid(resultSet.getInt("specializationid"));
	                doctor.setQualification(resultSet.getString("qualification"));
	                doctor.setExperience(resultSet.getInt("experience"));
	                doctor.setDesignation(resultSet.getString("designation"));
	                doctor.setPhoto(resultSet.getString("photo"));
	                return doctor;
	            }
	        };

	        ArrayList<Doctor> doctors = (ArrayList<Doctor>) jdbcTemplate.query(SQL_query, rowMapper);

	        return doctors;
	    }
}