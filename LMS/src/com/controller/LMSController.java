package com.controller;
import java.net.URI;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.models.Customer;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;
import com.service.AppService;

@Controller
public class LMSController {

	AppService dao;

	@Autowired
	public LMSController(AppService dao) {
		this.dao = dao;
	}

	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adm(HttpServletRequest request,HttpSession session) 
	{
		
		System.out.println("Entered adminpage.jsp "+request.getParameter("username")+" "+ request.getParameter("password")+" "+ request.getParameter("usertype"));
 		if(dao.checkUser(request.getParameter("username"), request.getParameter("password"),request.getParameter("usertype")))
 		{
 			UUID uuid = UUID.randomUUID();
 	        String randomKey = uuid.toString().replace("-", "");
 	        System.out.println("key in controller..."+randomKey);
 	        System.out.println("session id and host address is ..."+session.getId()+" "+request.getRemoteAddr());
 	        dao.sendData(session.getId(), randomKey, request.getRemoteAddr());
 			
			return "adminpage";
 		}
		return "error";
	}
	@RequestMapping(value = "/personaldetails", method = RequestMethod.GET)
	public String pd(HttpServletRequest request, HttpSession session) 
	{
		
		System.out.println("Entered personaldetails.jsp "+request.getParameter("username")+" "+ request.getParameter("password")+" "+ request.getParameter("usertype"));
 		if(dao.checkUser(request.getParameter("username"), request.getParameter("password"),request.getParameter("usertype")))
 		{
 			UUID uuid = UUID.randomUUID();
 	        String randomKey = uuid.toString().replace("-", "");
 	        System.out.println("key in controller..."+randomKey);
 	        System.out.println("session id and host address is ..."+session.getId()+" "+request.getRemoteHost());
 	        dao.sendData(session.getId(), randomKey, request.getRemoteAddr());
			return "personaldetails";
 		}
		return "error";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getAllEmployees() {

		return "login";
	}

	// @RequestMapping(value = "/sss", method = RequestMethod.GET)
	// public String save(@Validated Customer c,@Validated LoanApplication l,@Validated LoanApplicantNominee n, Model
	// model) {
	// System.out.println("hiii");
	// model.addAttribute("c",c);
	// model.addAttribute("l",l);
	// model.addAttribute("n",n);
	// return "preview";
	// }
	@RequestMapping(value = "/ld", method = RequestMethod.GET)
	public String sendLoanDetails(Model m) {
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		m.addAttribute("ld", al);
		return "loandetails";
	}

	@RequestMapping(value = "/savenew", method = RequestMethod.GET)
	public String saveNew(@Validated Customer c, @Validated LoanApplication l, @Validated LoanApplicantNominee n,
			Model model) {
		System.out.println(c.toString());
		System.out.println(l.toString());
		System.out.println(n.toString());
		System.out.println(1);
		dao.addC(c);
		System.out.println(2);
		l.setLnap_cust_id(c.getCust_id());
		n.setLnap_id(l.getLnap_id());
		dao.addLa(l);
		System.out.println(n.getLnap_id());
		dao.addN(n);
		System.out.println(4);
		return "personaldetails";
	}

	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public String getAppById(@Validated LoanApplication l, Model mm) 
	{
		dao.update(l);
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		mm.addAttribute("ld", al);
		return "loandetails";
	}

	
}
