package orm.DAO;

import java.util.List;

import orm.model.Employee;

public interface EmpDAO {

	List<Employee> findAll();

	void persist(Employee emp);

}
