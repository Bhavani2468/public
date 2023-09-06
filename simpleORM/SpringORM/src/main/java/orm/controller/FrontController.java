package orm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import orm.DAO.EmpDAO;
import orm.model.Employee;
import orm.service.EmpService;

@Controller
public class FrontController {
	
	
	@Autowired 
	public EmpService emp;
	
	@RequestMapping(value = "/emp", method = RequestMethod.GET)
	public String output() {
		return "empSearch";
	}
		
	

	@RequestMapping(value = "/emplist", method = RequestMethod.GET)
	public String output(Employee e, Model model) {
		ArrayList<Employee> el=(ArrayList<Employee>) emp.listAll();
		model.addAttribute("elist",el);
		return "emplist";
	}
	
	@RequestMapping(value = "/addnewemp", method = RequestMethod.GET)
	public String addNewEmployee(Model model) {
		System.out.println("Add New Emp JSP Requested");
		return "newemp";
	}

	@RequestMapping(value = "/savenewemp", method = RequestMethod.POST)
	public String saveNewEmployee(@Validated Employee e, Model model) {
		System.out.println("Save New Employee Page Requested");
		emp.add(e);

		model.addAttribute("emp", e);

		return "savedemp";
	}
	
	
}

