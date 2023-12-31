package InsuranceSystem.ims.Repository;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import InsuranceSystem.ims.models.InsurancePackages;
import InsuranceSystem.ims.models.Users;

@Repository
public class UsersRepository implements IUserRepository {
	private final JdbcTemplate jdbcTemplate;

    @Autowired
    public UsersRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean saveUser(Users user) {
        String insertQuery = "INSERT INTO bvh_users (user_name,user_cdate,user_pwd,user_type,user_status) VALUES (?,?,?,?,?)";
        return jdbcTemplate.update(insertQuery, user.getUser_name(),new Timestamp(new Date().getTime()), user.getUser_pwd(),user.getUser_type(),"ac") > 0;
    }

    public List<InsurancePackages> getAllInsurancePackages() {
        String query = "SELECT * FROM bvh_insurance_packages";
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(InsurancePackages.class));
    }
    
    public boolean updateUserStatus(Long userId, String newStatus) {
        String updateQuery = "UPDATE bvh_users SET user_status = ? WHERE user_id = ?";
        return jdbcTemplate.update(updateQuery, newStatus, userId) > 0;
    }
}
