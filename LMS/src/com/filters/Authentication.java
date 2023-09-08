package com.filters;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;

import com.service.AppService;

@Order(1)
@WebFilter(
	    filterName = "Authentication",
	    urlPatterns = {"/admin.jsp", "/personaldetails.jsp"}
	)
public class Authentication extends HttpFilter implements Filter {
	private final AppService dao;

    @Autowired
    public Authentication(AppService dao) {
        this.dao = dao;
    }
	
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("Entered filter"+request.getParameter("username"));
		boolean x=(request.getParameter("username")!=null) && (request.getParameter("password")!=null);
		System.out.println("Entered filter"+x);

		
		if((request.getParameter("username")!=null) && (request.getParameter("password")!=null))
		{System.out.println("Entered");
			if(dao.checkUser(request.getParameter("username"),request.getParameter("password")))
			{
				UUID uuid = UUID.randomUUID();
		        String key = uuid.toString().replace("-", "");
		        
		        
		        HttpSession session = request.getSession();
		        String sessionId = session.getId();
		        String hostAddress = request.getRemoteAddr();
		        
		        System.out.println("Host address is "+hostAddress);
		        dao.sendData(sessionId,key,hostAddress);
		        
		        chain.doFilter(request, response);
			}
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	

}
