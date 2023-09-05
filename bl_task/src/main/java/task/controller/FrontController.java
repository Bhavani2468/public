package task.controller;

import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import task.DAO.ApntDAO;
import task.DAO.ApntDAOoct;
import task.DAO.DoctorsDAO;
import task.DAO.SlotsDAO;
import task.model.Doctor;
import task.model.DoctorSlot;
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
	
	
	
	
	
	
	
	@RequestMapping(value = "/amt2", method = RequestMethod.GET)
	public String input(@ModelAttribute Patient p,@RequestParam( name = "slotdate" ) Date sdate,@RequestParam(name = "did") int did ) {
		System.out.println("Patient is....."+p.getName()); 

		sdao.updateSlotCount(sdate,did);
		if(ap.registerPatient(p) && ap.bookApnt())
			return "payment";
		return "patients";
	
	}
	
	
	
	@Autowired
	public DoctorsDAO docdao;

	
	
	@Autowired 
	public SlotsDAO sdao;
	
	
	@RequestMapping(value = "/doctorslots", method = RequestMethod.GET)
	public String doctorslots(Model model ,@RequestParam(name = "did") int did)
	{
		sdao.updateDoctorSlots();
		ArrayList<DoctorSlot> slots = (ArrayList<DoctorSlot>)sdao.getGeneratedDoctorSlots(did);
		ArrayList<DoctorSlot>booked = (ArrayList<DoctorSlot>)sdao.checkBookedSlot(did);
		
		model.addAttribute("slots",slots);
		System.out.println("booked list is..."+booked);
		model.addAttribute("booked",booked);
		return "calender";
	}
	
	@RequestMapping(value = "/slots", method = RequestMethod.GET)
	public String slotsDisplay(Model model , @RequestParam(name="slotdate") String slotdate,@RequestParam(name = "did") int did)
	{
		ArrayList<Integer>count=new ArrayList<>();
		sdao.updateDoctorSlots();
		ArrayList<DoctorSlot> slots = (ArrayList<DoctorSlot>)sdao.getGeneratedDoctorSlots(did);
		for(int i=0;i<slots.size();i++)
		{
			
			if(slots.get(i).getSlotDate().toString().equals(slotdate))
				count.add(slots.get(i).getSlotCount());
			
		}
		System.out.println(count.size());
		model.addAttribute("scount",count);
		
		return "slots";
	}
	
	
	@RequestMapping(value = "/patients", method = RequestMethod.GET)
	public String inputPatients()
	{
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
	
	
	
	@PostMapping("/payment")
	@RequestMapping
	public String processPayment(@RequestBody Map<String, Object> data) throws RazorpayException {
		Double amount = Double.parseDouble((String) data.get("amount"));

		System.out.println("Received payment request for amount: " + amount);

		RazorpayClient razorpay = new RazorpayClient("rzp_test_4jwnZunhRo2Y9N", "QJKxF1QeJtOSTtYDINz0Hcyy");

		JSONObject orderRequest = new JSONObject();
		orderRequest.put("amount", amount * 100);
		orderRequest.put("currency", "INR");
		orderRequest.put("receipt", "vamsi_tax");

		Order orders = razorpay.Orders.create(orderRequest);
		System.out.println(orders);
		return orders.toString();
	}
}


