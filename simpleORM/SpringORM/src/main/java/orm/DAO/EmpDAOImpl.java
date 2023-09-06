package orm.DAO;

import java.util.List;
import  orm.model.Employee;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

@Component
public class EmpDAOImpl implements EmpDAO
{

	@PersistenceContext
	private EntityManager em;

	public void persist(Employee emp) {
		em.persist(emp);
	}

	public List<Employee> findAll() {
		return em.createQuery("SELECT e FROM Employee e").getResultList();
	}

}

