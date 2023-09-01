package task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import task.DAO.ApntDAO;
import task.DAO.ApntDAOoct;
import task.model.Patient;
import task.model.Slot;

@Controller
public class FrontController {
	
	@Autowired 
	public ApntDAO ap;
	
	@Autowired 
	public ApntDAOoct oct;
	
	@RequestMapping(value = "/res", method = RequestMethod.GET)
	public String inputt(Model model) {
		System.out.println(ap.adateList());
		model.addAttribute("dlist",ap.adateList());
	return "result";
	}

	
	@RequestMapping(value = "/october", method = RequestMethod.GET)
	public String inputOct(Model model)
	{
		System.out.println(oct.adateList());
		model.addAttribute("olist",oct.adateList());
		return "october";
	}
	
	@RequestMapping(value = "/slot", method = RequestMethod.GET)
	public String inputs(Model model) {
		System.out.println(ap.slotList());
	 model.addAttribute("slist",ap.slotList());
	 model.addAttribute("lastid",ap.lastSlotId());
	 
	 
	 System.out.println(oct.slotList());
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
	public String input(@ModelAttribute Patient p,@ModelAttribute Slot s,@RequestParam(name = "lastId") int lastId,
            @RequestParam(name = "buttonId") int buttonId,
            @RequestParam(name = "dateId") int dateId) {
		System.out.println("Patient is....."+p.getName()); 
		
		
		s.setLastId(lastId);
	    s.setButtonId(buttonId);
	    s.setDateId(dateId);

		System.out.println("Slot details is....."+s.getLastId()+" "+s.getButtonId()+" "+s.getDateId());
		
		if(ap.createSlot(s) && ap.registerPatient(p) && ap.bookApnt())
			return "booked";
		return "patients";
	
	}
	
}
