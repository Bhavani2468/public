package com.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getAllEmployees(Model model) {

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
		dao.addC(c);
		dao.addLa(l);
		dao.addN(n);
		return "personaldetails";
	}

}
