package orm.service;

import java.util.Collection;
import java.util.List;

import orm.model.Employee;
import orm.DAO.EmpDAO;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class EmpService {

	@Autowired
	private EmpDAO edao;

	@Transactional
	public void add(Employee emp) {
		edao.persist(emp);
	}
	
	@Transactional
	public void addAll(Collection<Employee> empList) {
		for (Employee emp : empList) {
			edao.persist(emp);
		}
	}

	@Transactional(readOnly = true)
	public List<Employee> listAll() {
		
		
		return edao.findAll();

	}

}