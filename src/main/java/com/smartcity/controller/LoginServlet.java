package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.smartcity.dao.BusinessDAO;
import com.smartcity.dao.InstitutionDAO;
import com.smartcity.dao.JobDAO;
import com.smartcity.dao.UserDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	UserDAO dao=new UserDAO();
	InstitutionDAO instiDao=new InstitutionDAO();
	BusinessDAO busiDao=new BusinessDAO();
	JobDAO jobDao=new JobDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		
		
		User user=dao.login(username, password);
		
		if(user!=null) {
			String userType=user.getUserType();
			HttpSession session=req.getSession();
			session.setAttribute("getId", user.getUserId());
			session.setAttribute("user", user);
			session.setAttribute("userName", user.getFullName());
			
			if(userType.equals("student")) {
				resp.sendRedirect("studentDashboard");
			}
			else if(userType.equals("tourist")) {
				resp.sendRedirect("tourist");
			}
			else if(userType.equals("business")) {
				resp.sendRedirect("business");
			}
			else if(userType.equals("job_seeker")) {
				resp.sendRedirect("jobseeker");
			}
			else if(userType.equals("admin")) {
				resp.sendRedirect("admin-dashboard");
				
			}
			
			
		}
		else {
			req.setAttribute("error", "Invalid username or password");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
