package task.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import task.DAO.ApntDAO;
import task.DAO.ApntDAOoct;
import task.DAO.DoctorsDAO;
import task.model.Doctor;
import task.model.Patient;
import task.model.Slot;

@Controller
public class FrontController {
	
	@Autowired 
	public ApntDAO ap;
	
	@Autowired 
	public ApntDAOoct oct;
	
	@Autowired
	public DoctorsDAO docdao;

	
	@RequestMapping(value = "/res", method = RequestMethod.GET)
	public String inputt(Model model) {
		System.out.println("sept date list is ...."+ap.adateList());
		model.addAttribute("dlist",ap.adateList());
	return "result";
	}

	
	@RequestMapping(value = "/october", method = RequestMethod.GET)
	public String inputOct(Model model)
	{
		System.out.println("october date list is .."+oct.adateList());
		model.addAttribute("olist",oct.adateList());
		return "october";
	}
	
	@RequestMapping(value = "/slot", method = RequestMethod.GET)
	public String inputs(Model model) {
		System.out.println("sept list is"+ap.slotList());
	 model.addAttribute("slist",ap.slotList());
	 model.addAttribute("lastid",ap.lastSlotId());
	 
	 
	 System.out.println("oct list is "+oct.slotList());
	 model.addAttribute("oslist",oct.slotList());
	 model.addAttribute("lastid",oct.lastSlotId());
	
	
	return "slot";
	}
	
	
	
	@RequestMapping(value = "/patients", method = RequestMethod.GET)
	public String inputPatients()
	{
		return "patients";
	}
	
	
	
	@RequestMapping(value = "/amt2", method = RequestMethod.GET)
	public String input(@ModelAttribute Patient pt,@ModelAttribute Slot s,@RequestParam(name = "lastId") int lastId,
            @RequestParam(name = "buttonId") int buttonId,
            @RequestParam(name = "dateId") int dateId,
            @RequestParam(name = "p") String p) {
		System.out.println("Patient is....."+pt.getName()); 
		
		
		s.setLastId(lastId);
	    s.setButtonId(buttonId);
	    s.setDateId(dateId);

		System.out.println("Slot details is....."+s.getLastId()+" "+s.getButtonId()+" "+s.getDateId());
		
		if(p.equals("res"))
		{
			System.out.println("entered sept slot creation..");
			if(ap.createSlot(s) && ap.registerPatient(pt) && ap.bookApnt())
				return "booked";
		}
		else if(p.equals("oct"))
		{
			System.out.println("entered oct slot creation..");
			if(oct.createSlot(s) && oct.registerPatient(pt) && oct.bookApnt())
				return "booked";
		}
		return "patients";
	
	}
	
	
	
	@RequestMapping(value="/docView",method=RequestMethod.GET)
	public String displayDoctors(Model model) {
		ArrayList<Doctor> doctors = docdao.getAllDoctors();
        model.addAttribute("doctors", doctors);
        return "DoctorPreview";
	}

	
	@RequestMapping(value="/doc",method=RequestMethod.GET)
	public String displayDoctors() {
		
        return "DoctorDetails";
	}
	
}
