package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.models.Customer;
import com.models.ExcelClass;
import com.models.LoanApplicantNominee;
import com.models.LoanApplication;
import com.models.Un;
import com.models.Users;
import com.service.AppService;
import com.utility.Authorisation;

@Controller
public class LMSController {
	
	@Autowired
	Authorisation au;

	AppService dao;

	@Autowired
	public LMSController(AppService dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getAllEmployees(Model model) {

		return "login";
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String errorPage() {

		return "error";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adm(HttpServletRequest request, HttpSession session, Model m) {
		
		if(au.checkUrl(request.getParameter("usertype"),"/admin","GET"))
		{

		System.out.println("Entered adminpage.jsp " + request.getParameter("username") + " "
				+ request.getParameter("password") + " " + request.getParameter("usertype"));
		if (dao.checkUser(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("usertype"))) {
			HttpSession hs = request.getSession();
			hs.setAttribute("uname", request.getParameter("username"));
			hs.setAttribute("pass", request.getParameter("password"));
			UUID uuid = UUID.randomUUID();
			String randomKey = uuid.toString().replace("-", "");
			System.out.println("key in controller..." + randomKey);
			System.out.println("session id and host address is ..." + session.getId() + " " + request.getRemoteAddr());
			dao.sendData(session.getId(), randomKey, request.getRemoteAddr());
			m.addAttribute("usertype", request.getParameter("usertype"));
			return "adminpage";
		}
		}
		return "error";
	}

	@RequestMapping(value = "/personaldetails", method = RequestMethod.GET)
	public String pd(HttpServletRequest request, HttpSession session) {
		if(au.checkUrl(request.getParameter("usertype"),"/personaldetails","GET"))
		{

		System.out.println("Entered personaldetails.jsp " + request.getParameter("username") + " "
				+ request.getParameter("password") + " " + request.getParameter("usertype"));
		if (dao.checkUser(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("usertype"))) {
			UUID uuid = UUID.randomUUID();
			HttpSession hs = request.getSession();
			hs.setAttribute("uname", request.getParameter("username"));
			hs.setAttribute("pass", request.getParameter("password"));
			String randomKey = uuid.toString().replace("-", "");
			System.out.println("key in controller..." + randomKey);
			System.out.println("session id and host address is ..." + session.getId() + " " + request.getRemoteHost());
			dao.sendData(session.getId(), randomKey, request.getRemoteAddr());
			return "personaldetails";
		}
		}
		return "error";
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
	@RequestMapping(value = "/adminld", method = RequestMethod.GET)
	public String sendLoanDetails(Un u, Model m, HttpSession session, HttpServletRequest request) {
		
		if(au.checkUrl(request.getParameter("usertype"),"/adminld","GET"))
		{
		
		
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		ArrayList<Users> uu = (ArrayList<Users>) dao.listAll1();
		int id = 0;

		HttpSession hs1 = request.getSession();
		hs1.setAttribute("ut", request.getParameter("usertype"));
		String user = "" + hs1.getAttribute("uname");
		String pass = "" + hs1.getAttribute("pass");
		for (Users uuu : uu) {
			if (uuu.getUser_name().equals(user) && uuu.getUser_pwd().equals(pass)) {
				id = uuu.getUser_id();
			}
		}
		m.addAttribute("ld", al);
		m.addAttribute("un", id);
		return "loandetails";
		}
		return "error";
	}

	@RequestMapping(value = "/adminld1", method = RequestMethod.GET)
	public String sendLoanDetails1(HttpServletRequest request, Model m) {
		
		if(au.checkUrl(request.getParameter("usertype"),"/adminld1","GET"))
		{
		
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		HttpSession hs1 = request.getSession();
		hs1.setAttribute("ut", request.getParameter("usertype"));
		m.addAttribute("ld", al);
		return "loandetails1";
		}
		return "error";
	}

	@RequestMapping(value = "/adminld2", method = RequestMethod.GET)
	public String sendLoanDetails2(HttpServletRequest request,Model m) {
		
		if(au.checkUrl(request.getParameter("usertype"),"/adminld2","GET"))
		{
		
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		m.addAttribute("ld", al);
		return "loandetails2";
		}
		return "error";
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
		System.out.println(c.getCust_id() + "hii");
		dao.addLa(l, n);

		System.out.println(l.getLnap_id());
		System.out.println(4);
		return "personaldetails";
	}

	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public String getAppById(@Validated LoanApplication l, Model mm) {
		dao.update(l);
		ArrayList<LoanApplication> al = (ArrayList<LoanApplication>) dao.listAll();
		mm.addAttribute("ld", al);
		return "loandetails";
	}

	@RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
	public void downloadExcel(HttpServletResponse response) throws IOException {
		List<LoanApplication> lapp = dao.listAll();
		Workbook workbook = ExcelClass.generateExcel(lapp);

		// Set the response headers for Excel download
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=loan_applicants.xlsx");

		// Write the workbook to the response output stream
		workbook.write(response.getOutputStream());
		workbook.close();
	}
}
